DROP TABLE IF EXISTS faker0;
DROP TABLE IF EXISTS delta0;
CREATE UNBOUNDED EXTERNAL TABLE faker0 (t0 timestamp, i0 int, f0 float, s0 varchar) STORED AS FAKER WITH ORDER (s0 ASC) LOCATION 'faker0' OPTIONS ('messages' '10000', 'interval' '100ms', 'batchsize' '10');
CREATE EXTERNAL TABLE delta0 (d0 date not null, i0 int, f0 float, s0 varchar) STORED AS DELTASINK LOCATION 's3://delta' PARTITIONED BY (d0) OPTIONS ('commit_interval' '3s', 'checkpoint_interval' '10');
INSERT INTO delta0 (d0, i0, f0, s0) SELECT CAST(t0 as date), i0, f0, s0 FROM faker0;