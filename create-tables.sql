-- serial is a special data type in PostgreSQL. The column data type will just be an integer but in addition the database will automatically assign auto-incrementing numbers when new rows are inserted.
CREATE TABLE link (
	id serial PRIMARY KEY,
	name text NOT NULL,
	url text NOT NULL
);
CREATE TABLE tag (
	id serial PRIMARY KEY,
	name text NOT NULL
);
-- The link_tag table's primary key is composed of both its foreign keys since duplicate identical relationships should not be allowed.
CREATE TABLE link_tag (
	link_id int NOT NULL FOREIGN KEY REFERENCES link (id),
	tag_id int NOT NULL FOREIGN KEY REFERENCES tag (id),
	PRIMARY KEY (link_id, tag_id)
);