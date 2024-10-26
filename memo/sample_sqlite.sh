#!/bin/bash

# データベースファイルのパスを指定
DB_FILE="kv_store.db"

# テーブルが存在しない場合は作成
sqlite3 "$DB_FILE" <<EOF
CREATE TABLE IF NOT EXISTS kv_store (
    key TEXT PRIMARY KEY,
    value TEXT
);
EOF

# 挿入するキーと値を指定
key="example_key"
value="example_value"

# キーと値をテーブルに挿入
sqlite3 "$DB_FILE" <<EOF
INSERT OR REPLACE INTO kv_store (key, value) VALUES ('$key', '$value');
EOF

# 挿入された値を確認（オプション）
sqlite3 "$DB_FILE" "SELECT * FROM kv_store WHERE key='$key';"
