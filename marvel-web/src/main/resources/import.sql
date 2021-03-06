/*QUARTZ_01*/
DROP TABLE IF EXISTS SYS_QRTZ_FIRED_TRIGGERS;
/*QUARTZ_02*/
DROP TABLE IF EXISTS SYS_QRTZ_PAUSED_TRIGGER_GRPS;
/*QUARTZ_03*/
DROP TABLE IF EXISTS SYS_QRTZ_SCHEDULER_STATE;
/*QUARTZ_04*/
DROP TABLE IF EXISTS SYS_QRTZ_LOCKS;
/*QUARTZ_05*/
DROP TABLE IF EXISTS SYS_QRTZ_SIMPLE_TRIGGERS;
/*QUARTZ_06*/
DROP TABLE IF EXISTS SYS_QRTZ_SIMPROP_TRIGGERS;
/*QUARTZ_07*/
DROP TABLE IF EXISTS SYS_QRTZ_CRON_TRIGGERS;
/*QUARTZ_08*/
DROP TABLE IF EXISTS SYS_QRTZ_BLOB_TRIGGERS;
/*QUARTZ_09*/
DROP TABLE IF EXISTS SYS_QRTZ_TRIGGERS;
/*QUARTZ_10*/
DROP TABLE IF EXISTS SYS_QRTZ_JOB_DETAILS;
/*QUARTZ_11*/
DROP TABLE IF EXISTS SYS_QRTZ_CALENDARS;
/*QUARTZ_12*/
CREATE TABLE SYS_QRTZ_JOB_DETAILS(SCHED_NAME VARCHAR(120) NOT NULL,JOB_NAME VARCHAR(200) NOT NULL,JOB_GROUP VARCHAR(200) NOT NULL,DESCRIPTION VARCHAR(250) NULL,JOB_CLASS_NAME VARCHAR(250) NOT NULL,IS_DURABLE VARCHAR(1) NOT NULL,IS_NONCONCURRENT VARCHAR(1) NOT NULL,IS_UPDATE_DATA VARCHAR(1) NOT NULL,REQUESTS_RECOVERY VARCHAR(1) NOT NULL,JOB_DATA BLOB NULL,PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP))ENGINE=InnoDB;
/*QUARTZ_13*/
CREATE TABLE SYS_QRTZ_TRIGGERS(SCHED_NAME VARCHAR(120) NOT NULL,TRIGGER_NAME VARCHAR(200) NOT NULL,TRIGGER_GROUP VARCHAR(200) NOT NULL,JOB_NAME VARCHAR(200) NOT NULL,JOB_GROUP VARCHAR(200) NOT NULL,DESCRIPTION VARCHAR(250) NULL,NEXT_FIRE_TIME BIGINT(13) NULL,PREV_FIRE_TIME BIGINT(13) NULL,PRIORITY INTEGER NULL,TRIGGER_STATE VARCHAR(16) NOT NULL,TRIGGER_TYPE VARCHAR(8) NOT NULL,START_TIME BIGINT(13) NOT NULL,END_TIME BIGINT(13) NULL,CALENDAR_NAME VARCHAR(200) NULL,MISFIRE_INSTR SMALLINT(2) NULL,JOB_DATA BLOB NULL,PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)REFERENCES SYS_QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP))ENGINE=InnoDB;
/*QUARTZ_14*/
CREATE TABLE SYS_QRTZ_SIMPLE_TRIGGERS(SCHED_NAME VARCHAR(120) NOT NULL,TRIGGER_NAME VARCHAR(200) NOT NULL,TRIGGER_GROUP VARCHAR(200) NOT NULL,REPEAT_COUNT BIGINT(7) NOT NULL,REPEAT_INTERVAL BIGINT(12) NOT NULL,TIMES_TRIGGERED BIGINT(10) NOT NULL,PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)REFERENCES SYS_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))ENGINE=InnoDB;
/*QUARTZ_15*/
CREATE TABLE SYS_QRTZ_CRON_TRIGGERS(SCHED_NAME VARCHAR(120) NOT NULL,TRIGGER_NAME VARCHAR(200) NOT NULL,TRIGGER_GROUP VARCHAR(200) NOT NULL,CRON_EXPRESSION VARCHAR(120) NOT NULL,TIME_ZONE_ID VARCHAR(80),PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)REFERENCES SYS_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))ENGINE=InnoDB;
/*QUARTZ_16*/
CREATE TABLE SYS_QRTZ_SIMPROP_TRIGGERS(SCHED_NAME VARCHAR(120) NOT NULL,TRIGGER_NAME VARCHAR(200) NOT NULL,TRIGGER_GROUP VARCHAR(200) NOT NULL,STR_PROP_1 VARCHAR(512) NULL,STR_PROP_2 VARCHAR(512) NULL,STR_PROP_3 VARCHAR(512) NULL,INT_PROP_1 INT NULL,INT_PROP_2 INT NULL,LONG_PROP_1 BIGINT NULL,LONG_PROP_2 BIGINT NULL,DEC_PROP_1 NUMERIC(13,4) NULL,DEC_PROP_2 NUMERIC(13,4) NULL,BOOL_PROP_1 VARCHAR(1) NULL,BOOL_PROP_2 VARCHAR(1) NULL,PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP), FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) REFERENCES SYS_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))ENGINE=InnoDB;
/*QUARTZ_17*/
CREATE TABLE SYS_QRTZ_BLOB_TRIGGERS (SCHED_NAME VARCHAR(120) NOT NULL,TRIGGER_NAME VARCHAR(200) NOT NULL,TRIGGER_GROUP VARCHAR(200) NOT NULL,BLOB_DATA BLOB NULL,PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)REFERENCES SYS_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))ENGINE=InnoDB;
/*QUARTZ_18*/
CREATE TABLE SYS_QRTZ_CALENDARS (SCHED_NAME VARCHAR(120) NOT NULL,CALENDAR_NAME VARCHAR(200) NOT NULL,CALENDAR BLOB NOT NULL,PRIMARY KEY (SCHED_NAME,CALENDAR_NAME))ENGINE=InnoDB;
/*QUARTZ_19*/
CREATE TABLE SYS_QRTZ_PAUSED_TRIGGER_GRPS (SCHED_NAME VARCHAR(120) NOT NULL,TRIGGER_GROUP VARCHAR(200) NOT NULL,PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP))ENGINE=InnoDB;
/*QUARTZ_20*/
CREATE TABLE SYS_QRTZ_FIRED_TRIGGERS (SCHED_NAME VARCHAR(120) NOT NULL,ENTRY_ID VARCHAR(95) NOT NULL,TRIGGER_NAME VARCHAR(200) NOT NULL,TRIGGER_GROUP VARCHAR(200) NOT NULL,INSTANCE_NAME VARCHAR(200) NOT NULL,FIRED_TIME BIGINT(13) NOT NULL,SCHED_TIME BIGINT(13) NOT NULL,PRIORITY INTEGER NOT NULL,STATE VARCHAR(16) NOT NULL,JOB_NAME VARCHAR(200) NULL,JOB_GROUP VARCHAR(200) NULL,IS_NONCONCURRENT VARCHAR(1) NULL,REQUESTS_RECOVERY VARCHAR(1) NULL,PRIMARY KEY (SCHED_NAME,ENTRY_ID))ENGINE=InnoDB;
/*QUARTZ_21*/
CREATE TABLE SYS_QRTZ_SCHEDULER_STATE (SCHED_NAME VARCHAR(120) NOT NULL,INSTANCE_NAME VARCHAR(200) NOT NULL,LAST_CHECKIN_TIME BIGINT(13) NOT NULL,CHECKIN_INTERVAL BIGINT(13) NOT NULL,PRIMARY KEY (SCHED_NAME,INSTANCE_NAME))ENGINE=InnoDB;
/*QUARTZ_22*/
CREATE TABLE SYS_QRTZ_LOCKS (SCHED_NAME VARCHAR(120) NOT NULL,LOCK_NAME VARCHAR(40) NOT NULL,PRIMARY KEY (SCHED_NAME,LOCK_NAME))ENGINE=InnoDB;
/*QUARTZ_23*/
CREATE INDEX IDX_SYS_QRTZ_01 ON SYS_QRTZ_JOB_DETAILS(SCHED_NAME,REQUESTS_RECOVERY);
/*QUARTZ_24*/
CREATE INDEX IDX_SYS_QRTZ_02 ON SYS_QRTZ_JOB_DETAILS(SCHED_NAME,JOB_GROUP);
/*QUARTZ_25*/
CREATE INDEX IDX_SYS_QRTZ_03 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
/*QUARTZ_26*/
CREATE INDEX IDX_SYS_QRTZ_04 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,JOB_GROUP);
/*QUARTZ_27*/
CREATE INDEX IDX_SYS_QRTZ_05 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,CALENDAR_NAME);
/*QUARTZ_28*/
CREATE INDEX IDX_SYS_QRTZ_06 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);
/*QUARTZ_29*/
CREATE INDEX IDX_SYS_QRTZ_07 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE);
/*QUARTZ_30*/
CREATE INDEX IDX_SYS_QRTZ_08 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_STATE);
/*QUARTZ_31*/
CREATE INDEX IDX_SYS_QRTZ_09 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP,TRIGGER_STATE);
/*QUARTZ_32*/
CREATE INDEX IDX_SYS_QRTZ_10 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,NEXT_FIRE_TIME);
/*QUARTZ_33*/
CREATE INDEX IDX_SYS_QRTZ_11 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE,NEXT_FIRE_TIME);
/*QUARTZ_34*/
CREATE INDEX IDX_SYS_QRTZ_12 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME);
/*QUARTZ_35*/
CREATE INDEX IDX_SYS_QRTZ_13 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_STATE);
/*QUARTZ_36*/
CREATE INDEX IDX_SYS_QRTZ_14 ON SYS_QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_GROUP,TRIGGER_STATE);
/*QUARTZ_37*/
CREATE INDEX IDX_SYS_QRTZ_15 ON SYS_QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME);
/*QUARTZ_38*/
CREATE INDEX IDX_SYS_QRTZ_16 ON SYS_QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME,REQUESTS_RECOVERY);
/*QUARTZ_39*/
CREATE INDEX IDX_SYS_QRTZ_17 ON SYS_QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
/*QUARTZ_40*/
CREATE INDEX IDX_SYS_QRTZ_18 ON SYS_QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_GROUP);
/*QUARTZ_41*/
CREATE INDEX IDX_SYS_QRTZ_19 ON SYS_QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
/*QUARTZ_42*/
CREATE INDEX IDX_SYS_QRTZ_20 ON SYS_QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);

