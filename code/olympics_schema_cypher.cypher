:param {
  // Define the file path root and the individual file names required for loading.
  // https://neo4j.com/docs/operations-manual/current/configuration/file-locations/
  file_path_root: 'file:///', // Change this to the folder your script can access the files at.
  file_0: 'olympics_dataset.csv'
};

// CONSTRAINT creation
// -------------------
//
// Create node uniqueness constraints, ensuring no duplicates for the given node label and ID property exist in the database. This also ensures no duplicates are introduced in future.
//
// NOTE: The following constraint creation syntax is generated based on the current connected database version 2025.6.0.
CREATE CONSTRAINT `Name_ATHLETES_uniq` IF NOT EXISTS
FOR (n: `ATHLETES`)
REQUIRE (n.`Name`) IS UNIQUE;
CREATE CONSTRAINT `Year_YEAR_uniq` IF NOT EXISTS
FOR (n: `YEAR`)
REQUIRE (n.`Year`) IS UNIQUE;
CREATE CONSTRAINT `NOC_NOC_uniq` IF NOT EXISTS
FOR (n: `NOC`)
REQUIRE (n.`NOC`) IS UNIQUE;
CREATE CONSTRAINT `Sport_SPORT_uniq` IF NOT EXISTS
FOR (n: `SPORT`)
REQUIRE (n.`Sport`) IS UNIQUE;
CREATE CONSTRAINT `Medal_MEDAL_uniq` IF NOT EXISTS
FOR (n: `MEDAL`)
REQUIRE (n.`Medal`) IS UNIQUE;

:param {
  idsToSkip: []
};

// NODE load
// ---------
//
// Load nodes in batches, one node label at a time. Nodes will be created using a MERGE statement to ensure a node with the same label and ID property remains unique. Pre-existing nodes found by a MERGE statement will have their other properties set to the latest values encountered in a load file.
//
// NOTE: Any nodes with IDs in the 'idsToSkip' list parameter will not be loaded.
LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row
WHERE NOT row.`Name` IN $idsToSkip AND NOT row.`Name` IS NULL
CALL {
  WITH row
  MERGE (n: `ATHLETES` { `Name`: row.`Name` })
  SET n.`Name` = row.`Name`
  SET n.`player_id` = row.`player_id`
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row
WHERE NOT row.`Year` IN $idsToSkip AND NOT toInteger(trim(row.`Year`)) IS NULL
CALL {
  WITH row
  MERGE (n: `YEAR` { `Year`: toInteger(trim(row.`Year`)) })
  SET n.`Year` = toInteger(trim(row.`Year`))
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row
WHERE NOT row.`NOC` IN $idsToSkip AND NOT row.`NOC` IS NULL
CALL {
  WITH row
  MERGE (n: `NOC` { `NOC`: row.`NOC` })
  SET n.`NOC` = row.`NOC`
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row
WHERE NOT row.`Sport` IN $idsToSkip AND NOT row.`Sport` IS NULL
CALL {
  WITH row
  MERGE (n: `SPORT` { `Sport`: row.`Sport` })
  SET n.`Sport` = row.`Sport`
  SET n.`Event` = row.`Event`
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row
WHERE NOT row.`Medal` IN $idsToSkip AND NOT row.`Medal` IS NULL
CALL {
  WITH row
  MERGE (n: `MEDAL` { `Medal`: row.`Medal` })
  SET n.`Medal` = row.`Medal`
} IN TRANSACTIONS OF 10000 ROWS;


// RELATIONSHIP load
// -----------------
//
// Load relationships in batches, one relationship type at a time. Relationships are created using a MERGE statement, meaning only one relationship of a given type will ever be created between a pair of nodes.
LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `ATHLETES` { `Name`: row.`Name` })
  MATCH (target: `NOC` { `NOC`: row.`NOC` })
  MERGE (source)-[r: `IN_COUNTRY`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `ATHLETES` { `Name`: row.`Name` })
  MATCH (target: `SPORT` { `Sport`: row.`Sport` })
  MERGE (source)-[r: `ATTEND_SPORT`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `ATHLETES` { `Name`: row.`Name` })
  MATCH (target: `YEAR` { `Year`: toInteger(trim(row.`Year`)) })
  MERGE (source)-[r: `ATTEND_YEAR`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `ATHLETES` { `Name`: row.`Name` })
  MATCH (target: `MEDAL` { `Medal`: row.`Medal` })
  MERGE (source)-[r: `ATHLETE_MEDAL`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `NOC` { `NOC`: row.`NOC` })
  MATCH (target: `MEDAL` { `Medal`: row.`Medal` })
  MERGE (source)-[r: `COUNTRY_MEDAL`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `NOC` { `NOC`: row.`NOC` })
  MATCH (target: `SPORT` { `Sport`: row.`Sport` })
  MERGE (source)-[r: `COUNTRY_ATTEND_SPORT`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;

LOAD CSV WITH HEADERS FROM ($file_path_root + $file_0) AS row
WITH row 
CALL {
  WITH row
  MATCH (source: `NOC` { `NOC`: row.`NOC` })
  MATCH (target: `YEAR` { `Year`: toInteger(trim(row.`Year`)) })
  MERGE (source)-[r: `COUNTRY_ATTEND_YEAR`]->(target)
} IN TRANSACTIONS OF 10000 ROWS;
