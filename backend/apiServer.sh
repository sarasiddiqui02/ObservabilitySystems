
mkdir apiServer
cd apiServer

#install node
sudo apt update
sudo apt install nodejs -y
#echo node -v to check version

#Install express
sudo apt install npm
sudo npm install express pg

#assign password to postgres user
sudo -i -u postgres
#postgres@ubuntuDB:~$ psql
psql 

#postgres=# 
\password postgres

#Enter new password for user "postgres": 
password123
#Enter it again: 
#postgres=# 
exit
#postgres@ubuntuDB:~$ 
exit

#create index.js file in apiServer folder
nano index.js

#copy following in index.js
#--------------------Start index.js file---------------------------------#
const express = require('express');
const { Pool } = require('pg');

const app = express();

#Database connection details
const pool = new Pool({
  user: 'postgres',
  password: 'password123',
  host: 'ubuntuDB',
  database: 'nhl_players',
  port: 5432,
});

#Creating API endpoint for all records
app.get('/api/records', (req, res) => {
  pool.query('select * from players', (err, result) => {
    if (err) {
      console.error('Error executing query', err);
      res.status(500).json({ error: 'Internal server error' });
    } else {
      res.json(result.rows);
    }
  });
});


#Start the server
const port = 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
  
#-----------------------------End index.js file--------------------------#

#Close the file and run from the folder where it is located

#run server
node index.js

#Server listening on port 3000
#Go to browser and check the url http://192.168.64.12:3000/api/records
#Replace ip with IP of instance running API Server
#Output json should be returned [{"name":"SFO","team":"San Francisco"},{"name":"EDM","team":"Los Angeles"}]