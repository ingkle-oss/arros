DROP TABLE IF EXISTS faker0;
DROP TABLE IF EXISTS buffer0;
CREATE UNBOUNDED EXTERNAL TABLE faker0 (t0 timestamp, i0 int, f0 float, s0 varchar) STORED AS FAKER WITH ORDER (s0 ASC) LOCATION 'faker0' OPTIONS ('messages' '100', 'interval' '100ms', 'batchsize' '1');
CREATE FUNCTION pycall(int) RETURNS bigint AS 'count';
CREATE UNBOUNDED EXTERNAL TABLE buffer0 (t0 timestamp, i0 bigint) STORED AS BUFFER location 'buffer0';
INSERT INTO buffer0 SELECT tumble(t0, '3s', '100ms'), pycall(i0) FROM faker0;