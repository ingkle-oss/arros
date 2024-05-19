## Table

Stream records into arrow ipc stream server

# Run arrow ipc stream server for table

```bash
python3 server.py
```

# Add table pipeline

```bash
curl -X POST http://127.0.0.1:8888/pipelines/table -F 'file=@table.sql'
```

# Execute table pipeline

```bash
curl -X POST http://127.0.0.1:8888/pipelines/table/execute
```
