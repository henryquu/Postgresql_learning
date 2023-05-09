#!/bin/bash

PSQL="psql -U freecodecamp -d number_guess -t --no-align -c"

$PSQL "
	DROP TABLE IF EXISTS users;

	CREATE TABLE users(
		name VARCHAR(30) PRIMARY KEY,
		games_played INT DEFAULT 0,
		best_game INT DEFAULT 0
		);
"
