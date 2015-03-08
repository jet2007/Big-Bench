--Identify the stores with flat or declining sales in 3 consecutive months,
--check if there are any negative reviews regarding these stores available online.

-- Resources



-- Result file configuration
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}1;
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}2;
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}3;
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}4;
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}5;
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}6;
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}7;
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}8;
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}9;
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}10;
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}11;
DROP TABLE IF EXISTS ${hiveconf:MATRIX_BASENAME}12;


CREATE TABLE ${hiveconf:MATRIX_BASENAME}1 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}1'
;

CREATE TABLE ${hiveconf:MATRIX_BASENAME}2 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}2'
;

CREATE TABLE ${hiveconf:MATRIX_BASENAME}3 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}3'
;

CREATE TABLE ${hiveconf:MATRIX_BASENAME}4 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}4'
;

CREATE TABLE ${hiveconf:MATRIX_BASENAME}5 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}5'
;

CREATE TABLE ${hiveconf:MATRIX_BASENAME}6 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}6'
;

CREATE TABLE ${hiveconf:MATRIX_BASENAME}7 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}7'
;

CREATE TABLE ${hiveconf:MATRIX_BASENAME}8 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}8'
;

CREATE TABLE ${hiveconf:MATRIX_BASENAME}9 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}9'
;

CREATE TABLE ${hiveconf:MATRIX_BASENAME}10 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}10'
;

CREATE TABLE ${hiveconf:MATRIX_BASENAME}11 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}11'
;

CREATE TABLE ${hiveconf:MATRIX_BASENAME}12 (d BIGINT, sales BIGINT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' 
STORED AS TEXTFILE LOCATION '${hiveconf:MATRIX_BASEDIR}12'
;
  


FROM (
  SELECT 
    ss_store_sk    AS store,
    ss_sold_date_sk  AS d,
    sum(ss_net_paid) AS sales
  FROM store_sales s
  --select date range
  LEFT SEMI JOIN (  
      SELECT d_date_sk 
      FROM  date_dim d
      WHERE d.d_date >= '${hiveconf:q18_startDate}'
      AND   d.d_date <= '${hiveconf:q18_endDate}'
    ) dd ON ( s.ss_sold_date_sk=dd.d_date_sk ) 
  GROUP BY ss_store_sk, ss_sold_date_sk
) tmp
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}1  SELECT d, sales WHERE store = 1
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}2  SELECT d, sales WHERE store = 2
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}3  SELECT d, sales WHERE store = 3
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}4  SELECT d, sales WHERE store = 4
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}5  SELECT d, sales WHERE store = 5
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}6  SELECT d, sales WHERE store = 6
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}7  SELECT d, sales WHERE store = 7
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}8  SELECT d, sales WHERE store = 8
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}9  SELECT d, sales WHERE store = 9
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}10 SELECT d, sales WHERE store = 10
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}11 SELECT d, sales WHERE store = 11
INSERT OVERWRITE TABLE ${hiveconf:MATRIX_BASENAME}12 SELECT d, sales WHERE store = 12
;
