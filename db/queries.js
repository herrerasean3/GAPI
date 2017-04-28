//Loads pg-promise as a dependency for the script.
//Allows us to access our database via HTTP Requests.
let pgp = require('pg-promise')();
let connString = process.env.DATABASE_URL;
let db = pgp(connString);

//Runs SELECT * FROM meals.
//Returns everything in the table without filtering.
//Satisfies R in CRUD.
function getAllCast(req, res, next) {
  db.any('select * from castmember')
    .then(function(data) {
      console.log('DATA:', data);
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'All Characters Retrieved '
        });
    })
    .catch(function(err) {
      return next(err);
    });
}
//Parses the integer from the URL parameter.
//Then it SELECTs everything in the database with the parsed ID.
//Barring any errors with duplicate IDs, will always return exactly one result.
//Satisfies R in CRUD.
function getOneCast(req, res, next) {
  let mealID = parseInt(req.params.id);
  db.one('select * from castmember where id = $1', mealID)
    .then(function(data) {
      res.status(200)
        .json({
          status: 'success',
          data: data,
          message: 'One Character Was Retrieved'
        });
    })
    .catch(function(err) {
      return next(err);
    });
}

//Adds a new row to the table based on user specifications.
//Takes six inputs, since IDs are automatically generated.
//Satisfies C of CRUD.
function createCast(req, res, next) {
  req.body.age = parseInt(req.body.age);
  console.log('req.body ===>', req.body)
  db.none('insert into castmember(name, faction, mobile_weapon, voice_actor, appears_in)' +
      'values(${name}, ${faction}, ${mobile_weapon}, ${voice_actor}, ${appears_in})',
      req.body)
    .then(function() {
      res.status(200)
        .json({
          status: 'success',
          message: 'One Character Inserted'
        });
    })
    .catch(function(err) {
      return next(err);
    });
}

//Just as wordy as the one above.
//Allows the user to change content in a row to whatever.
//Takes seven total inputs, with the seventh input being the ID targetted for updating.
//Satisfies U of CRUD.
function updateCast(req, res, next) {
  db.none('update castmember set name=$1, faction=$2, mobile_weapon=$3, voice_actor=$4, appears_in=$5, where id=$7', [req.body.item, parseInt(req.body.minutes), parseInt(req.params.id)
    ])
    .then(function() {
      res.status(200)
        .json({
          status: 'success',
          message: 'Character Updated'
        });
    })
    .catch(function(err) {
      return next(err);
    });
}

//Deletes the row at the target ID. Simple enough.
//Satisfies D of CRUD.
function deleteCast(req, res, next) {
  let mealID = parseInt(req.params.id);
  db.result('delete from castmember where id = $1', mealID)
    .then(function(result) {
      res.status(200)
        .json({
          status: 'success',
          message: `Removed character at ${result.rowCount}`
        });
    })
    .catch(function(err) {
      return next(err);
    });
}

//CRUD
module.exports = {
  createCast: createCast, //CREATE
  getAllCast: getAllCast, //READ
  getOneCast: getOneCast,   //READ
  updateCast: updateCast,   //UPDATE
  deleteCast: deleteCast    //DELETE
};