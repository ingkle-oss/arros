# Add count function

```bash
curl -X POST http://127.0.0.1:8888/functions/count -H 'language: python@inline' -F 'file=@count.py'
```

# List all functions

```bash
curl -X GET http://127.0.0.1:8888/functions | python3 -m json.tool
```

# Delete count function

```bash
curl -X DELETE http://127.0.0.1:8888/functions/count
```

# Add simple pipeline

```bash
curl -X POST http://127.0.0.1:8888/pipelines/simple -F 'file=@simple.sql'
```

# Execute simple pipeline

```bash
curl -X POST http://127.0.0.1:8888/pipelines/simple/execute
```
