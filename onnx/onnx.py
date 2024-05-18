import os
import numpy as np
from skimage import io
from skimage.transform import resize
import onnxruntime

results = []

for image in column0:
    input = resize(io.imread(image), (224, 224))

    input = np.expand_dims(np.array(input, dtype=np.float32), axis=0)
    input = np.array(np.repeat(input, 32, axis=0), dtype=np.float32)
    input = np.transpose(input, (0, 3, 1, 2))

    session = onnxruntime.InferenceSession(
        os.path.join(cwd, model), providers=[provider]
    )
    output = session.run([], {"input.1": input})

    output = np.array(output)
    output = output.reshape(-1)
    output = np.exp(output - np.max(output))
    output = output / output.sum(axis=0)
    output = output.tolist()
    output = np.argmax(output)

    results.append(output)
