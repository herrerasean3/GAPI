\c gandamu

INSERT INTO factionList (faction_name)
VALUES
('Earth Federation'),
('Principality of Zeon'),
('TITANS'),
('Axis Zeon'),
('Anti Earth Union Group'),
('Londo Bell'),
('Newborn Neo Zeon'),
('Neo America');

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

INSERT INTO manufacturer (manufacturer_name)
VALUES
('Earth Federation'),
('Zeonic'),
('Project V'),
('Hervic Company'),
('Neo America');

INSERT INTO mobileweapon (model, manufacturer)
VALUES
('RX-78-2 Gundam', 3),
('RX-75-4 Guntank', 1),
('RX-77-2 Guncannon', 1),
('FF-X7 Core Fighter', 4),
('MS-06S Zaku II Commander Type', 2),
('HT-01B Magella Attack', 2),
('RX-78NT-1 Gundam "Alex"', 1),
('GF13-006NA Gundam Maxter', 5);

INSERT INTO voiceactor (english, japanese)
VALUES
('Brad Swaile','Tōru Furuya'),
('Matt Smith', 'Kiyonobu Suzuki'),
('Richard Ian Cox', 'Toshio Furukawa'),
('Ward Perry', 'Shōzō Iizuka'),
('Alaina Burnett', 'Yō Inoue'),
('Bill Mondy', 'Tesshô Genda'),
('Michael Kopsa','Shūichi Ikeda'),
('Lenore Zann', 'Yumi Nakatani'),
('Wendee Lee', 'Megumi Hayashibara'),
('Roger Rhodes', 'Hōchū Ōtsuka');

INSERT INTO serieslist (title,series_era)
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
('Mobile Figher: G Gundam', 2),
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

INSERT INTO castmember (name, faction, mobile_weapon, voice_actor, appears_in)
VALUES
('Amuro Ray', 1, 1, 1, 1),
('Hayato Kobayashi', 1, 2, 2, 1),
('Kai Shiden', 1, 3, 3, 1),
('Ryu Jose', 1, 4, 4, 1),
('Sayla Mass', 1, 4, 5, 1),
('Sleggar Law', 1, 3, 6, 1),
('Char Aznable', 2, 5, 7, 1),
('Crowley Hamon', 2, 6, 8, 1),
('Christina Mackenzie', 1, 7, 9, 4),
('Chibodee Crocket', 5, 8, 10, 11);
