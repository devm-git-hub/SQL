require('dotenv').config();
const { faker } = require('@faker-js/faker');
const mysql = require('mysql2');
const express = require('express');
const app = express();
const path = require('path');
const methodOverride = require("method-override");

app.use(methodOverride("_method"));
app.use(express.urlencoded({extended: true}));
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


//Fetch and show total no of users
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

//Edit Route
app.get("/user/:id/edit", (req, res) => {
    let id = req.params.id;
    let q = `SELECT * FROM user WHERE id='${id}'`;
    try {
    connection.query(q, (err, results) => {
    if (err) throw err;
    res.render("edit.ejs", { user: results[0] });
    
});
}
catch (err) {
    console.log(err);
      res.send("Some error in DB");
}

});


// Update Route
app.patch("/user/:id", (req, res) => {
  const { id } = req.params;
  const { username, password } = req.body;
  const trimmedUsername = (username || "").trim();

  if (!trimmedUsername) {
    return res.status(400).send("Username cannot be empty");
  }

  connection.query("SELECT * FROM user WHERE id = ?", [id], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).send("Some error in DB");
    }
    if (results.length === 0) {
      return res.status(404).send("User not found");
    }

    const dbUser = results[0];
    if (password !== dbUser.password) {
      return res.status(401).send("Incorrect password");
    }

    connection.query(
      "UPDATE user SET username = ? WHERE id = ?",
      [trimmedUsername, id],
      (updateErr) => {
        if (updateErr) {
          console.error(updateErr);
          if (updateErr.code === "ER_DUP_ENTRY") {
            return res.status(409).send("Username already taken");
          }
          return res.status(500).send("Error updating username");
        }

        res.redirect("/user");
      }
    );
  });
});

app.listen(8080, () => {
  console.log('Server is running on port 8080');
});



