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
