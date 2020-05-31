create table `user`
(
    `id`         INT         NOT NUll PRIMARY KEY AUTO_INCREMENT,
    `name`       VARCHAR(32) NOT NULL,
    `gender`     VARCHAR(32),
    `major`      VARCHAR(128),
    `school`     VARCHAR(128),
    `username`   VARCHAR(32) NOT NULL,
    `password`   VARCHAR(64) NOT NULL,
    `role`       VARCHAR(12) NOT NULL,
    `createTime` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updateTime` timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


insert into user(name, gender, school, username, password, role)
    value ('超级管理员', '男', '北京大学', 'admin', '123456', 'ADMIN');


create table `grade`
(
    `id`          INT         NOT NUll PRIMARY KEY AUTO_INCREMENT,
    `no`          VARCHAR(32) NOT NULL,
    `name`        VARCHAR(32),
    `description` VARCHAR(256),
    `createTime`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updateTime`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

create table `user_grade`
(
    `id`      INT NOT NUll PRIMARY KEY AUTO_INCREMENT,
    `userId`  INT,
    `gradeId` INT
);



create table `question_item`
(
    `id`           INT         NOT NUll PRIMARY KEY AUTO_INCREMENT,
    `title`      VARCHAR(64) NOT NULL,
    `options`      TEXT,
    `type`      VARCHAR(64) NOT NULL

);

create table `question`
(
    `id`          INT         NOT NUll PRIMARY KEY AUTO_INCREMENT,
    `title`        VARCHAR(32) NOT NULL,
    `items`          TEXT,
    `gradeId`       INT,
    `gradeName`        VARCHAR(32),
    `teacherId`       INT,
    `teacherName`        VARCHAR(32) ,
    `status` VARCHAR(32) NOT NULL,
    `createTime`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updateTime`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

