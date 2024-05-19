# Create a bucket for delta

```bash
mc config host add minio http://127.0.0.1:9000 arros eros1004
mc mb minio/delta
```

# Add delta pipeline

```bash
curl -X POST http://127.0.0.1:8888/pipelines/delta -F 'file=@delta.sql'
```

# Execute delta pipeline

```bash
curl -X POST http://127.0.0.1:8888/pipelines/delta/execute
```
