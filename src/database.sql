CREATE DATABASE golf_tournament_api;

CREATE TABLE groups(
	group_id SERIAL PRIMARY KEY,
	group_name VARCHAR(250),
	draft_started BOOLEAN, 
	draft_type VARCHAR(250),
	scoring_type VARCHAR(250),
	tournament_id VARCHAR(250),
	year NUMERIC
);

CREATE TABLE group_members(
	group_member_id SERIAL PRIMARY KEY,
	group_id INT,
	drafting BOOLEAN,
	draft_order NUMERIC,
	team_name VARCHAR(250),
  CONSTRAINT fk_group FOREIGN KEY (group_id)
	REFERENCES groups(group_id)
);