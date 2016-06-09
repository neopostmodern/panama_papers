USE panama_leaks;

DROP TABLE IF EXISTS countries;
CREATE TABLE IF NOT EXISTS countries (
  code VARCHAR(5),
  name VARCHAR(50),
  UNIQUE KEY (code)
) ENGINE=innodb
AS SELECT DISTINCT country_codes AS `code`, countries AS name FROM entities WHERE entities.country_codes NOT REGEXP '.*;.*';