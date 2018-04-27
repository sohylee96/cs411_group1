CREATE DATABASE fitbit;
USE fitbit;

-- CREATE USER TABLE FOR EACH USER
CREATE TABLE USER (
    FBID CHAR(6) NOT NULL,
    ACCESS_TOKEN VARCHAR(1024),
    REFRESH_TOKEN VARCHAR(1024),
    NAME VARCHAR(50),
    LOCATION VARCHAR(20),
    PRIMARY KEY (FBID)
);

-- CREATE ACTIVITIES TABLE TO HOLD USERS FITBIT ACTIVITY QUEUE
CREATE TABLE ACTIVITIES(
    FBID CHAR(6) NOT NULL,
    ACTIVITY VARCHAR(40),
    PRIMARY KEY (FBID, ACTIVITY),
    FOREIGN KEY (FBID) REFERENCES USER(FBID) ON DELETE CASCADE
);

-- CREATE CACHE TABLE TO HOLD USERS MOST RECENT SEARCH THROUGH THE WEBAPP
CREATE TABLE RESULTCACHE(
    ID INT NOT NULL AUTO_INCREMENT,
    SID CHAR(40) NOT NULL,
    NAME VARCHAR(150),
    DATE VARCHAR(40),
    VENUE VARCHAR(100),
    DES VARCHAR(20000),
    LINK VARCHAR(350) NOT NULL,
    IS_FREE VARCHAR(5),
    RNUM INT,
    LOCATION_TERM VARCHAR(100),
    PRIMARY KEY (ID)
);

-- CREATE SAVEDEVENTS TABLE TO HOLD SAVED USERS EVENTS
CREATE TABLE SAVEDEVENTS(
    ID INT NOT NULL AUTO_INCREMENT,
    FBID CHAR(6) NOT NULL,
    SID VARCHAR(40),
    NAME VARCHAR(150),
    DATE VARCHAR(40),
    VENUE VARCHAR(100),
    DES VARCHAR(20000),
    LINK VARCHAR(350),
    IS_FREE VARCHAR(5),
    PRIMARY KEY (ID),
    FOREIGN KEY (FBID) REFERENCES USER(FBID) ON DELETE CASCADE
);

CREATE TABLE RECOMMENDATIONS(
    FBID CHAR(6) NOT NULL,
    SID VARCHAR(40),
    NAME VARCHAR(150),
    DATE VARCHAR(40),
    VENUE VARCHAR(100),
    DES VARCHAR(20000),
    LINK VARCHAR(350),
    IS_FREE VARCHAR(5),
    RNUM INT,
    PRIMARY KEY (RNUM),
    FOREIGN KEY (FBID) REFERENCES USER(FBID) ON DELETE CASCADE
);

ALTER TABLE RESULTCACHE CONVERT TO CHARACTER SET utf8;

ALTER TABLE RECOMMENDATIONS MODIFY LINK VARCHAR(350) CHARACTER SET utf8;
ALTER TABLE RECOMMENDATIONS MODIFY DES VARCHAR(20000) CHARACTER SET utf8;
ALTER TABLE RECOMMENDATIONS ADD TIME_MODIFIED TIMESTAMP;

ALTER TABLE SAVEDEVENTS MODIFY LINK VARCHAR(350) CHARACTER SET utf8;
ALTER TABLE SAVEDEVENTS MODIFY DES VARCHAR(20000) CHARACTER SET utf8;
