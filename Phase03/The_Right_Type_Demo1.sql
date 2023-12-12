create database if not exists TheRightType;
use TheRightType;

DROP TABLE IF EXISTS TheRightType;

CREATE TABLE Example (
myInt int,
myTinyInt tinyint,
mySmallInt smallint,
myMediumInt mediumint,
myDecimal decimal,
myFloat float
);
insert into Example (myInt, myTinyInt, mySmallInt, myMediumInt, myDecimal, myFloat)
values (3359000, 0, 50, 43000, 33.2, 5.983),
(190, -2, 120, 45, -3.9, 10.254),
(495, 1, 7, 568, 276.4, -96.892);