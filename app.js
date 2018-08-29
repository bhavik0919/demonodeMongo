var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var bodyParser = require('body-parser');
var session = require('express-session');
var passport = require('./ctrl/auth');
var db = require('./db');
var indexRouter = require('./routes/index');
//var usersRouter = require('./routes/users');
var Common = require('./app/common');
_ = require('lodash');


moment = require('moment');
var app = express();

/**
 * List of API Files
 */

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(function (req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  res.setHeader('Access-Control-Allow-Methods', 'POST, GET, PATCH, DELETE');
  next();
});


app.use(logger('dev'));
app.use(bodyParser.json({ limit: '50mb' }));
app.use(bodyParser.urlencoded({ extended: true, limit: '50mb' }));
app.use(cookieParser());

app.use(session({
  secret: 'Prizma@Cog.123',
  cookie: { maxAge: 24 * 60 * 60 * 1000 },
  saveUninitialized: false,
  resave: true
}));
app.use(passport.initialize());
app.use(passport.session());

/**
 * List of API with routes
 */
app.use('/subscription', subscriptionAPI);

app.use(express.static(path.join(__dirname, './../dist')));

app.use('/', function (req, res) {
  res.sendFile(path.join(__dirname, './../dist/index.html'));
});


// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
