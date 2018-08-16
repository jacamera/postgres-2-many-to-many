CREATE TABLE link (
	id serial PRIMARY KEY,
	name text NOT NULL,
	url text NOT NULL
);
CREATE TABLE tag (
	id serial PRIMARY KEY,
	name text NOT NULL
);
CREATE TABLE link_tag (
	link_id int NOT NULL REFERENCES link (id),
	tag_id int NOT NULL REFERENCES tag (id),
	PRIMARY KEY (link_id, tag_id)
);