-- Create the SportsManagement database if it doesn't exist
DROP database if exists sportsmanagement;
CREATE DATABASE IF NOT EXISTS SportsManagement;

-- Give Privilages
DROP USER 'newuser'@'%';
CREATE USER 'newuser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'newuser'@'%';
ALTER USER 'newuser'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
FLUSH PRIVILEGES;


-- Use the SportsManagement database
USE SportsManagement;

-- User table
drop table if exists User;
CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Lastname VARCHAR(255) NOT NULL,
    MatrNumber VARCHAR(10) UNIQUE NOT NULL
);

-- Sport table
drop table if exists Sport;
CREATE TABLE Sport (
    SportID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Date VARCHAR(255),
    Time VARCHAR(255),
    Place VARCHAR(255),
    Price INT,
    TeacherID INT,
    AppliedForPlaces bool,
    FOREIGN KEY (TeacherID) REFERENCES User(UserID)
);

-- UserAppliedSport table
drop table if exists UserAppliedSport;
CREATE TABLE UserAppliedSport (
    ApplicationID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    SportID INT,
    MatrNumber VARCHAR(255),
    AppliedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (SportID) REFERENCES sport(SportID),
    UNIQUE KEY (UserID, SportID)
);

-- Insert dummy data into the User table
INSERT INTO User (Name, Lastname, MatrNumber)
VALUES
    ('John', 'Doe', '12345'),
    ('Alice', 'Smith', '67890'),
    ('Bob', 'Johnson', '54321'),
    ('Sarah', 'Wilson', '13579'),
    ('Michael', 'Lee', '24680'),
    ('Emily', 'Clark', '98765'),
    ('Megan', 'Davis', '11111');

-- Insert dummy data into the Sport table
INSERT INTO Sport (Name, Description, Date, Time, Place, TeacherID, AppliedForPlaces)
VALUES
    ('Basketball', 'Learn to play basketball', '2023-10-20', '15:00:00', 'Gym A', 1, false),
    ('Swimming', 'Swim lessons for beginners', '2023-10-22', '10:00:00', 'Pool B', 2, false),
    ('Yoga', 'Relax and stretch your body', '2023-10-25', '18:30:00', 'Yoga Studio', 1, false),
    ('Tennis', 'Learn to play tennis', '2023-10-23', '14:00:00', 'Tennis Courts', 4, false),
    ('Running', 'Group running sessions', '2023-10-24', '08:30:00', 'Park', 5, false),
    ('Pilates', 'Core strength and flexibility', '2023-10-27', '19:00:00', 'Fitness Center', 3, false),
    ('Gymnastics', 'Artistic gymnastics training', '2023-10-30', '17:30:00', 'Gymnastics Center', 7, false);

-- Insert dummy data into the UserAppliedSport table
INSERT INTO UserAppliedSport (UserID, SportID)
VALUES
    (1, 1),   -- John applied for Basketball
    (2, 2),   -- Alice applied for Swimming
    (3, 1),   -- Bob applied for Basketball
    (2, 3),   -- Alice applied for Yoga
    (4, 5),   -- Sarah applied for Tennis
    (5, 6),   -- Michael applied for Running
    (6, 7),   -- Emily applied for Pilates
    (1, 5);   -- John applied for Tennis