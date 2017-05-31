# GAPI

<div style="text-align:center"><img src ="https://git.generalassemb.ly/herrerasean3/GAPI/blob/master/images/zeon_logo_transparent.png" /></div>

## What the heck is GAPI?

GAPI, or Gundam API, is an API devoted to the Gundam franchise with full range of CRUD support, built primarily using SQL.

When the API is accessed, it generates a view based on user search terms and serves the resulting view up as accessible content.

Supporing logins, valid users may create, edit, or delete entries in the actual database tables.

## Why GAPI?

GAPI started as me getting sidetracked a bit in a lab assignment, actually. Rather than make a basic Star Wars database, I decided I'd build one for something I was more passionate about. Following that lab assignment, I continued to work on the database on the side, continually building upon its functionality and depth of data. GAPI is a passion project, from one Real Robot fan to another.

## Project Timetable

Component | Estimated Time | Invested Time | % Complete | Actual Time 
--- | --- |--- |--- |---
Database Setup | 4 hours | 5 Minutes | 100% | 5 Minutes 
GET routes | 4 Hours | 4 Hours | 100% | 4 Hours
POST routes | 4 Hours | 4 Hours | 100% | 4 Hours
DELETE routes | 4 Hours | 1 Hour | 100% | 1 Hour
UPDATE routes | 4 Hours | 2 Hours | 100% | 2 Hours
Backend Scripts | 5 hours | 15 Hours | 100% | 15 Hours
Frontend Design | 2 Hours | 3 Hours | 100% | 3 Hours

## Database Schema

![A view is generated each time a GET request is made.](https://git.generalassemb.ly/herrerasean3/GAPI/blob/master/images/20170508_090808.jpg)

## Wireframing

![Concepted Page Layout](https://git.generalassemb.ly/herrerasean3/GAPI/blob/master/images/20170508_084406.jpg)

## Backend Code Sample

This is an copy of the code used to DROP, CREATE, and SELECT a view generated on a per-request basis. By generating a view from the database, we prevent casual users from accessing and potentially vandalising the database proper. A user authentication system has been planed to further limit access to limit PUT, POST, and DELETE requests.

```javascript

//Runs SELECT * FROM view.
//Returns everything in the table without filtering.
//Satisfies R in CRUD.
function getAllCast(req, res, next) {
  db.any('DROP VIEW IF EXISTS compiled; CREATE VIEW compiled AS SELECT * FROM castmember, factionList, seriesEra, serieslist, mobileweapon, manufacturer, voiceactor WHERE (factionList.faction_id = castmember.faction) AND (mobileweapon.mobileweapon_id = castmember.mobile_weapon) AND (manufacturer.manufacturer_id = mobileweapon.manufacturer) AND (voiceactor.voice_id = castmember.voice_actor) AND (serieslist.series_id = castmember.appears_in) AND (seriesEra.era_id = serieslist.series_era) ORDER BY cast_id ASC; select cast_name, faction_name, model, english_voice, japanese_voice, era_name from compiled')
    .then(function(data) {
      console.log('DATA:', data);
      res.status(200)
        console.log(data)
      res.render('result', {title:"Gundam API", data:data, datasolo: false});
    })
    .catch(function(err) {
      return next(err);
    });
}

```

## Technologies Used

* NodeJS
* Express
* pg-promise
* JQuery
* Postgres

## Resources Used:

* [How do I install my own fonts on Nodejs Server?](http://stackoverflow.com/questions/18369600/how-do-i-install-my-own-fonts-on-nodejs-server)
* [Amuro font by Pixel Sagas](http://www.fontspace.com/pixel-sagas/amuro)
* [Get URL and URL Parts in JavaScript](https://css-tricks.com/snippets/javascript/get-url-and-url-parts-in-javascript/)
* [Javascript redirect URL](http://www.rapidtables.com/web/dev/javascript-redirect.htm)
