#!/bin/bash

# Update the package lists
sudo apt update

# Install PostgreSQL
sudo apt install postgresql -y

# Start the PostgreSQL service
sudo systemctl start postgresql

# Enable the PostgreSQL service to start on boot
sudo systemctl enable postgresql

# Create the "nhl_players" database
sudo -u postgres psql -c "CREATE DATABASE nhl_players;"

# Optional: Create a PostgreSQL user for the database
# Replace 'username' and 'password' with desired values
sudo -u postgres psql -c "CREATE USER ubuntu WITH ENCRYPTED PASSWORD 'password';"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE nhl_players TO ubuntu;"

# Restart PostgreSQL to apply the changes
sudo systemctl restart postgresql

# Display the status of the PostgreSQL service
sudo systemctl status postgresql

# Create Table and Insert Data
sudo -u postgres psql -d nhl_players -c "
CREATE TABLE players (
  Id SERIAL PRIMARY KEY,
  name varchar(80),
  team varchar(80)
);

INSERT INTO players (name, team) VALUES ('EDM', 'Los Angeles');

SELECT * FROM players;
"
# Note: The psql command is executed with the -d option to specify the "nhl_players" database.
# The SQL commands to create the table, insert data, and select from the table are provided using the -c option.


