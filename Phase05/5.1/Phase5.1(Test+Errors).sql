use MaristTask;

-- Lines that cause errors (Testing contraints)
truncate UserSettings;
-- Line that would cause the  insertion error due to foreign key constraints
INSERT INTO UserSettings (SettingsID, UserID, Mode, NotificationSettings) VALUES
(11, 999, 'Dark', 'Email');

-- How to avoid this error:
-- Use these lines of code before and after the queries to temporarily turn off the checking process of foreign keys during  data insertion
set foreign_key_checks=0;
set foreign_key_checks=1;

-- Primary Key Constraint Test: Try to insert a record into the User table with an existing UserID.
INSERT INTO User (UserID, Username, Password, Name, Address, PhoneNumber, Birthday) VALUES
(1, 'newuser', 'newpass', 'New User', '131 Main St', '123-456-7898', '1991-11-11');

-- Foreign Key Constraint Test: Insert a record in UserSettings with a UserID that doesn't exist in the User table.
INSERT INTO UserSettings (SettingsID, UserID, Mode, NotificationSettings) VALUES
(11, 999, 'Dark', 'Email, SMS');

-- Data Type Constraint Test: Attempt to insert a non-date value into a date column in the User table
INSERT INTO User (UserID, Username, Password, Name, Address, PhoneNumber, Birthday) VALUES
(11, 'testuser', 'testpass', 'Test User', '132 Main St', '123-456-7899', 'not a date');

-- Unique Constraint Test: Assuming you have a unique constraint on a column (like Username in User table),
-- try inserting a duplicate username.
INSERT INTO User (UserID, Username, Password, Name, Address, PhoneNumber, Birthday) VALUES
(11, 'johndoe', 'uniquepass', 'Unique User', '133 Main St', '123-456-7800', '1992-12-12');


-- Lines that verify Tables Structures

SELECT * FROM User;
SELECT * FROM User WHERE Birthday > '1990-01-01' ORDER BY Birthday;
SELECT * FROM UserSettings;
SELECT User.Username, UserSettings.Mode FROM User INNER JOIN UserSettings ON User.UserID = UserSettings.UserID;
SELECT * FROM Calendar WHERE Mode = 1;
SELECT User.Name, Calendar.CalendarID FROM User RIGHT JOIN Calendar ON User.UserID = Calendar.UserID;
SELECT * FROM Task;
SELECT User.Name, Task.Title FROM User LEFT JOIN Task ON User.UserID = Task.UserID
UNION
SELECT User.Name, Task.Title FROM User RIGHT JOIN Task ON User.UserID = Task.UserID;
SELECT * FROM UserAlert ORDER BY AlertID DESC;
SELECT UserAlert.AlertMessage, User.Name FROM UserAlert INNER JOIN User ON UserAlert.UserID = User.UserID;