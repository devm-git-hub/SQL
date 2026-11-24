const { faker } = require('@faker-js/faker');
const mysql = require('mysql2');

// Create the connection to database
const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
});

// A simple SELECT query
try {
    connection.query("SHOW TABLES", (err, results) => {
    if (err) throw err;
    console.log(results);
});
}
catch (err) {
    console.log(err);
}

// Close the connection
connection.end();

let getRandomUser = () => {
  return {
    Id: faker.string.uuid(),
    username: faker.internet.username(),
    email: faker.internet.email(),
    password: faker.internet.password(),
  };
}