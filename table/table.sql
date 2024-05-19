DROP TABLE IF EXISTS faker0;
DROP TABLE IF EXISTS arrow0;
CREATE UNBOUNDED EXTERNAL TABLE faker0 (t0 timestamp, i0 int, f0 float, s0 varchar) STORED AS FAKER WITH ORDER (s0 ASC) LOCATION 'test0' OPTIONS ('messages' '1000', 'interval' '100ms', 'batchsize' '10');
CREATE UNBOUNDED EXTERNAL TABLE arrow0 (t0 timestamp, i0 int, f0 float, s0 varchar) STORED AS ARROW location 'http://host.docker.internal:8081';
INSERT INTO arrow0 SELECT t0, i0, f0, s0 FROM faker0;