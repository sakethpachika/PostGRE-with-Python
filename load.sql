\c healthcare


\COPY mapping FROM '/Users/sakethpachika/Desktop/DBMS/Database/mapping.csv' DELIMITER ',' CSV HEADER

\COPY demographics FROM '/Users/sakethpachika/Desktop/DBMS/Database/demographics.csv' DELIMITER ',' CSV HEADER

\COPY rxdata FROM '/Users/sakethpachika/Desktop/DBMS/Database/rxdata.csv' DELIMITER ',' CSV HEADER

\COPY targets FROM '/Users/sakethpachika/Desktop/DBMS/Database/targets.csv' DELIMITER ',' CSV HEADER

\COPY roster FROM '/Users/sakethpachika/Desktop/DBMS/Database/roster.csv' DELIMITER ',' CSV HEADER

\COPY activity FROM '/Users/sakethpachika/Desktop/DBMS/Database/activity.csv' DELIMITER ',' CSV HEADER
