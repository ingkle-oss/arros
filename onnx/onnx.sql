DROP TABLE IF EXISTS image0;
DROP TABLE IF EXISTS buffer0;
CREATE TABLE image0 (url varchar) AS VALUES
    ('https://images.dog.ceo/breeds/retriever-golden/n02099601_3004.jpg'),
    ('https://images.dog.ceo/breeds/eskimo/n02109961_18527.jpg'),
    ('https://images.dog.ceo/breeds/spitz-japanese/tofu.jpg');
LOAD 'model=resnet50:latest';
SET model='resnet50';
SET provider='CPUExecutionProvider';
CREATE FUNCTION pycall(varchar) RETURNS bigint AS 'onnx';
CREATE UNBOUNDED EXTERNAL TABLE buffer0 (url varchar, result bigint) STORED AS BUFFER location 'buffer0';
INSERT INTO buffer0 SELECT url, pycall(url) FROM image0;