USE panama_leaks;

DROP TABLE IF EXISTS edges;
CREATE TABLE IF NOT EXISTS edges (
  node_1 INT,
  node_2 INT,
  relationship_type VARCHAR(50)
) ENGINE=innodb;


LOAD DATA INFILE '$PATH$/data/all_edges.csv'
    INTO TABLE edges
    FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 LINES
(node_1, relationship_type, node_2);