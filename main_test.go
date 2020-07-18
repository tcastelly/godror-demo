package main

import (
  "testing"
)

func TestSimpleQuery(t *testing.T) {
  err := SimpleQuery()
  if err != nil {
    t.Errorf("error: %v", err)
  }
}