-- ----------------------------
-- Records of resource
-- ----------------------------
-- INSERT INTO `resource` VALUES (101, 'ACCOUNT_LOGIN', '用户登录', 103, '/account/login', 2, 'POST', NULL, 1, NULL, NULL);
-- INSERT INTO `resource` VALUES (103, 'GROUP_ACCOUNT', '账户系列', 110, '', 3, 'POST', NULL, 1, NULL, NULL);
-- INSERT INTO `resource` VALUES (104, 'USER_MAGE', '用户管理', -1, '', 1, 'POST', 'fa fa-user', 1, NULL, NULL);
-- INSERT INTO `resource` VALUES (106, 'RESOURCE_MAGE', '资源配置', -1, '', 1, 'POST', 'fa fa-pie-chart', 1, NULL, NULL);
-- INSERT INTO `resource` VALUES (107, 'MENU_MANAGE', '菜单管理', 106, '/index/menu', 1, 'POST', 'fa fa-th', 1, NULL, NULL);
-- INSERT INTO `resource` VALUES (109, 'API_MANAGE', 'API管理', 106, '/index/api', 1, NULL, 'fa fa-share', 1, '2018-04-07 09:40:24', '2018-04-07 09:40:24');
-- INSERT INTO `resource` VALUES (110, 'CATEGORY_GROUP', '分类集合(API类别请放入此集合)', -1, NULL, 3, NULL, NULL, 1, '2018-04-07 14:27:58', '2018-04-07 14:27:58');
-- INSERT INTO `resource` VALUES (112, 'ACCOUNT_REGISTER', '用户注册', 103, '/account/register', 2, 'POST', NULL, 1, '2018-04-07 16:21:45', '2018-04-07 16:21:45');
-- INSERT INTO `resource` VALUES (115, 'GROUP_USER', '用户系列', 110, '', 3, 'GET', NULL, 1, '2018-04-07 16:31:01', '2018-04-07 16:31:01');
-- INSERT INTO `resource` VALUES (117, 'ROLE_MANAGE', '角色管理', 106, '/index/role', 1, NULL, 'fa fa-adjust', 1, '2018-04-08 05:36:31', '2018-04-08 05:36:31');
-- INSERT INTO `resource` VALUES (118, 'GROUP_RESOURCE', '资源系列', 110, NULL, 3, NULL, NULL, 1, '2018-04-09 02:29:14', '2018-04-09 02:29:14');
-- INSERT INTO `resource` VALUES (119, 'USER_ROLE_APPID', '获取对应用户角色', 115, '/user/role/*', 2, 'GET', NULL, 1, '2018-04-12 03:07:22', '2018-04-12 03:07:22');
-- INSERT INTO `resource` VALUES (120, 'USER_LIST', '获取用户列表', 115, '/user/list', 2, 'GET', NULL, 1, '2018-04-12 03:08:30', '2018-04-12 03:08:30');
-- INSERT INTO `resource` VALUES (121, 'USER_AUTHORITY_ROLE', '给用户授权添加角色', 115, '/user/authority/role', 2, 'POST', NULL, 1, '2018-04-12 03:15:56', '2018-04-12 03:15:56');
-- INSERT INTO `resource` VALUES (122, 'USER_AUTHORITY_ROLE', '删除已经授权的用户角色', 115, '/user/authority/role', 2, 'DELETE', NULL, 1, '2018-04-12 03:29:03', '2018-04-12 03:29:03');
-- INSERT INTO `resource` VALUES (123, 'RESOURCE_AUTORITYMENU', '获取用户被授权菜单', 118, '/resource/authorityMenu', 2, 'GET', NULL, 1, '2018-04-12 05:30:03', '2018-04-12 05:30:03');
-- INSERT INTO `resource` VALUES (124, 'RESOURCE_MENUS', '获取全部菜单列', 118, '/resource/menus', 2, 'GET', NULL, 1, '2018-04-12 05:42:46', '2018-04-12 05:42:46');
-- INSERT INTO `resource` VALUES (125, 'RESOURCE_MENU', '增加菜单', 118, '/resource/menu', 2, 'POST', NULL, 1, '2018-04-12 06:15:39', '2018-04-12 06:15:39');
-- INSERT INTO `resource` VALUES (126, 'RESOURCE_MENU', '修改菜单', 118, '/resource/menu', 2, 'PUT', NULL, 1, '2018-04-12 06:16:35', '2018-04-12 06:16:35');
-- INSERT INTO `resource` VALUES (127, 'RESOURCE_MENU', '删除菜单', 118, '/resource/menu', 2, 'DELETE', NULL, 1, '2018-04-12 06:17:18', '2018-04-12 06:17:18');
-- INSERT INTO `resource` VALUES (128, 'RESOURCE_API', '获取API list', 118, '/resource/api/*/*/*', 2, 'GET', NULL, 1, '2018-04-12 06:18:02', '2018-04-12 06:18:02');
-- INSERT INTO `resource` VALUES (129, 'RESOURCE_API', '增加API', 118, '/resource/api', 2, 'POST', NULL, 1, '2018-04-12 06:18:42', '2018-04-12 06:18:42');
-- INSERT INTO `resource` VALUES (130, 'RESOURCE_API', '修改API', 118, '/resource/api', 2, 'PUT', NULL, 1, '2018-04-12 06:19:32', '2018-04-12 06:19:32');
-- INSERT INTO `resource` VALUES (131, 'RESOURCE_API', '删除API', 118, '/resource/api', 2, 'DELETE', NULL, 1, '2018-04-12 06:20:03', '2018-04-12 06:20:03');
-- INSERT INTO `resource` VALUES (132, 'GROUP_ROLE', '角色系列', 110, NULL, 3, NULL, NULL, 1, '2018-04-12 06:22:02', '2018-04-12 06:22:02');
-- INSERT INTO `resource` VALUES (133, 'ROLE_USER', '获取角色关联用户列表', 132, '/role/user/*/*/*', 2, 'GET', NULL, 1, '2018-04-12 06:22:59', '2018-04-12 06:22:59');
-- INSERT INTO `resource` VALUES (134, 'ROLE_USER', '获取角色未关联用户列表', 132, '/role/user/-/*/*/*', 2, 'GET', NULL, 1, '2018-04-12 06:24:09', '2018-04-12 06:24:09');
-- INSERT INTO `resource` VALUES (135, 'ROLE_API', '获取角色关联API资源', 132, '/role/api/*/*/*', 2, 'GET', NULL, 1, '2018-04-12 06:25:32', '2018-04-12 06:25:32');
-- INSERT INTO `resource` VALUES (136, 'ROLE_API', '获取角色未关联API资源', 132, '/role/api/-/*/*/*', 2, 'GET', NULL, 1, '2018-04-12 06:26:12', '2018-04-12 06:26:12');
-- INSERT INTO `resource` VALUES (137, 'ROLE_MENU', '获取角色关联菜单资源', 132, '/role/menu/*/*/*', 2, 'GET', NULL, 1, '2018-04-12 06:27:20', '2018-04-12 06:27:20');
-- INSERT INTO `resource` VALUES (138, 'ROLE_MENU', '获取角色未关联菜单资源', 132, '/role/menu/-/*/*/*', 2, 'GET', NULL, 1, '2018-04-12 06:27:56', '2018-04-12 06:27:56');
-- INSERT INTO `resource` VALUES (139, 'ROLE_AUTHORITY_RESOURCE', '授权资源给角色', 132, '/role/authority/resource', 2, 'POST', NULL, 1, '2018-04-12 06:29:45', '2018-04-12 06:29:45');
-- INSERT INTO `resource` VALUES (140, 'ROLE_AUTHORITY_RESOURCE', '删除角色的授权资源', 132, '/role/authority/resource', 2, 'DELETE', NULL, 1, '2018-04-12 06:31:12', '2018-04-12 06:31:12');
-- INSERT INTO `resource` VALUES (141, 'ROLE', '获取角色LIST', 132, '/role/*/*', 2, 'GET', NULL, 1, '2018-04-12 06:32:34', '2018-04-12 06:32:34');
-- INSERT INTO `resource` VALUES (142, 'ROLE', '添加角色', 132, '/role', 2, 'POST', NULL, 1, '2018-04-12 06:33:25', '2018-04-12 06:33:25');
-- INSERT INTO `resource` VALUES (143, 'USER', '更新角色', 132, '/role', 2, 'PUT', NULL, 1, '2018-04-12 06:34:27', '2018-04-12 06:34:27');
-- INSERT INTO `resource` VALUES (144, 'ROLE', '删除角色', 132, '/role', 2, 'DELETE', NULL, 1, '2018-04-12 06:35:15', '2018-04-12 06:35:15');
-- INSERT INTO `resource` VALUES (145, 'LOG_WATCH', '日志记录', 104, '/index/log', 1, NULL, 'fa fa-rss-square', 1, '2018-04-22 08:12:24', '2018-04-22 08:12:24');
