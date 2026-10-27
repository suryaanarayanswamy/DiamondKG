// DiamondKG - sample evaluation queries (Neo4j / Cypher)

// 1. Top 5 schools by number of coaches
MATCH (c:Coach)-[:STAFF_OF]->(s:School)
RETURN s.name AS school, count(DISTINCT c) AS numCoaches
ORDER BY numCoaches DESC, school
LIMIT 5;

// 2. Players by position
MATCH (p:Player)-[:PLAYS_POSITION]->(pos:Position)
RETURN pos.name AS Position, count(DISTINCT p) AS Players
ORDER BY Players DESC;

// 3. Top 10 majors
MATCH (p:Player)-[:MAJORING_IN]->(m:Major)
RETURN m.name AS Major, count(DISTINCT p) AS Players
ORDER BY Players DESC
LIMIT 10;

// 4. Players with a listed previous school, by current program
MATCH (p:Player)-[:PREVIOUS_SCHOOL]->(ps:PreviousSchool)
MATCH (p)-[:PLAYS_FOR]->(s:School)
RETURN s.name AS currentSchool, count(DISTINCT p) AS numTransferredPlayers
ORDER BY numTransferredPlayers DESC, currentSchool;
