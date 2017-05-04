\c gandamu

INSERT INTO factionList (faction_name)
VALUES
('Civilian'),
('Earth Federation'),
('Principality of Zeon'),
('TITANS'),
('Axis Zeon'),
('Anti Earth Union Group'),
('Londo Bell'),
('Newborn Neo Zeon'),
('The Sleeves'),
('Neo Japan'),
('Neo America'),
('Neo China'),
('Neo France'),
('Neo Russia'),
('Shuffle Alliance');

INSERT INTO seriesEra (era_name)
VALUES
('Universal Century'),
('Future Century'),
('After Colony'),
('After War'),
('Correct Century'),
('Cosmic Era'),
('Anno Domini'),
('Gunpla Builders'),
('Advanced Generation'),
('Reglid Century'),
('Post Disaster'),
('Build Fighters'),
('SD Gundam');

INSERT INTO serieslist (series_title,series_era)
VALUES
('Mobile Suit Gundam', 1),
('Mobile Suit Zeta Gundam', 1),
('Mobile Suit Gundam ZZ', 1),
('Mobile Suit Gundam 0080: War in the Pocket', 1),
('Mobile Suit Gundam 0083: Stardust Memory', 1),
('Mobile Suit Victory Gundam', 1),
('Mobile Suit Gundam: The 08th MS Team', 1),
('Mobile Suit Gundam MS IGLOO: Apocalypse 0079', 1),
('Mobile Suit Gundam MS IGLOO 2: The Gravity Front', 1),
('Mobile Suit Gundam Unicorn', 1),
('Mobile Fighter: G Gundam', 2),
('New Mobile Report Gundam Wing', 3),
('Mobile Suit Gundam Wing: Operation Meteor', 3),
('New Mobile Report Gundam Wing: Endless Waltz', 3),
('After War Gundam X', 4),
('Turn A Gundam', 5),
('Mobile Suit Gundam SEED', 6),
('Mobile Suit Gundam Seed MSV Astray', 6),
('Mobile Suit Gundam SEED Destiny', 6),
('Mobile Suit Gundam SEED C.E. 73 Stargazer', 6),
('Mobile Suit Gundam 00',7),
('Model Suit Gunpla Builders Beginning G',8),
('Mobile Suit Gundam AGE',9),
('Gundam Reconguista in G', 10),
('Mobile Suit Gundam IRON-BLOODED ORPHANS', 11),
('Gundam Build Fighters', 12),
('Gundam Build Fighters Try', 12),
('Super Deformed Gundam', 13),
('Superior Defender Gundam Force', 13);

INSERT INTO manufacturer (manufacturer_name)
VALUES
('None/Not Available'),
('Earth Federation'),
('Zeonic'),
('Principality of Zeon'),
('Project V'),
('Hervic Company'),
('Neo Japan'),
('Neo America'),
('Neo China'),
('Neo France'),
('Neo Russia');

INSERT INTO mobileweapon (model, manufacturer, produced_in)
VALUES
('None/Not Available', 1, 1),
('RX-78-2 Gundam', 5, 1),
('RX-75-4 Guntank', 2, 1),
('RX-77-2 Guncannon', 2, 1),
('FF-X7 Core Fighter', 6, 1),
('MS-06S Zaku II Commander Type', 3, 1),
('HT-01B Magella Attack', 4, 1),
('MA-08 Big Zam', 4, 1),
('DFA-03 Dopp', 4, 1),
('RX-78NT-1 Gundam ''Alex''', 2, 4),
('GF13-017NJ Shining Gundam', 7, 11),
('GF13-006NA Gundam Maxter', 8, 11),
('GF13-011NC Dragon Gundam', 9, 11);

INSERT INTO voiceactor (english_voice, japanese_voice)
VALUES
('Brad Swaile','Tōru Furuya'),
('Chris Kalhoon', 'Hirotaka Suzuoki'),
('Matt Smith', 'Kiyonobu Suzuki'),
('Richard Ian Cox', 'Toshio Furukawa'),
('Ward Perry', 'Shōzō Iizuka'),
('Alaina Burnett', 'Yō Inoue'),
('Bill Mondy', 'Tesshô Genda'),
('Michael Kopsa','Shūichi Ikeda'),
('Lenore Zann', 'Yumi Nakatani'),
('French Tickner', 'Daisuke Gōri'),
('Brian Dobson', 'Katsuji Mori'),
('Wendee Lee', 'Megumi Hayashibara'),
('Mark Gatha', 'Tomokazu Seki'),
('Roger Rhodes', 'Hōchū Ōtsuka'),
('Zoe Slusar', 'Kappei Yamaguchi');

INSERT INTO castmember (cast_name, faction, mobile_weapon, voice_actor, appears_in)
VALUES
('Amuro Ray', 2, 2, 1, 1),
('Bright Noa', 2, 1, 2, 1),
('Hayato Kobayashi', 2, 3, 3, 1),
('Kai Shiden', 2, 4, 4, 1),
('Ryu Jose', 2, 5, 5, 1),
('Sayla Mass', 2, 5, 6, 1),
('Sleggar Law', 2, 5, 7, 1),
('Char Aznable', 3, 6, 8, 1),
('Crowley Hamon', 3, 7, 9, 1),
('Dozle Zabi', 3, 8, 10, 1),
('Garma Zabi', 3, 9, 11, 1),
('Christina Mackenzie', 2, 10, 12, 4),
('Domon Kasshu', 10, 11, 13, 11),
('Chibodee Crocket', 11, 12, 14, 11),
('Sai Saici', 12, 13, 15, 11);

/* castmember.cast_id, castmember.cast_name, factionList.faction_name, mobileweapon.model, manufacturer.manufacturer_name, voiceactor.english_voice_voice, voiceactor.japanese_voice, serieslist.series_title, seriesEra.era_name */

DROP VIEW IF EXISTS compiled;
CREATE VIEW compiled
AS
SELECT *
FROM seriesEra, serieslist, mobileweapon, manufacturer
WHERE (manufacturer.manufacturer_id = mobileweapon.manufacturer)
AND (serieslist.series_id = mobileweapon.produced_in)
AND (seriesEra.era_id = serieslist.series_era)
ORDER BY mobileweapon_id ASC;

DROP VIEW IF EXISTS compiled;
CREATE VIEW compiled
AS
SELECT *
FROM castmember, factionList, seriesEra, serieslist, mobileweapon, manufacturer, voiceactor
WHERE (factionList.faction_id = castmember.faction) 
AND (mobileweapon.mobileweapon_id = castmember.mobile_weapon)
AND (manufacturer.manufacturer_id = mobileweapon.manufacturer)
AND (voiceactor.voice_id = castmember.voice_actor)
AND (serieslist.series_id = castmember.appears_in)
AND (seriesEra.era_id = serieslist.series_era)
ORDER BY cast_id ASC;