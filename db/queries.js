//Loads pg-promise as a dependency for the script.
//Allows us to access our database via HTTP Requests.
let pgp = require('pg-promise')();
let connString = process.env.DATABASE_URL;
let db = pgp(connString);

//Runs SELECT * FROM meals.
//Returns everything in the table without filtering.
//Satisfies R in CRUD.
function getAllCast(req, res, next) {
  db.any('DROP VIEW IF EXISTS compiled; CREATE VIEW compiled AS SELECT * FROM castmember, factionList, seriesEra, serieslist, mobileweapon, manufacturer, voiceactor WHERE (factionList.faction_id = castmember.faction) AND (mobileweapon.mobileweapon_id = castmember.mobile_weapon) AND (manufacturer.manufacturer_id = mobileweapon.manufacturer) AND (voiceactor.voice_id = castmember.voice_actor) AND (serieslist.series_id = castmember.appears_in) AND (seriesEra.era_id = serieslist.series_era) ORDER BY cast_id ASC; select cast_name, faction_name, model, english_voice, japanese_voice, era_name from compiled')
    .then(function(data) {
      console.log('DATA:', data);
      res.status(200)
        .json({
          data: data
        });
    })
    .catch(function(err) {
      return next(err);
    });
}

function getAllMWeapons(req, res, next) {
  db.any('DROP VIEW IF EXISTS compiled; CREATE VIEW compiled AS SELECT * FROM mobileweapon, manufacturer, seriesEra, serieslist, WHERE (manufacturer.manufacturer_id = mobileweapon.manufacturer) AND (serieslist.series_id = mobileweapon.produced_in) AND (seriesEra.era_id = serieslist.series_era) ORDER BY mobileweapon_id ASC; select model, manufacturer_name, era_name from compiled where mobileweapon_id > 1')
    .then(function(data) {
      console.log('DATA:', data);
      res.status(200)
        .json({
          data: data
        });
    })
    .catch(function(err) {
      return next(err);
    });
}

function getAllManufacturers(req, res, next) {
  db.any('DROP VIEW IF EXISTS compiled; CREATE VIEW compiled AS SELECT * FROM manufacturer, mobileweapon, seriesEra, serieslist WHERE (manufacturer.manufacturer_id = mobileweapon.manufacturer) AND (serieslist.series_id = mobileweapon.produced_in) AND (seriesEra.era_id = serieslist.series_era) ORDER BY manufacturer_id ASC; select manufacturer_name, model, era_name from compiled')
    .then(function(data) {
      console.log('DATA:', data);
      res.status(200)
        .json({
          data: data
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
  let cast_id = parseInt(req.params.id);
  db.one('DROP VIEW IF EXISTS compiled; CREATE VIEW compiled AS SELECT * FROM castmember, factionList, seriesEra, serieslist, mobileweapon, manufacturer, voiceactor WHERE (factionList.faction_id = castmember.faction) AND (mobileweapon.mobileweapon_id = castmember.mobile_weapon) AND (manufacturer.manufacturer_id = mobileweapon.manufacturer) AND (voiceactor.voice_id = castmember.voice_actor) AND (serieslist.series_id = castmember.appears_in) AND (seriesEra.era_id = serieslist.series_era) ORDER BY cast_id ASC; select cast_name, faction_name, model, english_voice, japanese_voice, era_name from compiled where cast_id = $1', cast_id)
    .then(function(data) {
      res.status(200)
        .json({
          data: data
        });
    })
    .catch(function(err) {
      return next(err);
    });
}

function getOneMWeapon(req, res, next) {
  let mobileweapon_id = parseInt(req.params.id);
  db.one('DROP VIEW IF EXISTS compiled; CREATE VIEW compiled AS SELECT * FROM seriesEra, serieslist, mobileweapon, manufacturer WHERE (manufacturer.manufacturer_id = mobileweapon.manufacturer) AND (serieslist.series_id = mobileweapon.produced_in) AND (seriesEra.era_id = serieslist.series_era) ORDER BY mobileweapon_id ASC; select model, manufacturer_name, era_name from compiled where mobileweapon_id = $1', mobileweapon_id)
    .then(function(data) {
      res.status(200)
        .json({
          data: data
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
  db.none('insert into castmember(cast_name, faction, mobile_weapon, voice_actor, appears_in)' +
      'values(${cast_name}, ${faction}, ${mobile_weapon}, ${voice_actor}, ${appears_in})',
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

function createMWeapon(req, res, next) {
  req.body.age = parseInt(req.body.age);
  console.log('req.body ===>', req.body)
  db.none('insert into mobileweapon(model, manufacturer, produced_in)' +
      'values(${model}, ${manufacturer}, ${produced_in})',
      req.body)
    .then(function() {
      res.status(200)
        .json({
          status: 'success',
          message: 'Mobile Weapon Inserted'
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
  db.none('update castmember set cast_name=$1, faction=$2, mobile_weapon=$3, voice_actor=$4, appears_in=$5 where cast_id=$6', [req.body.cast_name, parseInt(req.body.faction), parseInt(req.body.mobile_weapon), parseInt(req.body.voice_actor), parseInt(req.body.appears_in), parseInt(req.params.id)
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

function updateMWeapon(req, res, next) {
  db.none('update mobileweapon set model=$1, manufacturer=$2, produced_in=$3 where mobileweapon_id=$4', [req.body.model, parseInt(req.body.manufacturer), parseInt(req.body.produced_in), parseInt(req.params.id)
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
  let castID = parseInt(req.params.id);
  db.result('delete from castmember where cast_id = $1', castID)
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

function deleteMWeapon(req, res, next) {
  let mobileweaponID = parseInt(req.params.id);
  db.result('delete from mobileweapon where mobileweapon_id = $1', mobileweaponID)
    .then(function(result) {
      res.status(200)
        .json({
          status: 'success',
          message: `Removed Mobile Weapon at ${result.rowCount}`
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
  deleteCast: deleteCast,    //DELETE
  getAllMWeapons: getAllMWeapons, //READ
  getOneMWeapon: getOneMWeapon, //READ
  createMWeapon: createMWeapon, //CREATE
  updateMWeapon: updateMWeapon, //UPDATE
  deleteMWeapon: deleteMWeapon, //DELETE
  getAllManufacturers: getAllManufacturers //READ
};