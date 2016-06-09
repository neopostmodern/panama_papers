USE panama_leaks;

DROP TABLE IF EXISTS jurisdictions;
CREATE TABLE IF NOT EXISTS jurisdictions (
  code VARCHAR(5),
  name VARCHAR(50),
  UNIQUE KEY (code)
) ENGINE=innodb
AS SELECT DISTINCT jurisdiction as code, jurisdiction_description as name FROM entities WHERE entities.jurisdiction != 'XXX';

INSERT INTO jurisdictions VALUE ('XXX', 'Undetermined');