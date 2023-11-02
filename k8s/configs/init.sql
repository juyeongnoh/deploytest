/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN = 0;

SET @@GLOBAL.GTID_PURGED = /*!80000 '+'*/ '';


CREATE SCHEMA IF NOT EXISTS `krampoline` DEFAULT CHARACTER SET utf8mb4;

GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
GRANT ALL ON krampoline.* TO 'root'@'%';
FLUSH PRIVILEGES;

USE `krampoline`;

# db 예시
# DROP TABLE IF EXISTS `sample_data`;
# CREATE TABLE `sample_data`
# (
#     `id`     int(11)      NOT NULL AUTO_INCREMENT,
#     `detail` varchar(100) NOT NULL,
#     PRIMARY KEY (`id`)
# ) ENGINE = InnoDB
#   AUTO_INCREMENT = 3
#   DEFAULT CHARSET = utf8mb4
#   COLLATE = utf8mb4_general_ci;
#
# INSERT INTO sample_data (`id`, `detail`)
# VALUES ('1', 'Hello DKOS!');

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member`
(
    `id`       bigint       NOT NULL AUTO_INCREMENT,
    `email`    varchar(100) NOT NULL,
    `password` varchar(255) NOT NULL,
    `role`     varchar(30)  NOT NULL,
    `tel`      varchar(50)  NOT NULL,
    `username` varchar(45)  NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_mbmcqelty0fbrvxp1q58dn57t` (`email`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 266
  DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location`
(
    `id`        bigint       NOT NULL AUTO_INCREMENT,
    `address`   varchar(255) NOT NULL,
    `latitude`  double       NOT NULL,
    `longitude` double       NOT NULL,
    `place`     varchar(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyword`
(
    `id`   bigint      NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL,
    `type` int         NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carwash`
--

DROP TABLE IF EXISTS `carwash`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carwash`
(
    `id`    bigint       NOT NULL AUTO_INCREMENT,
    `des`   varchar(255) NOT NULL,
    `name`  varchar(100) NOT NULL,
    `price` int          NOT NULL,
    `rate`  double       NOT NULL,
    `tel`   varchar(50)  NOT NULL,
    `l_id`  bigint       NOT NULL,
    `m_id`  bigint       NOT NULL,
    PRIMARY KEY (`id`),
    KEY `FKo1d3t3rmqywidgkft9lpv8lh5` (`l_id`),
    KEY `FKep9tvcng5cm0elyc0ocej6fqe` (`m_id`),
    CONSTRAINT `FKep9tvcng5cm0elyc0ocej6fqe` FOREIGN KEY (`m_id`) REFERENCES `member` (`id`),
    CONSTRAINT `FKo1d3t3rmqywidgkft9lpv8lh5` FOREIGN KEY (`l_id`) REFERENCES `location` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `bay`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bay`
(
    `id`      bigint NOT NULL AUTO_INCREMENT,
    `bay_num` int    NOT NULL,
    `status`  int    NOT NULL,
    `w_id`    bigint NOT NULL,
    PRIMARY KEY (`id`),
    KEY `FKhx2jqki7s1v6yj6o2yx79l0xr` (`w_id`),
    CONSTRAINT `FKhx2jqki7s1v6yj6o2yx79l0xr` FOREIGN KEY (`w_id`) REFERENCES `carwash` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `carwash_keyword`
--

DROP TABLE IF EXISTS `carwash_keyword`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carwash_keyword`
(
    `id`   bigint NOT NULL AUTO_INCREMENT,
    `c_id` bigint NOT NULL,
    `k_id` bigint NOT NULL,
    PRIMARY KEY (`id`),
    KEY `FKfu266dub3hgq4pon36v0k0lyl` (`c_id`),
    KEY `FKlg8uskpy0snvxn6qiurrnmwu6` (`k_id`),
    CONSTRAINT `FKfu266dub3hgq4pon36v0k0lyl` FOREIGN KEY (`c_id`) REFERENCES `carwash` (`id`),
    CONSTRAINT `FKlg8uskpy0snvxn6qiurrnmwu6` FOREIGN KEY (`k_id`) REFERENCES `keyword` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file`
(
    `id`          bigint NOT NULL AUTO_INCREMENT,
    `name`        varchar(255)  DEFAULT NULL,
    `path`        varchar(255)  DEFAULT NULL,
    `uploaded_at` datetime(6)   DEFAULT NULL,
    `url`         varchar(1024) DEFAULT NULL,
    `c_id`        bigint        DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `FKqfsy6nf1wxfes5j8xdm0ciamq` (`c_id`),
    CONSTRAINT `FKqfsy6nf1wxfes5j8xdm0ciamq` FOREIGN KEY (`c_id`) REFERENCES `carwash` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `optime`
--

DROP TABLE IF EXISTS `optime`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optime`
(
    `id`         bigint      NOT NULL AUTO_INCREMENT,
    `day_type`   varchar(10) NOT NULL,
    `end_time`   time        NOT NULL,
    `start_time` time        NOT NULL,
    `c_id`       bigint      NOT NULL,
    PRIMARY KEY (`id`),
    KEY `FKqp6wj9fesn7wxhp2d2w5qfw1i` (`c_id`),
    CONSTRAINT `FKqp6wj9fesn7wxhp2d2w5qfw1i` FOREIGN KEY (`c_id`) REFERENCES `carwash` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation`
(
    `id`         bigint      NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) NOT NULL,
    `end_time`   datetime(6) NOT NULL,
    `is_deleted` bit(1)      NOT NULL,
    `price`      int         NOT NULL,
    `start_time` datetime(6) NOT NULL,
    `updated_at` datetime(6) NOT NULL,
    `b_id`       bigint      NOT NULL,
    `m_id`       bigint      NOT NULL,
    PRIMARY KEY (`id`),
    KEY `FK49slsdfr21o33tjko6q0fiaap` (`b_id`),
    KEY `FKcqnf1f2otnni6yrjn52p3bquw` (`m_id`),
    CONSTRAINT `FK49slsdfr21o33tjko6q0fiaap` FOREIGN KEY (`b_id`) REFERENCES `bay` (`id`),
    CONSTRAINT `FKcqnf1f2otnni6yrjn52p3bquw` FOREIGN KEY (`m_id`) REFERENCES `member` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 37
  DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review`
(
    `id`         bigint       NOT NULL AUTO_INCREMENT,
    `comment`    varchar(100) NOT NULL,
    `created_at` datetime(6)  NOT NULL,
    `rate`       double       NOT NULL,
    `updated_at` datetime(6)  NOT NULL,
    `c_id`       bigint       NOT NULL,
    `m_id`       bigint       NOT NULL,
    `r_id`       bigint       NOT NULL,
    PRIMARY KEY (`id`),
    KEY `FKadwnu8dg7fs8n1oy4e8dmg5gi` (`c_id`),
    KEY `FK18b9hkaky0q6r3fyktxv34f5o` (`m_id`),
    KEY `FK1qv3we0v2pffsvs94c9wopuju` (`r_id`),
    CONSTRAINT `FK18b9hkaky0q6r3fyktxv34f5o` FOREIGN KEY (`m_id`) REFERENCES `member` (`id`),
    CONSTRAINT `FK1qv3we0v2pffsvs94c9wopuju` FOREIGN KEY (`r_id`) REFERENCES `reservation` (`id`),
    CONSTRAINT `FKadwnu8dg7fs8n1oy4e8dmg5gi` FOREIGN KEY (`c_id`) REFERENCES `carwash` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review_keyword`
--

DROP TABLE IF EXISTS `review_keyword`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_keyword`
(
    `id`   bigint NOT NULL AUTO_INCREMENT,
    `k_id` bigint NOT NULL,
    `r_id` bigint NOT NULL,
    PRIMARY KEY (`id`),
    KEY `FK59kiv4xeew9aipw7edj8xo1db` (`k_id`),
    KEY `FKt8xhqm2sditmko01ndllyqnld` (`r_id`),
    CONSTRAINT `FK59kiv4xeew9aipw7edj8xo1db` FOREIGN KEY (`k_id`) REFERENCES `keyword` (`id`),
    CONSTRAINT `FKt8xhqm2sditmko01ndllyqnld` FOREIGN KEY (`r_id`) REFERENCES `review` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dump completed on 2023-10-30 15:43:01
-- 모든 제약 조건 비활성화
SET FOREIGN_KEY_CHECKS = 0;

truncate table bay;
truncate table carwash;
truncate table file;
truncate table keyword;
truncate table carwash_keyword;
truncate table review_keyword;
truncate table location;
truncate table optime;
truncate table reservation;
truncate table review;
truncate table member;

SET FOREIGN_KEY_CHECKS = 1;
-- 모든 제약 조건 활성화

-- User Data
INSERT INTO member (`id`, `role`, `email`, `username`, `password`, `tel`)
VALUES ('1', 'ROLE_USER', 'user@nate.com', 'imnewuser',
        '{bcrypt}$2a$10$v8NhNtmO91URnZ9nJIYdSeapN9qj4qxBHuf8Kd/hkms9.eRUEHcQS', '010-1234-5678'),
       ('2', 'ROLE_OWNER', 'owner@nate.com', 'imnewowner',
        '{bcrypt}$2a$10$o6TVGm92x.GENlJ4Mig5qucFqAt/UTnT5lm6rzTY5v.gCk8uSf7h2', '010-9876-5432');

-- Location Data
INSERT INTO location (`id`, `place`, `address`, `latitude`, `longitude`)
VALUES ('1', '전일 카 세차장', '광주 북구 용주로30번길 36', 35.1806726203914, 126.9707),
       ('2', '민들레 세차장', '광주 북구 우치로 49', 35.1719470672127, 126.911703379899),
       ('3', '세차 월드', '광주 남구 봉선2로 96-14', 35.125349394619, 126.916778560933),
       ('4', '에코 세차', '광주 서구 풍암운리로29번길 4-1', 35.1236239635137, 126.867258708128),
       ('5', '컴인워시 강남본점', '서울 강남구 삼성로 567', 37.5121009265405, 127.0533894042);

-- Keyword Data
INSERT INTO keyword (`id`, `name`, `type`)
VALUES ('1', '하부세차', '1'),
       ('2', '개러지형 독립공간', '1'),
       ('3', '사장님이 친절해요', '2'),
       ('4', '100% 수돗물', '1'),
       ('5', '야간 조명', '1'),
       ('6', '매장이 깨끗해요', '2'),
       ('7', '에어컨', '1'),
       ('8', '가격이 합리적이에요', '2'),
       ('9', '간단한 용품을 팔아요', '2'),
       ('10', '휴게공간이 있어요', '2'),
       ('11', '발수코팅건', '1'),
       ('12', '휴게실', '1');
# carwash keyword: 1,2,4,5,7,11,12
# review keyword: 3,6,8,9,10

-- Carwash Data
INSERT INTO carwash (`id`, `name`, `rate`, `tel`, `des`, `price`, `l_id`, `m_id`)
VALUES ('1', '전일 카 세차장', 4.2, '062-1234-5678', '광주 제일의 세차장', 10000, '1', '2'),
       ('2', '민들레 세차장', 4.0, '062-1234-5679', '귀여운 세차장', 9000, '2', '2'),
       ('3', '세차 월드', 4.2, '062-1234-5680', '세차의 세계', 8500, '3', '2'),
       ('4', '에코 세차', 3.9, '062-1234-5681', '친환경적 세차장', 9500, '4', '2'),
       ('5', '컴인워시 강남본점', 4.8, '02-1234-5678', '서울 제일의 세차장', 12000, '5', '2');

-- Bay Data
INSERT INTO bay (`id`, `bay_num`, `w_id`, `status`)
VALUES ('1', 1, '1', 0),
       ('2', 2, '1', 1),
       ('3', 1, '2', 0),
       ('4', 2, '2', 1),
       ('5', 1, '3', 0),
       ('6', 2, '3', 1),
       ('7', 1, '4', 0),
       ('8', 2, '4', 1),
       ('9', 1, '5', 0),
       ('10', 2, '5', 1);

# carwash keyword: 1,2,4,5,7,11,12
-- CarwashKeyword Data
INSERT INTO carwash_keyword (`id`, `c_id`, `k_id`)
VALUES ('1', '1', '1'),
       ('2', '1', '2'),
       ('3', '1', '4'),
       ('4', '2', '1'),
       ('5', '2', '5'),
       ('6', '2', '5'),
       ('7', '3', '2'),
       ('8', '3', '4'),
       ('9', '3', '7'),
       ('10', '4', '1'),
       ('11', '4', '4'),
       ('12', '4', '5'),
       ('13', '5', '1'),
       ('14', '5', '12'),
       ('15', '5', '7');
-- Optime Data
INSERT INTO optime (`id`, `day_type`, `start_time`, `end_time`, `c_id`)
VALUES ('1', 'WEEKDAY', '09:00:00', '18:00:00', '1'),
       ('2', 'WEEKEND', '10:00:00', '17:00:00', '1'),
       ('3', 'WEEKDAY', '09:30:00', '18:30:00', '2'),
       ('4', 'WEEKEND', '10:30:00', '16:30:00', '2'),
       ('5', 'WEEKDAY', '09:00:00', '19:00:00', '3'),
       ('6', 'WEEKEND', '10:00:00', '18:00:00', '3'),
       ('7', 'WEEKDAY', '08:30:00', '17:30:00', '4'),
       ('8', 'WEEKEND', '09:30:00', '16:00:00', '4'),
       ('9', 'WEEKDAY', '09:00:00', '20:00:00', '5'),
       ('10', 'WEEKEND', '10:00:00', '19:00:00', '5');

-- Reservation Data
INSERT INTO reservation (`id`, `price`, `start_time`, `end_time`, `is_deleted`, `b_id`, `m_id`, `created_at`, `updated_at`)
VALUES ('1', 10000, '2023-10-25T10:00:00', '2023-10-25T10:30:00', 0, '1', '1', '2023-10-30 17:19:56.412271', '2023-10-30 17:19:56.412271'),
       ('2', 10000, '2023-10-25T11:00:00', '2023-10-25T11:30:00', 0, '2', '1', '2023-10-30 17:19:56.412271', '2023-10-30 17:19:56.412271'),
       ('3', 9000, '2023-10-26T10:00:00', '2023-10-26T10:30:00', 0, '3', '1', '2023-10-30 17:19:56.412271', '2023-10-30 17:19:56.412271'),
       ('4', 9000, '2023-10-26T11:00:00', '2023-10-26T11:30:00', 0, '4', '1', '2023-10-30 17:19:56.412271', '2023-10-30 17:19:56.412271'),
       ('5', 8500, '2023-10-27T10:00:00', '2023-10-27T10:30:00', 0, '5', '1', '2023-10-30 17:19:56.412271', '2023-10-30 17:19:56.412271'),
       ('6', 8500, '2023-10-27T11:00:00', '2023-10-27T11:30:00', 0, '6', '1', '2023-10-30 17:19:56.412271', '2023-10-30 17:19:56.412271'),
       ('7', 9500, '2023-10-28T10:00:00', '2023-10-28T10:30:00', 0, '7', '1', '2023-10-30 17:19:56.412271', '2023-10-30 17:19:56.412271'),
       ('8', 9500, '2023-10-28T11:00:00', '2023-10-28T11:30:00', 0, '8', '1', '2023-10-30 17:19:56.412271', '2023-10-30 17:19:56.412271'),
       ('9', 12000, '2023-10-29T10:00:00', '2023-10-29T10:30:00', 0, '9', '1', '2023-10-30 17:19:56.412271', '2023-10-30 17:19:56.412271'),
       ('10', 12000, '2023-10-29T11:00:00', '2023-10-29T11:30:00', 0, '10', '1', '2023-10-30 17:19:56.412271', '2023-10-30 17:19:56.412271');

-- Review Data
INSERT INTO review (`id`, `m_id`, `c_id`, `r_id`, `comment`, `rate`, `created_at`, `updated_at`)
VALUES ('1', '1', '1', '1', '좋은 세차장인것 같습니다.', 4.5, '2023-10-30 19:19:56.412271', '2023-10-30 19:19:56.412271'),
       ('2', '1', '2', '3', '가격이 조금 비쌌어요', 4.0, '2023-10-30 19:19:56.412271', '2023-10-30 19:19:56.412271');

# review keyword: 3,6,8,9,10
-- ReviewKeyword Data
INSERT INTO review_keyword (`id`, `r_id`, `k_id`)
VALUES ('1', '1', '3'),
       ('2', '1', '6'),
       ('3', '2', '9'),
       ('4', '2', '8');

-- File Data
INSERT INTO file (`id`, `name`, `url`, `path`, `uploaded_at`, `c_id`)
VALUES ('1', 'image1.jpg', 'http://example.com/image1.jpg', '/images/image1.jpg', '2023-10-24T10:00:00', '1'),
       ('2', 'image2.jpg', 'http://example.com/image2.jpg', '/images/image2.jpg', '2023-10-24T11:00:00', '2'),
       ('3', 'image3.jpg', 'http://example.com/image3.jpg', '/images/image3.jpg', '2023-10-24T12:00:00', '3'),
       ('4', 'image4.jpg', 'http://example.com/image4.jpg', '/images/image4.jpg', '2023-10-24T13:00:00', '4'),
       ('5', 'image5.jpg', 'http://example.com/image5.jpg', '/images/image5.jpg', '2023-10-24T14:00:00', '5');
