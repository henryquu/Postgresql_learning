PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

echo $($PSQL "
        DROP TABLE IF EXISTS teams, games;

        CREATE TABLE teams(
          team_id SERIAL PRIMARY KEY,
          name TEXT UNIQUE NOT NULL
        );


        CREATE TABLE games(
          game_id SERIAL PRIMARY KEY NOT NULL,
          year INT NOT NULL,
          round VARCHAR(30) NOT NULL,
          winner_id INT NOT NULL,
            FOREIGN KEY(winner_id)
            REFERENCES teams(team_id),
          opponent_id INT NOT NULL,
            FOREIGN KEY(opponent_id)
            REFERENCES teams(team_id),
          winner_goals INT NOT NULL,
          opponent_goals INT NOT NULL
        );
        "
      )