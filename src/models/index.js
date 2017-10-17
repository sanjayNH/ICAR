"use strict";
var Sequelize = require("sequelize");

var database = 'icar3',
host = 'mysql', 
username = 'root'

var sequelize = new Sequelize(database, username, null, {
host: host,
dialect: 'mysql',
logging: console.log('Query Logged')
})

var db = {};


let modules = [
  require('./OPRTNY.js'),
  require('./CLNT.js'),
  require('./CLNT_GRP.js')
];

  // Initialize db
  modules.forEach((module) => {
    const model = module(sequelize, Sequelize);
    db[model.name] = model;
  });

  // Apply associations
  Object.keys(db).forEach((key) => {
    if ('associate' in db[key]) {
      db[key].associate(db);
    }
  });

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;