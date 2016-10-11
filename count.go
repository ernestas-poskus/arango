// Package arangolite provides a lightweight ArangoDB driver.
package arangolite

// Count -
type Count struct {
	name  string
	Count int64 `json:"count,omitempty"`
}

// NewCount -
func NewCount(colName string) *Count {
	return &Count{
		name: colName,
	}
}

// Description -
func (c *Count) Description() string {
	return "COUNT"
}

// Path -
// GET /_api/collection/{collection-name}/count
func (c *Count) Path() string {
	return "/_api/collection/" + c.name + "/count"
}

// Method - method to use when creating document
func (c *Count) Method() string {
	return "GET"
}

// Generate - return json
func (c *Count) Generate() []byte {
	return nil
}
