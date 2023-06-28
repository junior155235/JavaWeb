
create database if not exists chicken_job ;
use chicken_job;


create table if not exists user_main(
user_id int primary key auto_increment,
user_mail varchar(255)unique,
unique index (user_mail (20))
);


create table if not exists user_data(
user_id int primary key,
user_name varchar(255),
user_birthDate date,
user_phone varchar(10),
user_password varchar(20) not null,
user_gender ENUM('男', '女', '其他') not null,
user_learn enum('國中以下','國中','高中','大專','大專以上'),
foreign key (user_id) references user_main(user_id) on update cascade on delete cascade
);

create table if not exists job_main(
job_id int primary key auto_increment,
user_id int ,
foreign key (user_id) references user_main(user_id)
);

create table if not exists job_data(
job_id int primary key,
job_name varchar(30) not null,
job_info varchar(255),
job_city varchar(15),
job_district varchar(15),
job_publishDate date,
job_require varchar(50),
salary_type ENUM('時薪','一次性') not null,
salary int not null,
foreign key (job_id) references job_main(job_id) on delete cascade
);

create table if not exists job_user(
job_id int ,
post_id int not null,
get_id int ,
job_status enum('應徵中','已錄取','已完成','未錄取')DEFAULT '應徵中',
foreign key (job_id) references job_main(job_id)
);
CREATE TABLE IF NOT EXISTS city (
  id INT PRIMARY KEY,
  city_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS district (
  id INT PRIMARY KEY,
  district_name VARCHAR(50),
  city_id INT,
  FOREIGN KEY (city_id) REFERENCES city(id)
);

-- 插入台灣縣市資料
INSERT INTO city (id, city_name)
VALUES
  (1, '基隆市'),
  (2, '台北市'),
  (3, '新北市'),
  (4, '桃園市'),
  (5, '新竹市'),
  (6, '新竹縣'),
  (7, '苗栗縣'),
  (8, '台中市'),
  (9, '彰化縣'),
  (10, '南投縣'),
  (11, '雲林縣'),
  (12, '嘉義市'),
  (13, '嘉義縣'),
  (14, '台南市'),
  (15, '高雄市'),
  (16, '屏東縣'),
  (17, '台東縣'),
  (18, '花蓮縣'),
  (19, '宜蘭縣'),
  (20, '澎湖縣'),
  (21, '金門縣'),
  (22, '連江縣');
  
  INSERT INTO district (id, district_name, city_id)
	VALUES
  (1, '仁愛區', 1),
  (2, '信義區', 1),
  (3, '中正區', 1),
  (4, '中山區', 1),
  (5, '安樂區', 1),
  (6, '暖暖區', 1),
  (7, '七堵區', 1),
  (8, '中正區', 2),
  (9, '大同區', 2),
  (10, '中山區', 2),
  (11, '松山區', 2),
  (12, '大安區', 2),
  (13, '萬華區', 2),
  (14, '信義區', 2),
  (15, '士林區', 2),
  (16, '北投區', 2),
  (17, '內湖區', 2),
  (18, '南港區', 2),
  (19, '文山區', 2),
  (20, '板橋區', 3),
  (21, '三重區', 3),
  (22, '中和區', 3),
  (23, '永和區', 3),
  (24, '新莊區', 3),
  (25, '新店區', 3),
  (26, '樹林區', 3),
  (27, '鶯歌區', 3),
  (28, '三峽區', 3),
  (29, '淡水區', 3),
  (30, '汐止區', 3),
  (31, '瑞芳區', 3),
  (32, '土城區', 3),
  (33, '蘆洲區', 3),
  (34, '五股區', 3),
  (35, '泰山區', 3),
  (36, '林口區', 3),
  (37, '深坑區', 3),
  (38, '石碇區', 3),
  (39, '坪林區', 3),
  (40, '三芝區', 3),
  (41, '石門區', 3),
  (42, '八里區', 3),
  (43, '平溪區', 3),
  (44, '雙溪區', 3),
  (45, '貢寮區', 3),
  (46, '金山區', 3),
  (47, '萬里區', 3),
  (48, '烏來區', 3),
  (49, '桃園區', 4),
  (50, '中壢區', 4),
  (51, '平鎮區', 4),
  (52, '八德區', 4),
  (53, '楊梅區', 4),
  (54, '蘆竹區', 4),
  (55, '大溪區', 4),
  (56, '龍潭區', 4),
  (57, '龜山區', 4),
  (58, '大園區', 4),
  (59, '觀音區', 4),
  (60, '新屋區', 4),
  (61, '復興區', 4),
  (62, '東區', 5),
  (63, '北區', 5),
  (64, '香山區', 5),
  (65, '竹北市', 6),
  (66, '竹東鎮', 6),
  (67, '新埔鎮', 6),
  (68, '關西鎮', 6),
  (69, '湖口鄉', 6),
  (70, '新豐鄉', 6),
  (71, '峨眉鄉', 6),
  (72, '寶山鄉', 6),
  (73, '北埔鄉', 6),
  (74, '芎林鄉', 6),
  (75, '橫山鄉', 6),
  (76, '尖石鄉', 6),
  (77, '五峰鄉', 6),
  (78, '苗栗市', 7),
  (79, '頭份市', 7),
  (80, '竹南鎮', 7),
  (81, '後龍鎮', 7),
  (82, '通霄鎮', 7),
  (83, '苑裡鎮', 7),
  (84, '卓蘭鎮', 7),
  (85, '造橋鄉', 7),
  (86, '西湖鄉', 7),
  (87, '頭屋鄉', 7),
  (88, '公館鄉', 7),
  (89, '銅鑼鄉', 7),
  (90, '三義鄉', 7),
  (91, '大湖鄉', 7),
  (92, '獅潭鄉', 7),
  (93, '泰安鄉', 7),
  (94, '中區', 8),
  (95, '東區', 8),
  (96, '南區', 8),
  (97, '西區', 8),
  (98, '北區', 8),
  (99, '北屯區', 8),
  (100, '西屯區', 8),
  (101, '南屯區', 8),
  (102, '太平區', 8),
  (103, '大里區', 8),
  (104, '霧峰區', 8),
  (105, '烏日區', 8),
  (106, '豐原區', 8),
  (107, '后里區', 8),
  (108, '石岡區', 8),
  (109, '東勢區', 8),
  (110, '和平區', 8),
  (111, '新社區', 8),
  (112, '潭子區', 8),
  (113, '大雅區', 8),
  (114, '神岡區', 8),
  (115, '大肚區', 8),
  (116, '沙鹿區', 8),
  (117, '龍井區', 8),
  (118, '梧棲區', 8),
  (119, '清水區', 8),
  (120, '大甲區', 8),
  (121, '外埔區', 8),
  (122, '大安區', 8),
  (123, '彰化市',9),
  (124, '南投市',10),
  (125, '麥寮',11),
  (126, '東區',12),
  (127, '太保市',13),
  (128, '新市區',14),
  (129, '左營區',15),
  (130, '屏東市',16),
  (131, '台東市',17),
  (132, '花蓮市',18),
  (133, '宜蘭市',19),
  (134, '馬公市',20),
  (135, '金門市',21),
  (136, '連江市',22);



/*7*/
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `update_user`(id int , umail varchar(255) , uname varchar(255) , uphone varchar(10) ,upassword varchar(255) , udate date , ugender ENUM('男', '女', '其他') , ulearn enum('國中以下','國中','高中','大專','大專以上')) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN

update user_main set user_mail = umail where user_main.user_id = id;

update user_data set user_name = uname , user_password = upassword , user_birthDate = udate , user_phone= uphone , user_gender = ugender , user_learn = ulearn where user_data.user_id = id;

RETURN 1;
END;

/*8*/
CREATE DEFINER=`root`@`localhost` FUNCTION `create_user`(
    p_user_mail VARCHAR(255),
    p_user_name VARCHAR(255),
    p_user_birthDate DATE,
    p_user_phone VARCHAR(10),
    p_user_password VARCHAR(20),
    p_user_gender ENUM('男', '女', '其他'),
    p_user_learn ENUM('國中以下', '國中', '高中', '大專', '大專以上')
) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
    DECLARE user_id INT;
    INSERT INTO user_main(user_mail) VALUES (p_user_mail);
    SET user_id = LAST_INSERT_ID();
    INSERT INTO user_data(user_id, user_name, user_birthDate , user_phone , user_password, user_gender, user_learn)
    VALUES (user_id, p_user_name, p_user_birthDate , p_user_phone , p_user_password, p_user_gender, p_user_learn);
    RETURN user_id;
END;

/*9*/
CREATE DEFINER=`root`@`localhost` FUNCTION `create_job`(
	user_id int,
    job_name varchar(30),
    job_info  varchar(255),
    job_city  varchar(15),
    job_district  varchar(15),
    job_publishDate date,
    job_require  varchar(50),
    salary_type ENUM('時薪','一次性'),
    salary int
) RETURNS int(11)
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE job_id INT;
	insert into job_main(user_id) values (user_id);
    SET job_id = LAST_INSERT_ID();
    INSERT INTO job_data(job_id , job_name , job_info, job_city, job_district, job_publishDate, job_require , salary_type , salary)
    VALUES (job_id , job_name , job_info , job_city, job_district, job_publishDate, job_require , salary_type , salary);
    insert into job_user(job_id , post_id) values(job_id , user_id); 
RETURN 1;
END