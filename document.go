package arango

// Document represents a basic ArangoDB document
// Fields are pointers to allow null values in ArangoDB
type Document struct {
	// The document handle. Format: ':collection/:key'
	ID *string `json:"_id,omitempty"`
	// The document's revision token. Changes at each update.
	Rev *string `json:"_rev,omitempty"`
	// The document's unique key.
	Key *string `json:"_key,omitempty"`
}
