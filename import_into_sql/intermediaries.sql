USE panama_leaks;

DROP TABLE IF EXISTS intermediaries;
CREATE TABLE IF NOT EXISTS intermediaries (
  name VARCHAR(100),
  internal_id INT,
  address VARCHAR(300),
  valid_until VARCHAR(200),
  country_codes VARCHAR(100),
  countries VARCHAR(100),
  status VARCHAR(100),
  node_id INT,
  sourceID VARCHAR(100)
) ENGINE=innodb;


LOAD DATA INFILE '$PATH$/data/Intermediaries.csv'
    INTO TABLE intermediaries
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
(name, @internal_id_raw, address, valid_until, country_codes, countries, status, node_id, sourceID);