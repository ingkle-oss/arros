## Onnx

Classify images using resnet50 model from kafka's topic which is produced by minio (s3)

# Add onnx function

```bash
curl -X POST http://127.0.0.1:8888/functions/onnx -H 'language: python' -H 'packages: numpy,scikit-image,onnxruntime' -F 'file=@onnx.py'
```

# Add resnet50 model

```bash
curl -X POST http://127.0.0.1:8888/objects -H 'Content-Type: application/json' --json '{"name": "resnet50", "category": "model", "filetype": "onnx"}'
```

# Upload resnet50 model

```bash
curl -X POST http://127.0.0.1:8888/objects/resnet50/versions -F 'file=@resnet50.onnx'
```

# Add onnx pipeline

```bash
curl -X POST http://127.0.0.1:8888/pipelines/onnx -F 'file=@onnx.sql'
```

# Execute onnx pipeline

```bash
curl -X POST http://127.0.0.1:8888/pipelines/onnx/execute
```

# Upload a image file

```bash
mc config host add minio http://127.0.0.1:9000 arros eros1004
mc cp [image file] minio/contents
```

# Fetch json results from onnx pipeline

```bash
curl -X POST http://127.0.0.1:8888/sql -H 'format: json' -d 'select * from buffer0'
```
