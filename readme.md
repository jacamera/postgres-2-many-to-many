# postgres-2-many-to-many
## Setup
1. Create the database: `psql --command='CREATE DATABASE many_to_many;'`
2. Open an interactive `psql` session with the database: `psql many_to_many`
2. Create the tables by executing the included SQL file

		many_to_many=# \include create-tables.sql
3. Populate the tables with the sample data

		many_to_many=# \include seed-data.sql
## Query
1. Start by selecting all the data from the `link` and `tag` tables separately

		many_to_many=# SELECT * FROM link;
		many_to_many=# SELECT * FROM tag;
2. Then join the `link_tag` table to the `link_table` using the foreign key

	(Queries can span multiple lines for increased readability)

		many_to_many=# SELECT *
		many_to_many-# FROM
		many_to_many-#  link
		many_to_many-#  JOIN link_tag ON link_tag.link_id = link.id;

	Notice all the duplicate entries since most links have multiple tags
3. Now we can join the `tag` table using the `tag_id` column from the `link_tag` table

		many_to_many=# SELECT *
		many_to_many-# FROM
		many_to_many-#  link
		many_to_many-#  JOIN link_tag ON link_tag.link_id = link.id
		many_to_many-#  JOIN tag ON tag.id = link_tag.tag_id;

4. Finally we can collapse those duplicate rows using the `GROUP BY` clause and the `array_agg` aggregate function

		many_to_many=# SELECT
		many_to_many-#  link.id,
		many_to_many-#  link.name,
		many_to_many-#  link.url,
		many_to_many-#  array_agg(tag.name) AS tags
		many_to_many-# FROM
		many_to_many-#  link
		many_to_many-#  JOIN link_tag ON link_tag.link_id = link.id
		many_to_many-#  JOIN tag ON tag.id = link_tag.tag_id
		many_to_many-# GROUP BY link.id;
## Exercises
1. List the tags ordered by the number of links that reference them

2. List the links ordered by the number of tags they have

3. List all links that have a specific tag
## Cleanup
1. Remove all the data from the tables

		many_to_many=# DELETE FROM link_tag;
		many_to_many=# DELETE FROM tag;
		many_to_many=# DELETE FROM link;
2. Drop the tables

		many_to_many=# DROP TABLE link_tag;
		many_to_many=# DROP TABLE tag;
		many_to_many=# DROP TABLE link;
3. Drop the database

	Quit the interactive session

		many_to_many=# \quit

	Drop the databse

		psql --command='DROP DATABASE many_to_many;'