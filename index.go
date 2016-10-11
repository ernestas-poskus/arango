package arango

import "encoding/json"

// INDEX

// BaseIndex creates a hash index in database.
type BaseIndex struct {
	CollectionName string   `json:"-"`
	Fields         []string `json:"fields,omitempty"`
	Unique         *bool    `json:"unique,omitempty"`
	Type           string   `json:"type,omitempty"`
	Sparse         *bool    `json:"sparse,omitempty"`
}

func (r *BaseIndex) Description() string {
	panic("Embed BaseIndex and override Description()")
	return ""
}

func (r *BaseIndex) Path() string {
	return "/_api/index?collection=" + r.CollectionName
}

func (r *BaseIndex) Method() string {
	return "POST"
}

func (r *BaseIndex) Generate() []byte {
	if r.Type == "" {
		panic("Embed BaseIndex and override Generate()")
	}
	m, _ := json.Marshal(r)
	return m
}

// HashIndex -
type HashIndex struct {
	BaseIndex
}

func (h *HashIndex) Description() string {
	return "CREATE HASH INDEX"
}

func (h *HashIndex) Generate() []byte {
	h.Type = "hash"
	m, _ := json.Marshal(h)
	return m
}

// PersistentIndex -
type PersistentIndex struct {
	BaseIndex
}

func (p *PersistentIndex) Description() string {
	return "CREATE PERSISTENT INDEX"
}

func (p *PersistentIndex) Generate() []byte {
	p.Type = "persistent"
	m, _ := json.Marshal(p)
	return m
}
