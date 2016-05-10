USE panama_leaks;

DROP TABLE IF EXISTS officers;
CREATE TABLE IF NOT EXISTS officers (
  name VARCHAR(210),
  icij_id CHAR(36), -- todo: looks like UUID
  valid_until VARCHAR(200),
  country_codes VARCHAR(120),
  countries VARCHAR(400),
  node_id INT,
  sourceID VARCHAR(100)
) ENGINE=innodb;


LOAD DATA INFILE '$PATH$/data/Officers.csv'
    INTO TABLE officers
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
(name, icij_id, valid_until, country_codes, countries, node_id, sourceID);