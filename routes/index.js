var express = require('express');
var router = express.Router();

var db = require('../db/queries');

/* GET home page. */
/*router.get('/', function(req, res, next) {
  res.render('index', { title: 'Gundam API' });
});*/

router.get('/people/', db.getAllCast);
router.get('/people/:id', db.getOneCast);
router.post('/people/', db.createCast);
router.put('/people/:id', db.updateCast);
router.delete('/people/:id', db.deleteCast);

router.get('/mweapon/', db.getAllMWeapons);
router.get('/mweapon/:id', db.getOneMWeapon);
router.post('/mweapon/', db.createMWeapon);
router.put('/mweapon/:id', db.updateMWeapon);
router.delete('/mweapon/:id', db.deleteMWeapon);

router.get('/manufacturer/', db.getAllManufacturers);

module.exports = router;