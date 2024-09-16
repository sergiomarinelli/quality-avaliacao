const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const clientRoutes = require("./routes/clientRoutes");
const sequelize = require("./database");

const app = express();

app.use(cors());
app.use(bodyParser.json());
app.use("/api", clientRoutes);

sequelize
  .sync()
  .then(() => {
    app.listen(3000, () => {
      console.log("Server is running on port 3000");
    });
  })
  .catch((err) => {
    console.error("Unable to connect to the database:", err);
  });

app.use((err, req, res, next) => {
  console.error("Internal server error:", err.message);
  res.status(500).json({ message: "Internal Server Error" });
});
