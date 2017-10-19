/*
新网委贷系统数据库脚本文件V1.0

只做增量变化,脚本内容应包括:
1.初始化表结构
2.初始化数据
3.表结构修改
4.数据修改

 */

 /*
 Navicat MySQL Data Transfer

 Source Server         : xwwd
 Source Server Type    : MySQL
 Source Server Version : 50629
 Source Host           : localhost
 Source Database       : xwwd

 Target Server Type    : MySQL
 Target Server Version : 50629
 File Encoding         : utf-8

 Date: 06/28/2017 14:00:42 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `TB_BAILOR`
-- ----------------------------
DROP TABLE IF EXISTS `TB_BAILOR`;
CREATE TABLE `TB_BAILOR` (
  `ID` varchar(255) NOT NULL COMMENT '委托人ID',
  `NAME` varchar(255) NOT NULL COMMENT '机构名称',
  `SHORT_NAME` varchar(255) NOT NULL COMMENT '机构简称',
  `IDENTITY_NO` varchar(255) NOT NULL COMMENT '营业执照号',
  `CONTACTS_ADDRESS` varchar(255) NOT NULL COMMENT '联系人地址',
  `CONTACTS_CERTNO` varchar(255) NOT NULL COMMENT '联系人身份证号码',
  `CONTACTS_EMAIL` varchar(255) NOT NULL COMMENT '联系人邮箱地址',
  `CONTACTS_MOBILE` varchar(255) NOT NULL COMMENT '联系人手机号',
  `CONTACTS_NAME` varchar(255) NOT NULL COMMENT '联系人姓名',
  `BANK_SIGNID` varchar(255) DEFAULT NULL COMMENT '银行电子签章帐号',
  `BANK_SIGNED` bit(1) NOT NULL COMMENT '是否已经电子签章',
  `ACCT_OPEN_DATE` datetime NOT NULL COMMENT '开户日期',
  `BANK_CUSID` varchar(255) NOT NULL COMMENT '银行核心客户号',
  `SETTLE_ACCOUNT` varchar(255) NOT NULL COMMENT '对公结算账户',
  `SAVING_ACCOUNT` varchar(255) NOT NULL COMMENT '委托存款账户',
  `STATUS` varchar(255) NOT NULL COMMENT '机构状态' ,
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK45450f2j00sp847c3gpitup9e` (`SETTLE_ACCOUNT`),
  UNIQUE KEY `UKm1vkor6ej5v33kae5rsgxbf4h` (`SAVING_ACCOUNT`),
  UNIQUE KEY `UKmwpqswp7tpgecb2gehyyvwivx` (`BANK_CUSID`),
  UNIQUE KEY `UKjifrr34che4gdquqj63m7t45s` (`BANK_SIGNID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '委托人';

-- ----------------------------
--  Table structure for `TB_BANK_ACCOUNT`
-- ----------------------------
DROP TABLE IF EXISTS `TB_BANK_ACCOUNT`;
CREATE TABLE `TB_BANK_ACCOUNT` (
  `ID` varchar(255) NOT NULL COMMENT '客户银行账户ID',
  `CUSTOMER_ID` varchar(255) NOT NULL COMMENT '客户ID',
  `ACCOUNT_NO` varchar(255) NOT NULL COMMENT '银行卡帐号',
  `BANK_CODE` varchar(255) NOT NULL COMMENT '开户行银行代码',
  `BANK_MOBILE` varchar(255) NOT NULL COMMENT '银行预留手机号',
  `DEFAULT_CARD` bit(1) NOT NULL COMMENT '是否为默认卡',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `FK752fk6hsk69v82vvv3u5rwv0l` (`CUSTOMER_ID`),
  CONSTRAINT `FK752fk6hsk69v82vvv3u5rwv0l` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `TB_CUSTOMER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '客户银行账户';

-- ----------------------------
--  Table structure for `TB_CONTRACT`
-- ----------------------------
DROP TABLE IF EXISTS `TB_CONTRACT`;
CREATE TABLE `TB_CONTRACT` (
  `ID` varchar(255) NOT NULL COMMENT '合同ID',
  `SERIAL_NO` varchar(255) NOT NULL COMMENT '合同编号',
  `LOAN_ID` varchar(255) NOT NULL COMMENT '借款ID',
  `CONTENT` longblob NOT NULL COMMENT '合同内容',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UKe2wky08yu3ub82agwubrjga7g` (`SERIAL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '合同';

-- ----------------------------
--  Table structure for `TB_CUSTOMER`
-- ----------------------------
DROP TABLE IF EXISTS `TB_CUSTOMER`;
CREATE TABLE `TB_CUSTOMER` (
  `ID` varchar(255) NOT NULL COMMENT '客户ID',
  `LOAN_AGENCY_ID` varchar(255) NOT NULL COMMENT '助贷机构ID',
  `MOBILE` varchar(255) NOT NULL COMMENT '手机号',
  `NAME` varchar(255) NOT NULL COMMENT '姓名',
  `CERTIFICATE_TYPE` varchar(255) NOT NULL COMMENT '证件类型',
  `CERTIFICATE_NO` varchar(255) NOT NULL COMMENT '证件号码',
  `GENDER` varchar(255) NOT NULL COMMENT '性别',
  `BIRTH_DATE` datetime NOT NULL COMMENT '出生日期',
  `ETHNIC` varchar(255) NOT NULL COMMENT '民族代码',
  `MARITAL_STATUS` varchar(255) NOT NULL COMMENT '婚姻状况',
  `BANK_CUSID` varchar(255) NOT NULL COMMENT '银行核心客户号',
  `BANK_SIGNID` varchar(255) DEFAULT NULL COMMENT '银行电子签章帐号',
  `BANK_SIGNED` bit(1) NOT NULL COMMENT '是否已经电子签章',
  `PAYMENT_SIGNED` bit(1) NOT NULL COMMENT '是否在银行统一支付系统签约',
  `STATUS` varchar(255) NOT NULL COMMENT '客户状态',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UKl0f3940xfsdaa6cs8jkh4n4qd` (`BANK_CUSID`),
  UNIQUE KEY `UKd9jbm5u3h97tg482yroal8u7w` (`BANK_SIGNID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '客户/借款人';

-- ----------------------------
--  Table structure for `TB_CUSTOMER_INFO`
-- ----------------------------
DROP TABLE IF EXISTS `TB_CUSTOMER_INFO`;
CREATE TABLE `TB_CUSTOMER_INFO` (
  `ID` varchar(255) NOT NULL COMMENT '客户信息ID',
  `EMPLOYEE_FLAG` varchar(255) NOT NULL COMMENT '员工标记',
  `RESIDENCE_TYPE` varchar(255) NOT NULL COMMENT '居民类型',
  `IN_OUT_FLAG` varchar(255) NOT NULL COMMENT '境内境外标记',
  `AGENT_FLAG` varchar(255) NOT NULL COMMENT '代理标记',
  `LIVING_CONDITION` varchar(255) NOT NULL COMMENT '居住状况',
  `INLAND_OFFSHORE` varchar(255) NOT NULL COMMENT '境内境外',
  `INTERNAL_IND` varchar(255) NOT NULL COMMENT '内部客户标记',
  `ISS_AUTHORITY` varchar(255) NOT NULL COMMENT '证件签发机关',
  `ISS_CITY` varchar(255) NOT NULL COMMENT '证件城市',
  `ISS_COUNTRY` varchar(255) NOT NULL COMMENT '证件签发国家',
  `ISS_DATE` datetime NOT NULL COMMENT '证件签发日期',
  `ISS_DIST_CODE` varchar(255) NOT NULL COMMENT '证件地区代码',
  `ISS_EXPIRY_DATE` datetime NOT NULL COMMENT '证件到期日期',
  `ISS_PLACE` varchar(255) NOT NULL COMMENT '证件签发地',
  `ISS_STATE` varchar(255) NOT NULL COMMENT '证件省/州',
  `PREF_FLAG` varchar(255) NOT NULL COMMENT '是否首选证件',
  `ID_CHECK_FLAG` varchar(255) NOT NULL COMMENT '是否联网核查',
  `ADDR_TYPE_CODE` varchar(255) NOT NULL COMMENT '地址类型',
  `COUNTRY_NUMBER` varchar(255) NOT NULL COMMENT '国家代码',
  `DISTRICT_NUMBER` varchar(255) NOT NULL COMMENT '地区区号',
  `PHONE_NUMBER` varchar(255) NOT NULL COMMENT '电话号码',
  `MOBILE_NUMBER` varchar(255) NOT NULL COMMENT '手机号',
  `COUNTRY_CODE` varchar(255) NOT NULL COMMENT '国家代码',
  `PROVINCE_CODE` varchar(255) NOT NULL COMMENT '省州代码',
  `CITY_CODE` varchar(255) NOT NULL COMMENT '城市代码',
  `ADDR_STREET` varchar(255) NOT NULL COMMENT '地址',
  `CUSTOMER_ID` varchar(255) NOT NULL COMMENT '客户ID',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `FKq4t0nqnojkt5oqhp12e1i4ibj` (`CUSTOMER_ID`),
  CONSTRAINT `FKq4t0nqnojkt5oqhp12e1i4ibj` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `TB_CUSTOMER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '客户信息';

-- ----------------------------
--  Table structure for `TB_FUND_RECORD`
-- ----------------------------
DROP TABLE IF EXISTS `TB_FUND_RECORD`;
CREATE TABLE `TB_FUND_RECORD` (
  `ID` varchar(255) NOT NULL COMMENT '资金记录ID',
  `AMOUNT` decimal(15,2) NOT NULL COMMENT '金额',
  `OBJECT_ID` varchar(255) NOT NULL COMMENT '资金流出或流入目标ID',
  `TYPE` varchar(255) NOT NULL COMMENT '资金记录类型',
  `REALM` varchar(255) NOT NULL COMMENT '资金记录对应实体',
  `ENTITY_ID` varchar(255) NOT NULL COMMENT '资金记录对应实体ID',
  `OPERATION` varchar(255) NOT NULL COMMENT '资金操作',
  `ORDER_ID` varchar(255) DEFAULT NULL COMMENT '对应交易记录的流水号',
  `STATUS` varchar(255) NOT NULL COMMENT '资金状态',
  `BANK_ORDER_ID` varchar(255) DEFAULT NULL COMMENT '银行请求流水号',
  `DESCRIPTION` varchar(255) NOT NULL COMMENT '可能为失败的提示信息',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '资金记录';

-- ----------------------------
--  Table structure for `TB_LOAN`
-- ----------------------------
DROP TABLE IF EXISTS `TB_LOAN`;
CREATE TABLE `TB_LOAN` (
  `ID` varchar(255) NOT NULL COMMENT '借款ID',
  `SERIAL_NO` varchar(255) NOT NULL COMMENT '借款编号',
  `CUSTOMER_ID` varchar(255) NOT NULL COMMENT '借款人ID',
  `PRODUCT_ID` varchar(255) NOT NULL COMMENT '产品ID',
  `AMOUNT` int(11) NOT NULL COMMENT '借款金额',
  `RATE` int(11) NOT NULL COMMENT '借款利率',
  `FEE_RATE` int(11) NOT NULL COMMENT '手续费利率',
  `YEARS` int(11) NOT NULL COMMENT '年',
  `MONTHS` int(11) NOT NULL COMMENT '月',
  `DAYS` int(11) NOT NULL COMMENT '日',
  `METHOD` varchar(255) NOT NULL COMMENT '还款方式',
  `PURPOSE` varchar(255) NOT NULL COMMENT '借款用途',
  `REQUEST_DATE` datetime NOT NULL COMMENT '申请日期',
  `APPROVED_DATE` datetime NOT NULL COMMENT '风控审核日期',
  `SETTLED_DATE` datetime NOT NULL COMMENT '放款日期',
  `VALUE_DATE` datetime NOT NULL COMMENT '起息日',
  `DUE_DATE` datetime NOT NULL COMMENT '到期日',
  `STATUS` varchar(255) NOT NULL COMMENT '状态',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UKlykj3obtu1wwg4ssrotpb7vdt` (`SERIAL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '借款';

-- ----------------------------
--  Table structure for `TB_LOAN_AGENCY`
-- ----------------------------
DROP TABLE IF EXISTS `TB_LOAN_AGENCY`;
CREATE TABLE `TB_LOAN_AGENCY` (
  `ID` varchar(255) NOT NULL COMMENT '助贷机构ID',
  `NAME` varchar(255) NOT NULL COMMENT '机构名称',
  `SHORT_NAME` varchar(255) NOT NULL COMMENT '机构简称',
  `IDENTITY_NO` varchar(255) NOT NULL COMMENT '营业执照号码',
  `CONTACTS_ADDRESS` varchar(255) NOT NULL COMMENT '联系人地址',
  `CONTACTS_CERTNO` varchar(255) NOT NULL COMMENT '联系人身份证号码',
  `CONTACTS_EMAIL` varchar(255) NOT NULL COMMENT '联系人邮箱地址',
  `CONTACTS_MOBILE` varchar(255) NOT NULL COMMENT '联系人手机号',
  `CONTACTS_NAME` varchar(255) NOT NULL COMMENT '联系人姓名',
  `SETTLE_ACCOUNT` varchar(255) NOT NULL COMMENT '对公结算账户',
  `BANK_SIGNID` varchar(255) DEFAULT NULL COMMENT '银行电子签章帐号',
  `BANK_SIGNED` bit(1) NOT NULL COMMENT '是否已经电子签章',
  `BANK_CUSID` varchar(255) NOT NULL COMMENT '银行核心客户号',
  `ACCT_OPEN_DATE` datetime NOT NULL COMMENT '开户日期',
  `STATUS` varchar(255) NOT NULL COMMENT '机构状态',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK2x5qhlpusoub66sxxrqm4vqka` (`SETTLE_ACCOUNT`),
  UNIQUE KEY `UKbfwi6ldpt9g3h41lg0wjr2j65` (`BANK_CUSID`),
  UNIQUE KEY `UKqbi3x9dh5l4wv8pde4oj0d273` (`BANK_SIGNID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '助贷机构';

-- ----------------------------
--  Table structure for `TB_LOAN_RECEIPT`
-- ----------------------------
DROP TABLE IF EXISTS `TB_LOAN_RECEIPT`;
CREATE TABLE `TB_LOAN_RECEIPT` (
  `ID` varchar(255) NOT NULL COMMENT '借据ID',
  `SERIAL_NO` varchar(255) NOT NULL COMMENT '编号',
  `LOAN_ID` varchar(255) NOT NULL COMMENT '借款ID',
  `BAILOR_BANK_CUSID` varchar(255) NOT NULL COMMENT '委托机构银行核心客户号',
  `BAILOR_NAME` varchar(255) NOT NULL COMMENT '委托机构名称',
  `BAILOR_SETTLE_ACCOUNT` varchar(255) NOT NULL COMMENT '委托机构对公结算帐号',
  `CONTRACT_SERIAL_NO` varchar(255) NOT NULL COMMENT '合同编号',
  `CUSTOMER_ACCOUNT_NO` varchar(255) NOT NULL COMMENT '借款人银行账户',
  `CUSTOMER_BANK_CUSID` varchar(255) NOT NULL COMMENT '借款人银行客户号',
  `CUSTOMER_BIRTH_DATE` datetime NOT NULL COMMENT '借款人出生日期',
  `CUSTOMER_CERT_NO` varchar(255) NOT NULL COMMENT '借款人证件号码',
  `CUSTOMER_ETHNIC` varchar(255) NOT NULL COMMENT '借款人民族代码',
  `CUSTOMER_GENDER` varchar(255) NOT NULL COMMENT '借款人性别',
  `AMOUNT` int(11) NOT NULL COMMENT '借款金额',
  `RATE` int(11) NOT NULL COMMENT '借款利率',
  `DAYS` int(11) NOT NULL COMMENT '天',
  `MONTHS` int(11) NOT NULL COMMENT '月',
  `YEARS` int(11) NOT NULL COMMENT '年',
  `METHOD` varchar(255) NOT NULL COMMENT '还款方式',
  `VALUE_DATE` datetime NOT NULL COMMENT '起息日',
  `ADDR_STREET` varchar(255) NOT NULL COMMENT '地址',
  `ADDR_TYPE_CODE` varchar(255) NOT NULL COMMENT '地址类型',
  `AGENT_FLAG` varchar(255) NOT NULL COMMENT '代理标记',
  `CITY_CODE` varchar(255) NOT NULL COMMENT '城市代码',
  `COUNTRY_CODE` varchar(255) NOT NULL COMMENT '国家代码',
  `COUNTRY_NUMBER` varchar(255) NOT NULL COMMENT '国家代码',
  `DISTRICT_NUMBER` varchar(255) NOT NULL COMMENT '地区区号',
  `EMPLOYEE_FLAG` varchar(255) NOT NULL COMMENT '员工标记',
  `ID_CHECK_FLAG` varchar(255) NOT NULL COMMENT '是否联网核查',
  `IN_OUT_FLAG` varchar(255) NOT NULL COMMENT '境内境外标记',
  `INLAND_OFFSHORE` varchar(255) NOT NULL COMMENT '境内境外',
  `INTERNAL_IND` varchar(255) NOT NULL COMMENT '内部客户标记',
  `ISS_AUTHORITY` varchar(255) NOT NULL COMMENT '证件签发机关',
  `ISS_CITY` varchar(255) NOT NULL COMMENT '证件城市',
  `ISS_COUNTRY` varchar(255) NOT NULL COMMENT '证件签发国家',
  `ISS_DATE` datetime NOT NULL COMMENT '证件签发日期',
  `ISS_DIST_CODE` varchar(255) NOT NULL COMMENT '证件地区代码',
  `ISS_EXPIRY_DATE` datetime NOT NULL COMMENT '证件到期日期',
  `ISS_PLACE` varchar(255) NOT NULL COMMENT '证件签发地',
  `ISS_STATE` varchar(255) NOT NULL COMMENT '证件省/州',
  `LIVING_CONDITION` varchar(255) NOT NULL COMMENT '居住状况',
  `MOBILE_NUMBER` varchar(255) NOT NULL COMMENT '手机号',
  `PHONE_NUMBER` varchar(255) NOT NULL COMMENT '电话号码',
  `PREF_FLAG` varchar(255) NOT NULL COMMENT '是否首选证件',
  `PROVINCE_CODE` varchar(255) NOT NULL COMMENT '省州代码',
  `RESIDENCE_TYPE` varchar(255) NOT NULL COMMENT '居民类型',
  `CUSTOMER_MARITAL_STAT` varchar(255) NOT NULL COMMENT '借款人婚姻状况',
  `CUSTOMER_NAME` varchar(255) NOT NULL COMMENT '借款人姓名',
  `DUE_DATE` datetime NOT NULL COMMENT '到期日',
  `STATUS` varchar(255) NOT NULL COMMENT '借据状态',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UKicws2ryg8ogxkvpihc2steg1y` (`SERIAL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '借据';

-- ----------------------------
--  Table structure for `TB_LOAN_REPAYMENT`
-- ----------------------------
DROP TABLE IF EXISTS `TB_LOAN_REPAYMENT`;
CREATE TABLE `TB_LOAN_REPAYMENT` (
  `ID` varchar(255) NOT NULL COMMENT '还款计划ID',
  `LOAN_ID` varchar(255) NOT NULL COMMENT '借款ID',
  `PERIOD` int(11) NOT NULL COMMENT '当期期数',
  `REPAY_AMOUNT` decimal(15,2) NOT NULL COMMENT '实际还款金额',
  `REPAY_DATE` datetime NOT NULL COMMENT '实际还款日期',
  `STATUS` varchar(255) NOT NULL COMMENT '还款状态',
  `SOURCE_REALM` varchar(255) DEFAULT NULL COMMENT '还款来源实体',
  `SOURCE_ID` varchar(255) DEFAULT NULL COMMENT '还款来源实体ID',
  `AMOUNT_INTEREST` decimal(15,2) NOT NULL COMMENT '偿还利息',
  `AMOUNT_OUTSTANDING` decimal(15,2) NOT NULL COMMENT '剩余本息',
  `AMOUNT_PRINCIPAL` decimal(15,2) NOT NULL COMMENT '偿还本金',
  `DUE_DATE` datetime NOT NULL COMMENT '到期日',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  KEY `FKcj2q8674gik2cab65frbt3ws0` (`LOAN_ID`),
  CONSTRAINT `FKcj2q8674gik2cab65frbt3ws0` FOREIGN KEY (`LOAN_ID`) REFERENCES `TB_LOAN` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '还款计划';

-- ----------------------------
--  Table structure for `TB_ORGANIZATIONS`
-- ----------------------------
DROP TABLE IF EXISTS `TB_ORGANIZATIONS`;
CREATE TABLE `TB_ORGANIZATIONS` (
  `ID` varchar(255) NOT NULL COMMENT '组织机构ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `ENABLED` bit(1) DEFAULT NULL COMMENT '是否启用',
  `LOGO` varchar(255) DEFAULT NULL COMMENT '机构LOGO',
  `NOTE` varchar(255) DEFAULT NULL COMMENT '备注',
  `ORGANIZATION_NAME` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `ORGANIZATION_NICKNAME` varchar(255) DEFAULT NULL COMMENT '中文名称',
  `ORGANIZATION_PATH` varchar(255) DEFAULT NULL COMMENT '组织机构路径',
  `PARENT_ORGANIZATION_ID` varchar(255) DEFAULT NULL COMMENT '父级机构ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '组织机构';

-- ----------------------------
--  Table structure for `TB_PERMISSIONS`
-- ----------------------------
DROP TABLE IF EXISTS `TB_PERMISSIONS`;
CREATE TABLE `TB_PERMISSIONS` (
  `ID` varchar(255) NOT NULL COMMENT '权限ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `ENABLED` bit(1) DEFAULT NULL COMMENT '是否启用',
  `NOTE` varchar(255) DEFAULT NULL COMMENT '备注',
  `TYPE` INT NULL COMMENT '权限类型',
  `PERMISSION_NAME` varchar(255) DEFAULT NULL COMMENT '权限名称',
  `PERMISSION_NICKNAME` varchar(255) DEFAULT NULL COMMENT '中文描述',
  `PERMISSION_URL` varchar(255) DEFAULT NULL COMMENT '权限URL地址',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '权限';

-- ----------------------------
--  Table structure for `TB_PRODUCT`
-- ----------------------------
DROP TABLE IF EXISTS `TB_PRODUCT`;
CREATE TABLE `TB_PRODUCT` (
  `ID` varchar(255) NOT NULL COMMENT '产品ID',
  `SERIAL_NO` varchar(255) NOT NULL COMMENT '编号',
  `NAME` varchar(255) NOT NULL COMMENT '名称',
  `BAILOR_ID` varchar(255) NOT NULL COMMENT '委托机构ID',
  `AGENCY_ID` varchar(255) NOT NULL COMMENT '助贷机构ID',
  `AMOUNT` int(11) NOT NULL COMMENT '放款规模',
  `DUE_DATE` datetime NOT NULL COMMENT '到期日',
  `LOAN_TYPE` varchar(255) NOT NULL COMMENT '贷款类型',
  `MAX_AMOUNT` int(11) NOT NULL COMMENT '最大贷款金额',
  `MAX_DURATION` int(11) NOT NULL COMMENT '最大贷款期限',
  `MAX_RATE` int(11) NOT NULL COMMENT '最大贷款利率',
  `MIN_AMOUNT` int(11) NOT NULL COMMENT '最小贷款金额',
  `MIN_DURATION` int(11) NOT NULL COMMENT '最小贷款期限',
  `MIN_RATE` int(11) NOT NULL COMMENT '最小贷款利率',
  `GRANT_TYPE` varchar(255) NOT NULL COMMENT '贷款发放方式',
  `RECOVERY_TYPE` varchar(255) NOT NULL COMMENT '贷款回收方式',
  `CHANNEL_FEE_RATE` int(11) NOT NULL COMMENT '通道手续费率',
  `CONTRACT_TEMP_ID` varchar(255) NOT NULL COMMENT '合同模版ID',
  `SHARE_PROFIT_AGENCY` varchar(255) NOT NULL COMMENT '通道费分润机构',
  `SHARE_PROFIT_RATE` varchar(255) NOT NULL COMMENT '通道费分润比例',
  `STATUS` varchar(255) NOT NULL COMMENT '状态',
  `REMAIN_AMOUNT` int(11) NOT NULL COMMENT '贷款余额',
  `LOAN_NUMBER` int(11) NOT NULL COMMENT '在贷笔数',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UKg3wrfo7ntvryxubvgun9pi0xo` (`SERIAL_NO`),
  KEY `FKq72ru1xim5y7e54v8ywdhyori` (`BAILOR_ID`),
  KEY `FKqb9vbnugm92an1t3hfr3th89o` (`AGENCY_ID`),
  CONSTRAINT `FKq72ru1xim5y7e54v8ywdhyori` FOREIGN KEY (`BAILOR_ID`) REFERENCES `TB_BAILOR` (`ID`),
  CONSTRAINT `FKqb9vbnugm92an1t3hfr3th89o` FOREIGN KEY (`AGENCY_ID`) REFERENCES `TB_LOAN_AGENCY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '产品';

-- ----------------------------
--  Table structure for `TB_ROLES`
-- ----------------------------
DROP TABLE IF EXISTS `TB_ROLES`;
CREATE TABLE `TB_ROLES` (
  `ID` varchar(255) NOT NULL COMMENT '角色ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `ENABLED` bit(1) DEFAULT NULL COMMENT '是否启用',
  `INHERITED` bit(1) DEFAULT NULL COMMENT '是否继承',
  `NOTE` varchar(255) DEFAULT NULL COMMENT '备注',
  `ROLE_NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `ROLE_NICKNAME` varchar(255) DEFAULT NULL COMMENT '角色中文名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT = '角色';

-- ----------------------------
--  Table structure for `TB_TRANS_RECORD`
-- ----------------------------
DROP TABLE IF EXISTS `TB_TRANS_RECORD`;
CREATE TABLE `TB_TRANS_RECORD` (
  `ID` varchar(255) NOT NULL COMMENT '交易记录ID',
  `SOURCE_ID` varchar(255) NOT NULL COMMENT '交易发起方实体ID',
  `SOURCE_REALM` varchar(255) NOT NULL COMMENT '交易发起方实体',
  `TARGET_ID` varchar(255) NOT NULL COMMENT '交易接收方实体ID',
  `TARGET_REALM` varchar(255) NOT NULL COMMENT '交易接收方实体',
  `TYPE` varchar(255) NOT NULL COMMENT '交易记录类型',
  `STATUS` int(11) NOT NULL COMMENT '交易记录状态',
  `COMMENT` varchar(255) NOT NULL COMMENT '交易结果信息',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '交易记录';

-- ----------------------------
--  Table structure for `TB_USERS`
-- ----------------------------
DROP TABLE IF EXISTS `TB_USERS`;
CREATE TABLE `TB_USERS` (
  `ID` varchar(255) NOT NULL COMMENT '用户ID',
  `USER_NAME` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `PASSWORD` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `NICKNAME` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `EMAIL` varchar(255) DEFAULT NULL COMMENT '邮件地址',
  `ENABLED` bit(1) DEFAULT NULL COMMENT '启用状态',
  `NOTE` varchar(255) DEFAULT NULL COMMENT '备注',
  `SALT` int(11) DEFAULT NULL COMMENT '参与计算密码hash值的salt',
  `PHONE_NUMBER` VARCHAR(32) NULL COMMENT '电话号码',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `LAST_LOGIN_TIME` DATETIME NULL COMMENT  '上次登录时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '用户';


-- ----------------------------
--  2017.06.30 add by vincent
-- ----------------------------

DROP TABLE IF EXISTS `TB_LENDING_RECORD`;
CREATE TABLE `TB_LENDING_RECORD` (
  `ID` varchar(255) NOT NULL COMMENT '放款记录ID',
  `LOAN_ID` varchar(255) NOT NULL COMMENT '借款ID',
  `ORDER_ID` varchar(255) NOT NULL COMMENT '交易流水号',
  `AMOUNT` int(11) NOT NULL COMMENT '放款金额',
  `STATUS` varchar(255) NOT NULL COMMENT '放款状态',
  `COMMENT` varchar(255) NOT NULL COMMENT '交易结果信息',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '放款记录';


DROP TABLE IF EXISTS `TB_REPAYMENT_RECORD`;
CREATE TABLE `TB_REPAYMENT_RECORD` (
  `ID` varchar(255) NOT NULL COMMENT '还款记录ID',
  `COMMENT` varchar(255) NOT NULL COMMENT '交易结果信息',
  `LOAN_ID` varchar(255) NOT NULL COMMENT '借款ID',
  `ORDER_ID` varchar(255) NOT NULL COMMENT '交易流水号',
  `PERIOD` int(11) NOT NULL COMMENT '还款期数',
  `REPAY_AMOUNT` decimal(15,2) NOT NULL COMMENT '还款金额',
  `REPAY_DATE` datetime NOT NULL COMMENT '还款日期',
  `REPAY_FEE` decimal(15,2) NOT NULL COMMENT '还款手续费',
  `REPAY_INTEREST` decimal(15,2) NOT NULL COMMENT '还款利息',
  `REPAY_PRINCIPAL` decimal(15,2) NOT NULL COMMENT '还款本金',
  `TYPE` varchar(255) NOT NULL COMMENT '还款类型',
  `STATUS` varchar(255) NOT NULL COMMENT '还款状态',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '还款记录';

-- ----------------------------
--  2017.07.13 add by vincent
-- ----------------------------
-- -----------------------------------------------------
-- Table `RF_ROLE_PERMISSION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RF_ROLE_PERMISSION` (
  `ROLE_ID` VARCHAR(32) NOT NULL,
  `PERMISSION_ID` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`ROLE_ID`, `PERMISSION_ID`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8
  COMMENT = '角色权限关系';

-- -----------------------------------------------------
-- Table `RF_USER_ROLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RF_USER_ROLE` (
  `USER_ID` VARCHAR(32) CHARACTER SET 'utf8' NOT NULL,
  `ROLE_ID` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`USER_ID`, `ROLE_ID`))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8
  COMMENT = '用户角色关系';

-- -----------------------------------------------------
-- Table `RF_ORGANIZATION_USER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RF_ORGANIZATION_USER` (
  `ORGANIZATION_ID` VARCHAR(32) NOT NULL COMMENT '机构ID',
  `USER_ID` VARCHAR(32) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`ORGANIZATION_ID`, `USER_ID`))
  ENGINE = InnoDB
  COMMENT = '机构用户关系';

-- -----------------------------------------------------
-- Table `RF_ORGANIZATION_ROLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RF_ORGANIZATION_ROLE` (
  `ORGANIZATION_ID` VARCHAR(32) NOT NULL COMMENT '机构ID',
  `ROLE_ID` VARCHAR(32) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`ORGANIZATION_ID`, `ROLE_ID`))
  ENGINE = InnoDB
  COMMENT = '机构角色关系';


-- -----------------------------------------------------
-- Table `RF_ORGANIZATION_PERMISSION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RF_ORGANIZATION_PERMISSION` (
  `ORGANIZATION_ID` VARCHAR(32) NOT NULL COMMENT '机构ID',
  `PERMISSION_ID` VARCHAR(32) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`ORGANIZATION_ID`, `PERMISSION_ID`))
  ENGINE = InnoDB
  COMMENT = '机构权限关系';


-- -----------------------------------------------------
-- Table `TB_GROUPS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TB_GROUPS` (
  `ID` VARCHAR(32) NOT NULL COMMENT '权限ID，采用UUID值',
  `GROUP_NAME` VARCHAR(64) NOT NULL COMMENT '分组名称，采用英文标识，不可重复',
  `GROUP_NICKNAME` VARCHAR(64) NULL COMMENT '分组的中文描述',
  `GROUP_PATH` VARCHAR(128) NULL COMMENT '分组的路径，采用4位大写字符组成，子分组路径以父级路径作为前缀。',
  `PARENT_GROUP_ID` VARCHAR(32) NULL COMMENT '父级分组ID',
  `CREATE_TIME` DATETIME NULL,
  `ENABLED` INT(11) NULL COMMENT '是否启用，1：启用、0：禁用，默认1',
  `NOTE` VARCHAR(255) NULL COMMENT '备注信息',
  `ORDER_NUMBER` INT NULL COMMENT '排列顺序',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `GROUP_PATH_UNIQUE` (`GROUP_PATH` ASC))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8
  COMMENT = '分组，可以用于定义菜单或权限分组显示';


-- -----------------------------------------------------
-- Table `RF_GROUP_PERMISSION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RF_GROUP_PERMISSION` (
  `GROUP_ID` VARCHAR(32) NOT NULL COMMENT '机构ID',
  `PERMISSION_ID` VARCHAR(32) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`GROUP_ID`, `PERMISSION_ID`))
  ENGINE = InnoDB
  COMMENT = '分组权限关系';


-- 写入超级用户，账号：superadmin 密码：123
insert into TB_USERS (ID, USER_NAME, PASSWORD, SALT, NICKNAME, CREATE_TIME, ENABLED, NOTE) values ('99b3148de2184fc9ba5e39196c85b045', 'superadmin', '8E13A4AA4E213B29444FEFBE1A0FFC07', 43769, '超级管理员', now(), 1, '该用户为初始化的超级管理员，再创建自己的超管后，请删除该超管用户！');

-- 写入超管角色
insert into TB_ROLES (ID, ROLE_NAME, ROLE_NICKNAME, CREATE_TIME, ENABLED, NOTE) values ('88b3148de2184fc9ba5e39196c85b045', 'SUPER_ADMIN', '超级管理员', now(), 1, '初始化的超级管理员角色。');

-- 写入用户与角色关系数据
insert into RF_USER_ROLE (USER_ID, ROLE_ID) values ('99b3148de2184fc9ba5e39196c85b045', '88b3148de2184fc9ba5e39196c85b045');

-- ----------------------------
--  2017.07.17 add by wanglanxiao
-- ----------------------------
DROP TABLE IF EXISTS `TB_BAILOR_LOAN_STATISTICS`;
CREATE TABLE `TB_BAILOR_LOAN_STATISTICS` (
  `ID` varchar(255) NOT NULL COMMENT '委托机构总体统计ID',
  `TIMERECORD` datetime NOT NULL COMMENT '创建日期',
  `TIMEUPDATE` datetime NOT NULL COMMENT '修改日期',
  `CLEARED_COUNT` bigint(20) NOT NULL COMMENT '已结清笔数',
  `LOAN_AMOUNT` bigint(20) NOT NULL COMMENT '贷款总金额',
  `LOAN_BALANCE` bigint(20) NOT NULL COMMENT '贷款余额',
  `LOAN_COUNT` bigint(20) NOT NULL COMMENT '贷款总笔数',
  `OPERATE_DATE` datetime NOT NULL COMMENT '统计日期',
  `OVERDUE_COUNT` bigint(20) NOT NULL COMMENT '逾期笔数',
  `OVERDUE_FEE` decimal(15,2) NOT NULL COMMENT '逾期费用',
  `OVERDUE_INTEREST` decimal(15,2) NOT NULL  COMMENT '逾期利息',
  `OVERDUE_PENALTY_INTEREST` decimal(15,2) NOT NULL COMMENT '逾期罚息',
  `OVERDUE_PRINCIPAL` decimal(15,2) NOT NULL COMMENT '逾期本金',
  `REPAYMENT_FEE` decimal(15,2) NOT NULL COMMENT '已还费用',
  `REPAYMENT_INTEREST` decimal(15,2) NOT NULL COMMENT '已还利息',
  `REPAYMENT_PRINCIPAL` decimal(15,2) NOT NULL COMMENT '已还本金',
  `RESIDUAL_FEE` decimal(15,2) NOT NULL COMMENT '待还费用',
  `RESIDUAL_INTEREST` decimal(15,2) NOT NULL COMMENT '待还利息',
  `UNCLEARED_COUNT` bigint(20) NOT NULL COMMENT '未结清笔数',
  `BAILOR_ID` varchar(255) NOT NULL COMMENT '委托机构ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  2017.07.17 add by wanglanxiao
-- ----------------------------
DROP TABLE IF EXISTS `TB_CUSTOMER_LOAN_STATISTICS`;
CREATE TABLE `TB_CUSTOMER_LOAN_STATISTICS` (
  `ID` varchar(255) NOT NULL COMMENT '客户总体统计ID',
  `TIMERECORD` datetime NOT NULL COMMENT '创建日期',
  `TIMEUPDATE` datetime NOT NULL COMMENT '修改日期',
  `CLEARED_COUNT` bigint(20) NOT NULL COMMENT '已结清笔数',
  `LOAN_AMOUNT` bigint(20) NOT NULL COMMENT '贷款总金额',
  `LOAN_BALANCE` bigint(20) NOT NULL COMMENT '贷款余额',
  `LOAN_COUNT` bigint(20) NOT NULL COMMENT '贷款总笔数',
  `OPERATE_DATE` datetime NOT NULL COMMENT '统计日期',
  `OVERDUE_COUNT` bigint(20) NOT NULL COMMENT '逾期笔数',
  `OVERDUE_FEE` decimal(15,2) NOT NULL COMMENT '逾期费用',
  `OVERDUE_INTEREST` decimal(15,2) NOT NULL COMMENT '逾期利息',
  `OVERDUE_PENALTY_INTEREST` decimal(15,2) NOT NULL COMMENT '逾期罚息',
  `OVERDUE_PRINCIPAL` decimal(15,2) NOT NULL COMMENT '逾期本金',
  `REPAYMENT_FEE` decimal(15,2) NOT NULL COMMENT '已还费用',
  `REPAYMENT_INTEREST` decimal(15,2) NOT NULL COMMENT '已还利息',
  `REPAYMENT_PRINCIPAL` decimal(15,2) NOT NULL COMMENT '已还本金',
  `RESIDUAL_FEE` decimal(15,2) NOT NULL COMMENT '待还费用',
  `RESIDUAL_INTEREST` decimal(15,2) NOT NULL COMMENT '待还利息',
  `UNCLEARED_COUNT` bigint(20) NOT NULL COMMENT '未结清笔数',
  `CUSTOMER_ID` varchar(255) NOT NULL COMMENT '委贷平台客户ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  2017.07.17 add by wanglanxiao
-- ----------------------------
DROP TABLE IF EXISTS `TB_LOANAGENCY_LOAN_STATISTICS`;
CREATE TABLE `TB_LOANAGENCY_LOAN_STATISTICS` (
  `ID` varchar(255) NOT NULL COMMENT '助贷机构总体统计ID',
  `TIMERECORD` datetime NOT NULL COMMENT '创建日期',
  `TIMEUPDATE` datetime NOT NULL COMMENT '修改日期',
  `CLEARED_COUNT` bigint(20) NOT NULL COMMENT '已结清笔数',
  `LOAN_AMOUNT` bigint(20) NOT NULL COMMENT '贷款总金额',
  `LOAN_BALANCE` bigint(20) NOT NULL COMMENT '贷款余额',
  `LOAN_COUNT` bigint(20) NOT NULL COMMENT '贷款总笔数',
  `OPERATE_DATE` datetime NOT NULL COMMENT '统计日期',
  `OVERDUE_COUNT` bigint(20) NOT NULL COMMENT '逾期笔数',
  `OVERDUE_FEE` decimal(15,2) NOT NULL COMMENT '逾期费用',
  `OVERDUE_INTEREST` decimal(15,2) NOT NULL COMMENT '逾期利息',
  `OVERDUE_PENALTY_INTEREST` decimal(15,2) NOT NULL COMMENT '逾期罚息',
  `OVERDUE_PRINCIPAL` decimal(15,2) NOT NULL COMMENT '逾期本金',
  `REPAYMENT_FEE` decimal(15,2) NOT NULL COMMENT '已还费用',
  `REPAYMENT_INTEREST` decimal(15,2) NOT NULL COMMENT '已还利息',
  `REPAYMENT_PRINCIPAL` decimal(15,2) NOT NULL COMMENT '已还本金',
  `RESIDUAL_FEE` decimal(15,2) NOT NULL COMMENT '待还费用',
  `RESIDUAL_INTEREST` decimal(15,2) NOT NULL COMMENT '待还利息',
  `UNCLEARED_COUNT` bigint(20) NOT NULL COMMENT '未结清笔数',
  `LOAN_AGENCY_ID` varchar(255) NOT NULL COMMENT '助贷机构ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  2017.07.17 add by wanglanxiao
-- ----------------------------
DROP TABLE IF EXISTS `TB_PRODUCT_DAILY_STATISTICS`;
CREATE TABLE `TB_PRODUCT_DAILY_STATISTICS` (
  `ID` varchar(255) NOT NULL COMMENT '产品日常统计ID',
  `TIMERECORD` datetime NOT NULL COMMENT '创建日期',
  `TIMEUPDATE` datetime NOT NULL COMMENT '修改日期',
  `BALANCE` decimal(15,2) NOT NULL COMMENT '当日放款余额',
  `DATE` datetime NOT NULL COMMENT '统计日期',
  `PRODUCT_ID` varchar(255) NOT NULL COMMENT '产品Id',
  `REQUEST_AMOUNT` decimal(15,2) NOT NULL COMMENT '当日申请金额',
  `REQUEST_COUNT` int(11) NOT NULL COMMENT '当日申请笔数',
  `SETTLED_AMOUNT` decimal(15,2) NOT NULL COMMENT '当日放款金额',
  `SETTLED_COUNT` int(11) NOT NULL COMMENT '当日放款笔数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  2017.07.17 add by wanglanxiao
-- ----------------------------
DROP TABLE IF EXISTS `TB_BAILOR_DAILY_STATISTICS`;
CREATE TABLE `TB_BAILOR_DAILY_STATISTICS` (
  `ID` varchar(255) NOT NULL COMMENT '委托机构日常统计ID',
  `TIMERECORD` datetime NOT NULL COMMENT '创建日期',
  `TIMEUPDATE` datetime NOT NULL COMMENT '修改日期',
  `DATE` datetime NOT NULL COMMENT '统计日期',
  `REPAY_FEE` decimal(15,2) NOT NULL COMMENT '当日还款手续费',
  `REPAY_INTEREST` decimal(15,2) NOT NULL COMMENT '当日还款利息',
  `REPAY_PENALTY_INTEREST` decimal(15,2) NOT NULL COMMENT '当日还款罚息',
  `REPAYMENT_PRINCIPAL` decimal(15,2) NOT NULL COMMENT '当日还款本金',
  `SETTLED_AMOUNT` bigint(20) NOT NULL COMMENT '当日放款总金额',
  `BAILOR_ID` varchar(255) NOT NULL COMMENT '委托机构ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  2017.07.17 add by wanglanxiao
-- ----------------------------
DROP TABLE IF EXISTS `TB_LOANAGENCY_DAILY_STATISTICS`;
CREATE TABLE `TB_LOANAGENCY_DAILY_STATISTICS` (
  `ID` varchar(255) NOT NULL COMMENT '助贷机构日常统计ID',
  `TIMERECORD` datetime NOT NULL COMMENT '创建日期',
  `TIMEUPDATE` datetime NOT NULL COMMENT '修改日期',
  `DATE` datetime NOT NULL COMMENT '统计日期',
  `REPAY_FEE` decimal(15,2) NOT NULL COMMENT '当日还款手续费',
  `REPAY_INTEREST` decimal(15,2) NOT NULL COMMENT '当日还款利息',
  `REPAY_PENALTY_INTEREST` decimal(15,2) NOT NULL COMMENT '当日还款罚息',
  `REPAYMENT_PRINCIPAL` decimal(15,2) NOT NULL COMMENT '当日还款本金',
  `SETTLED_AMOUNT` bigint(20) NOT NULL COMMENT '当日放款总金额',
  `LOAN_AGENCY_ID` varchar(255) NOT NULL COMMENT '助贷机构ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
--  2017.07.18 add by recursion
-- ----------------------------
DROP TABLE IF EXISTS `TB_DAILY_INTEREST_STATISTICS`;
CREATE TABLE `TB_DAILY_INTEREST_STATISTICS` (
  `ID` varchar(255) NOT NULL COMMENT '每日计息记录ID',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  `DAILY_INTEREST` decimal(15,2) DEFAULT NULL COMMENT '当日利息',
  `LOAN_ID` varchar(255) NOT NULL COMMENT '借款ID',
  `OVERDUE_INTEREST` decimal(15,2) NOT NULL COMMENT '截止到当日的逾期利息',
  `UNDUE_INTEREST` decimal(15,2) NOT NULL COMMENT '截止到当日的为还利息',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '每日计息表';


-- ----------------------------
--  2017.07.21 add by vincent
-- ----------------------------
DROP TABLE IF EXISTS `TB_UNIPAY_CARDBIN`;
CREATE TABLE `TB_UNIPAY_CARDBIN` (
  `ID` varchar(255) NOT NULL COMMENT '统一支付卡bin信息记录ID',
  `CARD_BIN` varchar(255) NOT NULL COMMENT '卡bin',
  `LENGTH` varchar(255) NOT NULL COMMENT '卡号长度',
  `TYPE` varchar(255) NOT NULL COMMENT '卡种',
  `BANK_NAME` varchar(255) NOT NULL COMMENT '所属银行名称',
  `UNIPAY_BANK_CODE` varchar(255) NOT NULL COMMENT '统一支付行号',
  `UNIPAY_BANK_NAME` varchar(255) NOT NULL COMMENT '统一支付行名',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK8nls88w68f798b3xd1og16v6h` (`CARD_BIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '统一支付卡bin信息';


-- ----------------------------
-- Table structure for TB_SYSTEM_CONFIG
--  2017.07.22 add by vincent
-- ----------------------------
DROP TABLE IF EXISTS `TB_SYSTEM_CONFIG`;
CREATE TABLE `TB_SYSTEM_CONFIG`  (
  `CONFIG_KEY` VARCHAR(255) NOT NULL COMMENT '属性键值',
  `CONFIG_VALUE` VARCHAR(255) NOT NULL COMMENT '属性值',
  PRIMARY KEY (`CONFIG_KEY`)
) ENGINE = InnoDB DEFAULT CHARSET=utf8 COMMENT '系统设置';

INSERT INTO TB_SYSTEM_CONFIG (CONFIG_KEY, CONFIG_VALUE) VALUES ('CUSTOM_TIME', '2015-07-22');

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Table structure for TB_BATCH_TASK
--  2017.07.28 add by jiangchengyi
-- ----------------------------
DROP TABLE IF EXISTS `TB_BATCH_TASK`;
CREATE TABLE `TB_BATCH_TASK` (
  `ID` varchar(255) NOT NULL COMMENT '跑批记录ID',
  `TASK_NAME` VARCHAR(32) NOT NULL COMMENT '任务名称',
  `TASK_STATUS` VARCHAR(8) NOT NULL COMMENT '任务状态',
  `TASK_DATE` VARCHAR(8) NOT NULL COMMENT '执行时间',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '跑批记录';


-- ----------------------------
--  增加权限相关初始化数据 ---
--  2017.08.01 add by zhnlk
-- ----------------------------
--
-- 设置组织机构
INSERT INTO TB_ORGANIZATIONS (ID, ORGANIZATION_NAME, ORGANIZATION_NICKNAME, LOGO, PARENT_ORGANIZATION_ID, CREATE_TIME, ENABLED, NOTE)
VALUES
  ('00000000000000000001', 'xwwd2', '新网委贷', NULL, NULL, now(), 1, '指定的机构组织');
-- 设置管理员
-- 设置角色（管理员）
-- 设置权限
INSERT INTO TB_PERMISSIONS (ID, PERMISSION_NAME, PERMISSION_NICKNAME, PERMISSION_URL, TYPE, CREATE_TIME, ENABLED, NOTE)
VALUES
  ('00000000000000001010', 'PERMISSION_LOAN_AGENCY_LIST', '查看助贷方列表信息', '/api/v1/loanAgency/list', 1, now(), 1,
   '助贷方相关权限'),
  ('00000000000000001011', 'PERMISSION_LOAN_AGENCY_DETAIL', '查看助贷方信息', '/api/v1/loanAgency/findById', 1, now(), 1, '助贷方相关权限'),
  ('00000000000000001012', 'PERMISSION_LOAN_AGENCY_LOAN', '查看助贷方助贷信息', '/api/v1/loanAgency/loanFilter', 1, now(), 1, '助贷方相关权限'),
  ('00000000000000001013', 'PERMISSION_LOAN_AGENCY_FUND', '查看助贷方资金记录', '/api/v1/loanAgency/fundRecordFilter', 1, now(), 1, '助贷方相关权限'),
  ('00000000000000001014', 'PERMISSION_LOAN_AGENCY_DISABLE', '禁用助贷方账户', '/api/v1/loanAgency/block', 1, now(), 1, '助贷方相关权限'),
  ('00000000000000001015', 'PERMISSION_LOAN_AGENCY_ENABLE', '启用助贷方账户', '/api/v1/loanAgency/unblock', 1, now(), 1, '助贷方相关权限'),
  ('00000000000000001016', 'PERMISSION_LOAN_AGENCY_CHECK', '查验对公账户', '/api/v1/loanAgency/check', 1, now(), 1, '助贷方相关权限'),
  ('00000000000000001017', 'PERMISSION_LOAN_AGENCY_ALTER', '创建/修改助贷方账户', '/api/v1/loanAgency/create', 1, now(), 1, '助贷方相关权限'),
  ('00000000000000001018', 'PERMISSION_LOAN_AGENCY_STAT', '查看助贷方统计信息', '/api/v1/loanAgency/stat', 1, now(), 1, '助贷方相关权限'),

  ('00000000000000001020', 'PERMISSION_BAILOR_LIST', '查看委托人列表信息', '/api/v1/bailor/list', 1, now(), 1, '委托人相关权限'),
  ('00000000000000001021', 'PERMISSION_BAILOR_CHECK', '查验对公账号', '/api/v1/bailor/check', 1, now(), 1, '委托人相关权限'),
  ('00000000000000001022', 'PERMISSION_BAILOR_ALTER', '创建/修改委托人账户', '/api/v1/bailor/create', 1, now(), 1, '委托人相关权限'),
  ('00000000000000001023', 'PERMISSION_BAILOR_DETAIL', '查看委托人信息', '/api/v1/bailor/findById', 1, now(), 1, '委托人相关权限'),
  ('00000000000000001024', 'PERMISSION_BAILOR_LOAN', '查看委托人放款信息', '/api/v1/bailor/loanFilter', 1, now(), 1, '委托人相关权限'),
  ('00000000000000001025', 'PERMISSION_BAILOR_FUND', '查看委托人资金记录', '/api/v1/bailor/fundRecordFilter', 1, now(), 1, '委托人相关权限'),
  ('00000000000000001026', 'PERMISSION_BAILOR_DISABLE', '禁用委托人账户', '/api/v1/bailor/block', 1, now(), 1, '委托人相关权限'),
  ('00000000000000001027', 'PERMISSION_BAILOR_ENABLE', '启用委托人账户', '/api/v1/bailor/unblock', 1, now(), 1, '委托人相关权限'),
  ('00000000000000001028', 'PERMISSION_BAILOR_STAT', '查看委托人统计信息', '/api/v1/bailor/stat', 1, now(), 1, '委托人相关权限'),

  ('00000000000000001030', 'PERMISSION_PRODUCT_LIST', '查看产品列表信息', '/api/v1/product/list', 1, now(), 1, '产品相关权限'),
  ('00000000000000001031', 'PERMISSION_PRODUCT_DETAIL', '查看产品信息', '/api/v1/product/findById', 1, now(), 1, '产品相关权限'),
  ('00000000000000001032', 'PERMISSION_PRODCUT_ALTER', '添加/修改产品', '/api/v1/product/create', 1, now(), 1, '产品相关权限'),
  ('00000000000000001033', 'PERMISSION_PRODCUT_DISABLE', '禁用产品', '/api/v1/product/block', 1, now(), 1, '产品相关权限'),
  ('00000000000000001034', 'PERMISSION_PRODCUT_ENABLE', '启用产品', '/api/v1/product/unblock', 1, now(), 1, '产品相关权限'),
  ('00000000000000001035', 'PERMISSION_PRODUCT_ALTER', '创建/修改产品信息', '/api/v1/product/create', 1, now(), 1, '产品相关权限'),
  ('00000000000000001036', 'PERMISSION_PRODUCT_LOAN_STAT', '查看产品放款统计', '/api/v1/product/loanStat', 1, now(), 1, '产品相关权限'),
  ('00000000000000001037', 'PERMISSION_PRODUCT_LOAN_FILTER', '查看产品放款记录', '/api/v1/product/loanFilter', 1, now(), 1, '产品相关权限'),
  ('00000000000000001038', 'PERMISSION_PRODUCT_STAT', '查看产品统计数据', '/api/v1/product/stat', 1, now(), 1, '产品相关权限'),

  ('00000000000000001040', 'PERMISSION_LOAN_DETAIL', '查看借款详情', '/api/v1/loan/getById', 1, now(), 1, '借款相关权限'),
  ('00000000000000001041', 'PERMISSION_LOAN_CONTRACT', '下载借款合同', '/api/v1/loan/getContract', 1, now(), 1, '借款相关权限'),
  ('00000000000000001042', 'PERMISSION_LOAN_LIST', '查看借款列表信息', '/api/v1/loan/listFilter', 1, now(), 1, '借款相关权限'),
  ('00000000000000001043', 'PERMISSION_LOAN_REPAYMENT_LIST', '查看还款计划列表', '/api/v1/loan/listLoanRepayment', 1, now(), 1, '借款相关权限'),
  ('00000000000000001044', 'PERMISSION_LOAN_REPAYMENT_DOWNLOAD', '下载还款计划', '/api/v1/loan/download/repayment', 1, now(), 1, '借款相关权限'),

  ('00000000000000001050', 'PERMISSION_POST_LOAN_LIST', '查看欠款列表', '/api/v1/postLoan/listFilter', 1, now(), 1, '贷后相关权限'),

  ('00000000000000001080', 'PERMISSION_SYS_USER_LIST', '查看员工列表', '/api/usermanage/v1/user/listExt', 1, now(), 1, '系统管理权限'),
  ('00000000000000001081', 'PERMISSION_SYS_USER_DETAIL', '查看员工详情', '/api/usermanage/v1/user/detailExt', 1, now(), 1, '系统管理权限'),
  ('00000000000000001082', 'PERMISSION_SYS_USER_CREATE', '新增员工账号', '/api/usermanage/v1/user/create', 1, now(), 1, '系统管理权限'),
  ('00000000000000001083', 'PERMISSION_SYS_USER_ALTER_ACCOUNT', '修改员工账号', '/api/usermanage/v1/user/update', 1, now(), 1, '系统管理权限'),
  ('00000000000000001084', 'PERMISSION_SYS_USER_ALTER_ROLE', '修改员工角色', '/api/usermanage/v1/user/create/roles', 1, now(), 1, '系统管理权限'),
  ('00000000000000001085', 'PERMISSION_SYS_USER_ALTER_PWD', '修改员工密码', '/api/usermanage/v1/user/update/pwd', 1, now(), 1, '系统管理权限'),
  ('00000000000000001086', 'PERMISSION_SYS_USER_ENABLE', '启用/禁用员工账号', '/api/usermanage/v1/user/update/enabled', 1, now(), 1, '系统管理权限'),
  ('00000000000000001087', 'PERMISSION_SYS_PERMISSION_LIST', '查看权限列表', '/api/usermanage/v1/permission/listByRoleId', 1, now(), 1, '系统管理权限'),
  ('00000000000000001088', 'PERMISSION_SYS_PERMISSION_ALTER', '分配/修改权限', '/api/usermanage/v1/role/create/permission', 1,
   now(), 1, '系统管理权限');
#   ('00000000000000001085', 'PERMISSION_SYS_LOG_LIST', '查看操作日志', '/api/usermanage/v1/*', 1, now(), 1, '系统管理权限');
-- 设置权限组
INSERT INTO TB_GROUPS (ID, GROUP_NAME, GROUP_NICKNAME, GROUP_PATH, PARENT_GROUP_ID, CREATE_TIME, ENABLED, NOTE, ORDER_NUMBER)
VALUES
  ('00000000000000010001', 'GROUP_LOAN_AGENCY', '助贷方相关权限', NULL, NULL, now(), 1, '助贷方相关权限', 2),
  ('00000000000000010002', 'GROUP_BAILOR', '委托人相关权限', NULL, NULL, now(), 1, '委托人相关权限', 3),
  ('00000000000000010003', 'GROUP_PRODUCT', '产品相关权限', NULL, NULL, now(), 1, '产品相关权限', 4),
  ('00000000000000010004', 'GROUP_LOAN', '借款相关权限', NULL, NULL, now(), 1, '借款相关权限', 5),
  ('00000000000000010005', 'GROUP_POST_LOAN', '贷后相关权限', NULL, NULL, now(), 1, '贷后相关权限', 6),
  ('00000000000000010008', 'GROUP_SYSTEM', '系统管理权限', NULL, NULL, now(), 1, '系统管理权限', 9);

-- 设置中间表
INSERT INTO RF_ORGANIZATION_PERMISSION (ORGANIZATION_ID, PERMISSION_ID)
VALUES
  ('00000000000000000001', '00000000000000001010'),
  ('00000000000000000001', '00000000000000001011'),
  ('00000000000000000001', '00000000000000001012'),
  ('00000000000000000001', '00000000000000001013'),
  ('00000000000000000001', '00000000000000001014'),
  ('00000000000000000001', '00000000000000001015'),
  ('00000000000000000001', '00000000000000001016'),
  ('00000000000000000001', '00000000000000001017'),
  ('00000000000000000001', '00000000000000001018'),

  ('00000000000000000001', '00000000000000001020'),
  ('00000000000000000001', '00000000000000001021'),
  ('00000000000000000001', '00000000000000001022'),
  ('00000000000000000001', '00000000000000001023'),
  ('00000000000000000001', '00000000000000001024'),
  ('00000000000000000001', '00000000000000001025'),
  ('00000000000000000001', '00000000000000001026'),
  ('00000000000000000001', '00000000000000001027'),
  ('00000000000000000001', '00000000000000001028'),

  ('00000000000000000001', '00000000000000001030'),
  ('00000000000000000001', '00000000000000001031'),
  ('00000000000000000001', '00000000000000001032'),
  ('00000000000000000001', '00000000000000001033'),
  ('00000000000000000001', '00000000000000001034'),
  ('00000000000000000001', '00000000000000001035'),
  ('00000000000000000001', '00000000000000001036'),
  ('00000000000000000001', '00000000000000001037'),
  ('00000000000000000001', '00000000000000001038'),

  ('00000000000000000001', '00000000000000001040'),
  ('00000000000000000001', '00000000000000001041'),
  ('00000000000000000001', '00000000000000001042'),
  ('00000000000000000001', '00000000000000001043'),
  ('00000000000000000001', '00000000000000001044'),

  ('00000000000000000001', '00000000000000001050'),

  ('00000000000000000001', '00000000000000001080'),
  ('00000000000000000001', '00000000000000001081'),
  ('00000000000000000001', '00000000000000001082'),
  ('00000000000000000001', '00000000000000001083'),
  ('00000000000000000001', '00000000000000001084'),
  ('00000000000000000001', '00000000000000001085'),
  ('00000000000000000001', '00000000000000001086'),
  ('00000000000000000001', '00000000000000001087'),
  ('00000000000000000001', '00000000000000001088');
INSERT INTO RF_GROUP_PERMISSION (GROUP_ID, PERMISSION_ID)
VALUES
  ('00000000000000010001', '00000000000000001010'),
  ('00000000000000010001', '00000000000000001011'),
  ('00000000000000010001', '00000000000000001012'),
  ('00000000000000010001', '00000000000000001013'),
  ('00000000000000010001', '00000000000000001014'),
  ('00000000000000010001', '00000000000000001015'),
  ('00000000000000010001', '00000000000000001016'),
  ('00000000000000010001', '00000000000000001017'),
  ('00000000000000010001', '00000000000000001018'),

  ('00000000000000010002', '00000000000000001020'),
  ('00000000000000010002', '00000000000000001021'),
  ('00000000000000010002', '00000000000000001022'),
  ('00000000000000010002', '00000000000000001023'),
  ('00000000000000010002', '00000000000000001024'),
  ('00000000000000010002', '00000000000000001025'),
  ('00000000000000010002', '00000000000000001026'),
  ('00000000000000010002', '00000000000000001027'),
  ('00000000000000010002', '00000000000000001028'),

  ('00000000000000010003', '00000000000000001030'),
  ('00000000000000010003', '00000000000000001031'),
  ('00000000000000010003', '00000000000000001032'),
  ('00000000000000010003', '00000000000000001033'),
  ('00000000000000010003', '00000000000000001034'),
  ('00000000000000010003', '00000000000000001035'),
  ('00000000000000010003', '00000000000000001036'),
  ('00000000000000010003', '00000000000000001037'),
  ('00000000000000010003', '00000000000000001038'),

  ('00000000000000010004', '00000000000000001040'),
  ('00000000000000010004', '00000000000000001041'),
  ('00000000000000010004', '00000000000000001042'),
  ('00000000000000010004', '00000000000000001043'),
  ('00000000000000010004', '00000000000000001044'),

  ('00000000000000010005', '00000000000000001050'),

  ('00000000000000010008', '00000000000000001080'),
  ('00000000000000010008', '00000000000000001081'),
  ('00000000000000010008', '00000000000000001082'),
  ('00000000000000010008', '00000000000000001083'),
  ('00000000000000010008', '00000000000000001084'),
  ('00000000000000010008', '00000000000000001085'),
  ('00000000000000010008', '00000000000000001086'),
  ('00000000000000010008', '00000000000000001087'),
  ('00000000000000010008', '00000000000000001088');

INSERT INTO TB_PERMISSIONS (ID, PERMISSION_NAME, PERMISSION_NICKNAME, PERMISSION_URL, TYPE, CREATE_TIME, ENABLED, NOTE)
VALUES
  ('00000000000000001039', 'PERMISSION_PRODUCT_DOWN_LOAN', '下载放款详情', '/api/v1/product/download/loan', 1, now(), 1,
   '产品相关权限');
INSERT INTO RF_ORGANIZATION_PERMISSION (ORGANIZATION_ID, PERMISSION_ID)
VALUES
  ('00000000000000000001', '00000000000000001039');
INSERT INTO RF_GROUP_PERMISSION (GROUP_ID, PERMISSION_ID)
VALUES
  ('00000000000000010003', '00000000000000001039');


-- ----------------------------
--  Table structure for `TB_UNIPAY_DAILY_RECON`
--  2017.09.24 add by vincent
-- ----------------------------
DROP TABLE IF EXISTS `TB_UNIPAY_DAILY_RECON`;
CREATE TABLE `TB_UNIPAY_DAILY_RECON` (
  `ID` varchar(255) NOT NULL COMMENT '统一支付每日对账结果ID',
  `RECON_DATE` varchar(255) NOT NULL COMMENT '对账日期(格式: YYYYMMDD)',
  `RECON_DIFF` varchar(255) NOT NULL COMMENT '对账结果',
  `BUSS_TYPE` varchar(255) NOT NULL COMMENT '业务类型',
  `CUSTOMER_ID` varchar(255) NOT NULL COMMENT '客户/借款人 ID',
  `CUSTOMER_NAME` varchar(255) NOT NULL COMMENT '客户/借款人 名称',
  `LOAN_AGENCY_ID` varchar(255) NOT NULL COMMENT '助贷机构ID',
  `LOAN_AGENCY_NAME` varchar(255) NOT NULL COMMENT '助贷机构名称',
  `ORDER_ID` varchar(255) DEFAULT NULL COMMENT '平台交易流水号',
  `AMOUNT` decimal(15,2) DEFAULT NULL COMMENT '平台交易金额',
  `STATUS` varchar(255) DEFAULT NULL COMMENT '平台交易状态',
  `UNIPAY_ORDER_ID` varchar(255) DEFAULT NULL COMMENT '统一支付交易流水号',
  `UNIPAY_AMOUNT` decimal(15,2) DEFAULT NULL COMMENT '统一支付交易金额',
  `UNIPAY_STATUS` varchar(255) DEFAULT NULL COMMENT '统一支付交易状态',
  `UNIPAY_REMARK` varchar(255) DEFAULT NULL COMMENT '统一支付交易备注',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '统一支付每日对账结果';

-- ----------------------------
--  Table structure for `TB_UNIPAY_RECON_DETAIL`
--  2017.09.24 add by vincent
-- ----------------------------
DROP TABLE IF EXISTS `TB_UNIPAY_RECON_DETAIL`;
CREATE TABLE `TB_UNIPAY_RECON_DETAIL` (
  `ID` varchar(255) NOT NULL COMMENT '统一支付对账文件记录明细ID',
  `UNIPAY_DAILY_RECON_ID` varchar(255) NOT NULL COMMENT '统一支付每日对账结果ID',
  `CHANNEL_NO` varchar(255) NOT NULL COMMENT '商户编号,即助贷方渠道编号',
  `BUSS_TYPE` varchar(255) NOT NULL COMMENT '业务类型',
  `ORDER_ID` varchar(255) NOT NULL COMMENT '交易流水号',
  `CURRENCY_TYPE` varchar(255) NOT NULL COMMENT '币种',
  `AMOUNT` decimal(15,2) NOT NULL COMMENT '交易金额',
  `STATUS` varchar(255) NOT NULL COMMENT '交易状态',
  `TRANS_CODE` varchar(255) DEFAULT NULL COMMENT '交易结果码',
  `TRANS_DESC` varchar(255) DEFAULT NULL COMMENT '交易结果描述',
  `PAYER_ACCOUNT` varchar(255) DEFAULT NULL COMMENT '付款人账号',
  `PAYER_BANK_CODE` varchar(255) DEFAULT NULL COMMENT '付款人行号',
  `PAYER_BANK_NAME` varchar(255) DEFAULT NULL COMMENT '付款人行名',
  `PAYER_NAME` varchar(255) DEFAULT NULL COMMENT '付款人名称',
  `PAYEE_ACCOUNT` varchar(255) DEFAULT NULL COMMENT '收款人账号',
  `PAYEE_BANK_CODE` varchar(255) DEFAULT NULL COMMENT '收款人行号',
  `PAYEE_BANK_NAME` varchar(255) DEFAULT NULL COMMENT '收款人行名',
  `PAYEE_NAME` varchar(255) DEFAULT NULL COMMENT '收款人名称',
  `REMARK1` varchar(255) DEFAULT NULL COMMENT '备注1',
  `REMARK2` varchar(255) DEFAULT NULL COMMENT '备注2',
  `REMARK3` varchar(255) DEFAULT NULL COMMENT '备注3',
  `TIMERECORD` datetime NOT NULL COMMENT '记录时间',
  `TIMEUPDATE` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UKf66243ug7upflbijq8dxx7825` (`UNIPAY_DAILY_RECON_ID`),
  UNIQUE KEY `UKf8owqw4goxmb6xs5klv6f2jxt` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '统一支付对账文件记录明细';