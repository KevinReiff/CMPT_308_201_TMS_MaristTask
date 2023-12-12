CREATE DATABASE IF NOT EXISTS RedFoxTask;
USE RedFoxTask;

-- Create the User table
CREATE TABLE IF NOT EXISTS User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(45) NOT NULL,
    Password VARCHAR(45) NOT NULL,
    Name VARCHAR(45) NOT NULL,
    Address VARCHAR(45),
    PhoneNumber VARCHAR(45),
    Birthday DATE
);

-- Create the User Settings table
CREATE TABLE IF NOT EXISTS UserSettings (
    SettingsID INT PRIMARY KEY,
    UserID INT,
    Mode VARCHAR(45),
    NotificationSettings TEXT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create the Calendar table
CREATE TABLE IF NOT EXISTS Calendar (
    CalendarID INT PRIMARY KEY,
    UserID INT,
    Mode INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create the Task table
CREATE TABLE IF NOT EXISTS Task (
    TaskID INT PRIMARY KEY,
    UserID INT,
    Title VARCHAR(45) NOT NULL,
    Time TIMESTAMP,
    Duration INT,
    Description TEXT,
    Calendar_CalendarID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (Calendar_CalendarID) REFERENCES Calendar(CalendarID)
);

-- Create the User Alert table
CREATE TABLE IF NOT EXISTS UserAlert (
    AlertID INT PRIMARY KEY,
    UserID INT,
    AlertMessage TEXT,
    Alert_Info_AlertID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create the User Login table
CREATE TABLE IF NOT EXISTS UserLogin (
    LoginID INT PRIMARY KEY,
    UserID INT,
    LoginTime TIMESTAMP,
    LogoutTime TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create the Alert Info table
CREATE TABLE IF NOT EXISTS AlertInfo (
    AlertID INT PRIMARY KEY,
    UserID INT,
    AlertHistory TEXT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

-- Create the Admin table
CREATE TABLE IF NOT EXISTS Admin (
    AdminID INT PRIMARY KEY,
    Username VARCHAR(45) NOT NULL,
    Password VARCHAR(45) NOT NULL,
    Name VARCHAR(45) NOT NULL,
    Certification VARCHAR(45),
    PhoneNumber VARCHAR(45)
);

-- Create the Admin Login table
CREATE TABLE IF NOT EXISTS AdminLogin (
    LoginID INT PRIMARY KEY,
    AdminID INT,
    LoginTime TIMESTAMP,
    LogoutTime TIMESTAMP,
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

-- Create the Admin Settings table
CREATE TABLE IF NOT EXISTS AdminSettings (
    SettingsID INT PRIMARY KEY,
    AdminID INT,
    Mode VARCHAR(45),
    NotificationSettings TEXT,
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

-- Create the Security table
CREATE TABLE IF NOT EXISTS Security (
    SecurityID INT PRIMARY KEY,
    AdminID INT,
    UserLog TEXT,
    UserHistory TEXT,
    ActiveUserTracker INT,
    FailedPasswordCount INT,
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);

