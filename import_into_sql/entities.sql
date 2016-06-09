USE panama_leaks;

DROP TABLE IF EXISTS entities;
CREATE TABLE IF NOT EXISTS entities (
  name VARCHAR(200),
  original_name VARCHAR(200),
  former_name VARCHAR(200),
  jurisdiction VARCHAR(100),
  jurisdiction_description VARCHAR(100),
  company_type VARCHAR(100),
  address VARCHAR(300),
  internal_id VARCHAR(100),
  incorporation_date DATE,
  inactivation_date DATE,
  struck_off_date DATE,
  dorm_date DATE,
  status VARCHAR(100),
  service_provider VARCHAR(100),
  ibcRUC LONG, -- todo: maybe this should be a VARCHAR? what is it?
  country_codes VARCHAR(100),
  countries VARCHAR(100),
  note VARCHAR(500),
  valid_until VARCHAR(100),
  node_id INT,
  sourceID VARCHAR(100),
  PRIMARY KEY (node_id)
) ENGINE=innodb;


LOAD DATA INFILE '$PATH$/data/Entities.csv'
    INTO TABLE entities
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
(name, original_name, former_name, jurisdiction, jurisdiction_description, company_type, address, internal_id,
 @incorporation_date_raw, @inactivation_date_raw, @struck_off_date_raw, @dorm_date_raw, status, service_provider, @ibcRUC_raw, country_codes, countries,
 note, valid_until, node_id, sourceID)
SET
  incorporation_date = IF(@incorporation_date_raw = '', NULL, STR_TO_DATE(@incorporation_date_raw, '%d-%b-%Y')),
  inactivation_date = IF(CHAR_LENGTH(@inactivation_date_raw) > 0, STR_TO_DATE(@inactivation_date_raw, '%d-%b-%Y'), NULL),
  struck_off_date = IF(CHAR_LENGTH(@struck_off_date_raw) > 0, STR_TO_DATE(@struck_off_date_raw, '%d-%b-%Y'), NULL),
  dorm_date = IF(CHAR_LENGTH(@dorm_date_raw) > 0, STR_TO_DATE(@dorm_date_raw, '%d-%b-%Y'), NULL),
  ibcRUC = IF(@ibcRUC_raw REGEXP '^-?[0-9]+$', @ibcRUC_raw, NULL);