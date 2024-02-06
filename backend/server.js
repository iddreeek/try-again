const express = require('express');
const mysql = require('mysql');
const cors = require('cors');

const app = express();

app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'react_schedule',
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
  } else {
    console.log('Connected to MySQL database');
  }
});

app.get('/api/usersgroup', (req, res) => {
  const group_ID = req.query.group_ID;
  const query = `
  SELECT CONCAT(b.first_name, ' ', b.last_name) AS name, group_ID
  FROM user_group a
  JOIN users b ON a.user_ID = b.user_ID WHERE group_ID=?
`;
  db.query(query, [group_ID], (err, results, fields) => {
    if (err) {
      console.error('Error executing query:', err);
      res.status(500).send('Error fetching data from database');
    } else {
      res.json(results);
    }
  });
});

app.get('/api/events', (req, res) => {
    const query = 'SELECT * FROM events';
    db.query(query, (err, results) => {
      if (err) {
        console.error('Error executing query:', err);
        res.status(500).send('Error fetching data from database');
      } else {
        res.json(results);
      }
    });
  });

app.post('/api/events', (req, res) => {
    const { title, start, end } = req.body;

  // Assuming 'participants' is an array of participant names received in the request body

  // Perform the insertion into the 'events' table
  const query = 'INSERT INTO events (calendar_ID, title, start, end) VALUES (1, ?, ?, ?)';
  const values = [title, start, end];

  db.query(query, values, (error, results) => {
    if (error) {
      console.error('Error executing MySQL query:', error);
      return res.status(500).send('Error inserting data into the database');
    }

    const insertedEvent = {
      eventId: results.insertId,
      title,
      start,
      end,
    };

    res.json(insertedEvent);
  });
})

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
