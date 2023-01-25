const express = require("express");
require("express-async-errors");
const cors = require("cors");
const morgan = require("morgan");
const cookieParser = require("cookie-parser");
const routes = require("./routes");
const helmet = require("helmet");
const compression = require("compression");
const path = require("path");
//const unknownEndpoint = require("./middleware/unKnownEndpoint");
//const { handleError } = require("./helpers/error");

const app = express();
const corsOptions ={
    //origin:['http://localhost:3000', 'https://187f-2601-646-9401-2280-f0ee-476e-602c-c9.ngrok.io'], 
    origin: function(origin, callback){
      return callback(null, true);
    },
    credentials:true,            //access-control-allow-credentials:true
    optionSuccessStatus:200
}
app.set("trust proxy", 1);
app.use(cors(corsOptions));
app.use(express.json());
//app.use(morgan("dev"));
app.use(compression());
//app.use(helmet());
app.use(cookieParser());


if (process.env.NODE_ENV === "production") {
  app.use(express.static(path.join(__dirname, '../client/build')));
  app.get('/image', (req, res) => {
    res.sendFile(path.resolve(__dirname, '../client/build', 'index.html'));
  });
}

app.use("/api", routes);

app.get("/", (req, res) =>
  res.send("<h1 style='text-align: center'>E-COMMERCE API</h1>")
);
//app.use(unknownEndpoint);
//app.use(handleError);

module.exports = app;
