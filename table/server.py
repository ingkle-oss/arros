import argparse
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
from fastapi.middleware.gzip import GZipMiddleware
import uvicorn
import pyarrow as pa


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--host", help="listen host", default="0.0.0.0")
    parser.add_argument("--port", help="listen port", type=int, default=8081)
    args = parser.parse_args()

    app = FastAPI()
    app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_methods=["*"],
        allow_headers=["*"],
    )
    app.add_middleware(GZipMiddleware)

    @app.post("/")
    async def handle(request: Request):
        stream = await request.body()
        with pa.ipc.open_stream(stream) as reader:
            batch = next(reader)
            print(batch)
            return JSONResponse(content={"count": batch.num_rows})

    uvicorn.run(app, host=args.host, port=args.port)
