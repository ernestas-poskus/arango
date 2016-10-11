package arango

import (
	"bytes"
	"encoding/json"
	"strings"
)

// Transaction represents an ArangoDB transaction.
type Transaction struct {
	readCol, writeCol []string
	resultVars        []string
	queries           []Query
	returnVar         string
	bindVars          map[string]string
}

// NewTransaction returns a new Transaction object.
func NewTransaction(readCol, writeCol []string) *Transaction {
	if readCol == nil {
		readCol = []string{}
	}

	if writeCol == nil {
		writeCol = []string{}
	}

	return &Transaction{readCol: readCol, writeCol: writeCol}
}

// AddQuery adds a new AQL query to the transaction. The result will be set in
// a temp variable named after the value of "resultVar".
// To use it from elsewhere in the transaction, use the Go templating convention.
//
// e.g. NewTransaction([]string{}, []string{}).
//      AddQuery("var1", "FOR d IN documents RETURN d").
//      AddQuery("var2", "FOR d IN {{.var1}} RETURN d._id").Run(db)
//
func (t *Transaction) AddQuery(resultVar, aql string, params ...interface{}) *Transaction {
	t.resultVars = append(t.resultVars, resultVar)
	t.queries = append(t.queries, *NewQuery(toES6Template(aql), params...))
	return t
}

// Bind sets the name and value of a bind parameter
// Binding parameters prevents AQL injection
// Example:
// transaction := arangolite.NewTransaction([]string{}, []string{}).
// 		AddQuery("var1", "FOR d IN nodes FILTER d._key == @key RETURN d._id").
// 		AddQuery("var2", "FOR n IN nodes FILTER n._id == {{.var1}}[0] RETURN n._key").Return("var2")
// transaction.Bind("key", 123)
//
func (t *Transaction) Bind(name string, value interface{}) *Transaction {
	if t.bindVars == nil {
		t.bindVars = make(map[string]string)
	}
	m, _ := json.Marshal(value)
	t.bindVars[name] = strings.Replace(string(m), `"`, "'", -1)
	return t
}

// Return sets the final "resultVar" that is returned at the end of the transaction.
func (t *Transaction) Return(resultVar string) *Transaction {
	t.returnVar = resultVar
	return t
}

func (t *Transaction) Description() string {
	return "TRANSACTION"
}

func (t *Transaction) Path() string {
	return "/_api/transaction"
}

func (t *Transaction) Method() string {
	return "POST"
}

func (t *Transaction) Generate() []byte {
	type TransactionFmt struct {
		Collections struct {
			Read  []string `json:"read"`
			Write []string `json:"write"`
		} `json:"collections"`
		Action string `json:"action"`
	}

	transactionFmt := &TransactionFmt{}
	transactionFmt.Collections.Read = t.readCol
	transactionFmt.Collections.Write = t.writeCol

	jsFunc := bytes.NewBufferString("function () { var db = require('internal').db; ")

	for name, value := range t.bindVars {
		jsFunc.WriteString("var ")
		jsFunc.WriteString(name)
		jsFunc.WriteString(" = ")
		jsFunc.WriteString(value)
		jsFunc.WriteString("; ")
	}

	for i, query := range t.queries {
		writeQuery(jsFunc, query.aql, t.resultVars[i])
	}

	if len(t.returnVar) > 0 {
		jsFunc.WriteString("return ")
		jsFunc.WriteString(t.returnVar)
		jsFunc.WriteString(";")
	}

	jsFunc.WriteRune('}')

	transactionFmt.Action = jsFunc.String()
	jsonTransaction, _ := json.Marshal(transactionFmt)

	return jsonTransaction
}

// writeQuery translate a given aql query to bytes
// buff the buffer containing the resulting bytes
// aql the AQL query
// resultVarName the name of the variable that will accept the query result, if any - may be empty
func writeQuery(buff *bytes.Buffer, aql string, resultVarName string) {
	if len(resultVarName) > 0 {
		buff.WriteString("var ")
		buff.WriteString(resultVarName)
		buff.WriteString(" = ")
	}

	buff.WriteString("db._query(aqlQuery`")
	buff.WriteString(aql)
	buff.WriteString("`).toArray(); ")
}

func toES6Template(query string) string {
	buf := bytes.NewBuffer(nil)
	lookingForEnd := false

	for _, b := range query {
		if lookingForEnd {
			if b == ' ' || b == '\n' || b == ',' || b == ';' {
				lookingForEnd = false
				buf.WriteRune('}')
				buf.WriteRune(b)
				continue
			}
		} else {
			if b == '@' {
				lookingForEnd = true
				buf.WriteString("${")
				continue
			}
		}

		buf.WriteRune(b)
	}

	query = buf.String()

	query = strings.Replace(query, "{{.", "${", -1)
	return strings.Replace(query, "}}", "}", -1)
}
