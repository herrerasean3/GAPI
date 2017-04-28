var express = require('express');
var router = express.Router();

var db = require('../db/queries');

/* GET home page. */
/*router.get('/', function(req, res, next) {
  res.render('index', { title: 'Gundam API' });
});*/

router.get('/', db.getAllCast);
router.get('/:id', db.getOneCast);
router.post('/', db.createCast);
router.put('/:id', db.updateCast);
router.delete('/:id', db.deleteCast);

module.exports = router;