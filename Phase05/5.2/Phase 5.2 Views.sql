use MaristTask;

CREATE VIEW `LoginView` AS
SELECT UserID, Username, Password
FROM User;

CREATE VIEW `TaskManagementView` AS
SELECT u.UserID, u.Username, c.CalendarID, t.TaskID, t.Title, t.Time, t.Duration, t.Description
FROM User u
JOIN Calendar c ON u.UserID = c.UserID
JOIN Task t ON u.UserID = t.UserID AND c.CalendarID = t.Calendar_CalendarID;

CREATE VIEW `UserSettingsView` AS
SELECT UserID, Mode, NotificationSettings
FROM UserSettings;
