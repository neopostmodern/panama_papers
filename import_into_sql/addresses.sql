USE panama_leaks;

DROP TABLE IF EXISTS addresses;
CREATE TABLE IF NOT EXISTS addresses (
  address VARCHAR(300),
  icij_id CHAR(36), -- todo: looks like UUID
  valid_until VARCHAR(200),
  country_codes VARCHAR(100),
  countries VARCHAR(100),
  node_id INT,
  sourceID VARCHAR(100)
) ENGINE=innodb;


LOAD DATA INFILE '$PATH$/data/Addresses.csv'
    INTO TABLE addresses
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
(address, icij_id, valid_until, country_codes, countries, node_id, sourceID);