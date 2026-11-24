require('dotenv').config();
const { faker } = require('@faker-js/faker');
const mysql = require('mysql2');

// Create the connection to database
const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
});

let getRandomUser = () => {
  return [
    faker.string.uuid(),
    faker.internet.username(),
    faker.internet.email(),
    faker.internet.password(),
];
};

// A simple SELECT query
let q = "INSERT INTO user (id, username, email, password) VALUES ?";

let data = [];
for(let i = 1; i <=100; i++) {
    data.push(getRandomUser());  //100 fake users
}

try {
    connection.query(q, [data], (err, results) => {
    if (err) throw err;
    console.log(results);
});
}
catch (err) {
    console.log(err);
}

// Close the connection
connection.end();

