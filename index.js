require('dotenv').config();
const { faker } = require('@faker-js/faker');
const mysql = require('mysql2');
const express = require('express');
const app = express();
const path = require('path');

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));


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


//Fetcg and show total no of users
app.get("/", (req, res) => {
    let q = 'SELECT count(*) FROM user';
    try {
    connection.query(q, (err, results) => {
    if (err) throw err;
    let count = results[0]["count(*)"];
    res.render("home.ejs", { count });
});
}
catch (err) {
    console.log(err);
      res.send("Some error in DB");
}}
);

//Show Route
app.get("/user", (req, res) => {
    let q = 'SELECT * FROM user';
    try {
    connection.query(q, (err, users) => {
    if (err) throw err;
    res.render("showuser.ejs", { users });
    
});
}
catch (err) {
    console.log(err);
      res.send("Some error in DB");
}
})


app.listen(8080, () => {
  console.log('Server is running on port 8080');
});
