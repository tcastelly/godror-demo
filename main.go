package main

import (
  "context"
  "database/sql"
  "fmt"
  _ "github.com/godror/godror"
  "os"
)

type Config struct {
  OracleClientPath string

  Domain string

  SID string

  User string

  Password string
}

func main() {
  cfg := Config{
    OracleClientPath: os.Getenv("ORACLE_CLIENT_PATH"),

    Domain: os.Getenv("DB_CONNECT_HOST"),

    SID: os.Getenv("DB_CONNECT_SID"),

    User: os.Getenv("DB_CONNECT_USR"),

    Password: os.Getenv("DB_CONNECT_PWD"),
  }


  c := fmt.Sprintf("%s/%s@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=tcp)(HOST=%s)(PORT=1521)))(CONNECT_DATA=(SID=%s)))", cfg.User, cfg.Password, cfg.Domain, cfg.SID)

  connection, err := sql.Open(
    "godror",
    c,
  )
  if err != nil {
    panic(err)
  }

  ctx := context.Background()

  stmt, err := connection.PrepareContext(ctx, "SELECT 1 FROM DUAL")
  if err != nil {
    panic(err)
  }
  defer stmt.Close()

  if _, err := stmt.ExecContext(ctx); err != nil {
    panic(err)
  }
}
