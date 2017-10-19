-- ----------------------------
--  2017.06.29 add by vincent
-- ----------------------------
ALTER TABLE `TB_BAILOR` ADD COLUMN `SERIAL_NO` varchar(255) NOT NULL COMMENT '机构编号';
ALTER TABLE `TB_LOAN_AGENCY` ADD COLUMN `SERIAL_NO` varchar(255) NOT NULL COMMENT '机构编号';

ALTER TABLE `TB_BAILOR` ADD UNIQUE KEY `UKg3zrfo4ntvryxubvgun7pi0xo` (`SERIAL_NO`);
ALTER TABLE `TB_LOAN_AGENCY` ADD UNIQUE KEY `UKiqws3ryg1ocxkvpihc1steg1y` (`SERIAL_NO`);

-- ----------------------------
--  2017.07.05 add by Recursion
--  repayment添加期数和费用字段
-- ----------------------------
-- ALTER TABLE `TB_LOAN_REPAYMENT` ADD COLUMN `PERIOD_NO` int NOT NULL;
ALTER TABLE `TB_LOAN_REPAYMENT` ADD COLUMN `AMOUNT_FEE` DECIMAL(15,2) NOT NULL COMMENT '偿还手续费';

-- ----------------------------
--  2017.07.07 add by Recursion
--  loanRepayment 个别字段去掉不为空属性
-- ----------------------------
ALTER TABLE `TB_LOAN_REPAYMENT` MODIFY REPAY_AMOUNT DECIMAL(15,2);
ALTER TABLE `TB_LOAN_REPAYMENT` MODIFY REPAY_DATE DATETIME;

-- ----------------------------
--  2017.07.13 add by vincent
-- ----------------------------
ALTER TABLE `TB_LOAN_AGENCY` ADD COLUMN `CHANNEL_NO` varchar(255) NOT NULL COMMENT '渠道编码';

-- ----------------------------
--  2017.07.14 add by vincent
-- ----------------------------
ALTER TABLE `TB_PRODUCT` ADD COLUMN `METHOD` varchar(255) NOT NULL COMMENT '还款方式';
ALTER TABLE `TB_LOAN` MODIFY `SETTLED_DATE` datetime NULL;

-- ----------------------------
--  2017.07.18 add by recursion
-- ----------------------------
ALTER TABLE `TB_LOAN` ADD COLUMN `GIVEN_REPAYMENT_DATE` varchar(255) NOT NULL COMMENT '是否指定每月还款日';
ALTER TABLE `TB_LOAN` ADD COLUMN `PAYMENT_DATE` INT COMMENT '每月指定还款日';

ALTER  TABLE  `TB_PRODUCT` ADD COLUMN `PENALTY_RATE` INT COMMENT '罚息利率';

-- ----------------------------
--  2017.07.22 add by vincent
-- ----------------------------
ALTER TABLE `TB_LOAN` MODIFY `VALUE_DATE` datetime NULL;

-- ----------------------------
--  2017.07.22 add by zhnlk
-- ----------------------------
ALTER TABLE TB_CONTRACT MODIFY CONTENT longblob NULL ;

-- ----------------------------
--  2017.07.25 add by recursion
-- ----------------------------
ALTER TABLE `TB_LOAN` MODIFY `DUE_DATE` datetime NULL;

-- ----------------------------
--  2017.07.26 add by zhnlk
-- ----------------------------
ALTER TABLE `TB_PRODUCT_DAILY_STATISTICS` ADD COLUMN `REPAY_COUNT` INT NOT NULL COMMENT '当日还款笔数';

-- ----------------------------
--  2017.07.26 add by wanglanxiao
-- ----------------------------
ALTER TABLE `TB_BAILOR_LOAN_STATISTICS` ADD COLUMN `RESIDUAL_PRINCIPAL` DECIMAL(15,2) NOT NULL COMMENT '待还本金';

-- ----------------------------
--  2017.07.26 add by wanglanxiao
-- ----------------------------
ALTER TABLE `TB_CUSTOMER_LOAN_STATISTICS` ADD COLUMN `RESIDUAL_PRINCIPAL` DECIMAL(15,2) NOT NULL COMMENT '待还本金';

-- ----------------------------
--  2017.07.26 add by wanglanxiao
-- ----------------------------
ALTER TABLE `TB_LOANAGENCY_LOAN_STATISTICS` ADD COLUMN `RESIDUAL_PRINCIPAL` DECIMAL(15,2) NOT NULL COMMENT '待还本金';

-- ----------------------------
--  2017.07.26 add by zhnlk
--  还款记录中增加逾期罚息字段
-- ----------------------------
ALTER TABLE `TB_REPAYMENT_RECORD` ADD COLUMN `OVER_DUE_INTERST` DECIMAL(15,2) NOT NULL COMMENT '逾期罚息';

--  2017.07.28 add by recursion
-- ----------------------------

ALTER TABLE `TB_BAILOR` ADD COLUMN  `CUSTOMER_TYPE` varchar(255) DEFAULT NULL COMMENT '客户类型';
ALTER TABLE `TB_BAILOR` ADD COLUMN  `CUSTOMER_SUBTYPE` varchar(255) DEFAULT NULL COMMENT '客户子类型';
ALTER TABLE `TB_BAILOR` ADD COLUMN  `INDUSTRY_CODE` varchar(255) DEFAULT NULL COMMENT '行业类型';

ALTER TABLE `TB_LOAN_AGENCY` ADD COLUMN  `CUSTOMER_TYPE` varchar(255) DEFAULT NULL COMMENT '客户类型';
ALTER TABLE `TB_LOAN_AGENCY` ADD COLUMN  `CUSTOMER_SUBTYPE` varchar(255) DEFAULT NULL COMMENT '客户子类型';
ALTER TABLE `TB_LOAN_AGENCY` ADD COLUMN  `INDUSTRY_CODE` varchar(255) DEFAULT NULL COMMENT '行业类型';

-- ----------------------------
--  2017.07.28 add by vincent
-- ----------------------------
ALTER TABLE `TB_CUSTOMER` DROP INDEX UKl0f3940xfsdaa6cs8jkh4n4qd;
ALTER TABLE `TB_CUSTOMER` DROP INDEX UKd9jbm5u3h97tg482yroal8u7w;

-- ----------------------------
--  2017.08.02 add by zhnlk
-- ----------------------------
ALTER TABLE `TB_LOAN` ADD COLUMN `CHANNEL_FEE_RATE` INT NOT NULL DEFAULT 0 COMMENT '通道费率';

-- ----------------------------
--  2017.08.16 add by vincent
-- ----------------------------
ALTER TABLE `TB_PRODUCT` ADD COLUMN `ALLOCATED_ACCOUNT` VARCHAR(255) DEFAULT NULL COMMENT '指定放款账户';

-- ----------------------------
--  2017.09.01 add by vincent
-- ----------------------------
ALTER TABLE `TB_PRODUCT` ADD COLUMN `ALLOCATED_ACCOUNT_NAME` VARCHAR(255) DEFAULT NULL COMMENT '指定放款账户户名';
ALTER TABLE `TB_PRODUCT` ADD COLUMN `PENALTY_TYPE` VARCHAR(255) NOT NULL DEFAULT 'INTEREST_FLOAT' COMMENT '罚息方式';
ALTER TABLE `TB_PRODUCT` ADD COLUMN `FLOAT_RATE` INT(11) NOT NULL DEFAULT 0 COMMENT '罚息时的利息上浮比例';
ALTER TABLE `TB_LOAN` ADD COLUMN `PENALTY_RATE` INT(11) NOT NULL DEFAULT 0 COMMENT '罚息利率';
ALTER TABLE `TB_PRODUCT` DROP COLUMN `PENALTY_RATE`;

-- ----------------------------
--  2017.09.04 add by vincent
-- ----------------------------
ALTER TABLE `TB_PRODUCT` ADD COLUMN `CHANNEL_FEE_TYPE` VARCHAR(255) NOT NULL DEFAULT 'FIXED_RATE' COMMENT '通道手续费率类型';
ALTER TABLE `TB_LOAN` ADD COLUMN `CHANNEL_FEE_TYPE` VARCHAR(255) NOT NULL DEFAULT 'FIXED_RATE' COMMENT '通道手续费率类型';

-- ----------------------------
--  2017.09.05 add by vincent
-- ----------------------------
ALTER TABLE `TB_PRODUCT` ADD COLUMN `ADVANCED_REPAY_FEE_TYPE` VARCHAR(255) NOT NULL DEFAULT 'NONE' COMMENT '提前还款手续费收取方式';
ALTER TABLE `TB_LOAN` ADD COLUMN `ADVANCED_REPAY_FEE_TYPE` VARCHAR(255) NOT NULL DEFAULT 'NONE' COMMENT '提前还款手续费收取方式';

-- ----------------------------
--  2017.09.14 add by vincent
-- ----------------------------
ALTER TABLE `TB_REPAYMENT_RECORD` CHANGE `OVER_DUE_INTERST` `OVER_DUE_INTEREST` DECIMAL(15,2) NOT NULL COMMENT '逾期罚息';

-- ----------------------------
--  2017.09.18 add by recursion
-- ----------------------------

ALTER TABLE `TB_BATCH_TASK` ADD UNIQUE KEY `UK6a38985a10b34348aeb263c85` (`TASK_NAME`, `TASK_DATE`);
ALTER TABLE `TB_CONTRACT` ADD UNIQUE KEY `UK9b8ba6a11db34a26a6281221d` (`LOAN_ID`);
ALTER TABLE `TB_LOAN_RECEIPT` ADD UNIQUE KEY `UK25f556658eed495e90a604fd3` (`LOAN_ID`);
ALTER TABLE `TB_LOAN_REPAYMENT` ADD UNIQUE KEY `UKf9e877dbaab04fad8e918ec24` (`LOAN_ID`, `PERIOD`);

-- ----------------------------
--  2017.09.18 add by homiss
-- ----------------------------

ALTER TABLE `TB_LOAN_AGENCY` ADD COLUMN `PRODUCT_NO` varchar(255) NOT NULL COMMENT '产品码';

ALTER TABLE `TB_LENDING_RECORD` ADD COLUMN `CHANNEL_NO` varchar(255) NOT NULL COMMENT '渠道码';
ALTER TABLE `TB_LENDING_RECORD` ADD COLUMN `PRODUCT_NO` varchar(255) NOT NULL COMMENT '产品码';

ALTER TABLE `TB_LOAN` ADD COLUMN `CHANNEL_NO` varchar(255) NOT NULL COMMENT '渠道码';
ALTER TABLE `TB_LOAN` ADD COLUMN `PRODUCT_NO` varchar(255) NOT NULL COMMENT '产品码';

ALTER TABLE `TB_LOAN_RECEIPT` ADD COLUMN `CHANNEL_NO` varchar(255) NOT NULL COMMENT '渠道码';
ALTER TABLE `TB_LOAN_RECEIPT` ADD COLUMN `PRODUCT_NO` varchar(255) NOT NULL COMMENT '产品码';
ALTER TABLE `TB_LOAN_RECEIPT` ADD COLUMN `AGENCY_NO` varchar(255) NOT NULL COMMENT '机构码';
ALTER TABLE `TB_LOAN_RECEIPT` ADD COLUMN `ASSURANCE_TYPE` varchar(255) NOT NULL COMMENT '担保方式';
ALTER TABLE `TB_LOAN_RECEIPT` ADD COLUMN `BASE_RATE` varchar(255) NOT NULL COMMENT '基本利率';
ALTER TABLE `TB_LOAN_RECEIPT` ADD COLUMN `CURRENCY` varchar(255) NOT NULL COMMENT '币种';


ALTER TABLE `TB_CUSTOMER` ADD COLUMN `CHANNEL_NO` varchar(255) NOT NULL COMMENT '渠道码';

ALTER TABLE `TB_PRODUCT` ADD COLUMN `PRODUCT_NO` varchar(255) NOT NULL COMMENT '产品码';

ALTER TABLE `TB_LOAN_RECEIPT` ADD COLUMN `CURRENT_BALANCE` DECIMAL(15,2) NOT NULL DEFAULT 0 COMMENT '当前本金余额';

-- ----------------------------
--  2017.09.27 add by homiss
-- ----------------------------

INSERT INTO TB_PERMISSIONS (ID, PERMISSION_NAME, PERMISSION_NICKNAME, PERMISSION_URL, TYPE, CREATE_TIME, ENABLED, NOTE)
VALUES
  ('00000000000000001060', 'PERMISSION_RECON_UNIPAY_LIST', '查看对账列表信息', '/api/v1/recon/unipay/daily/list', 1, now(), 1,
   '对账管理相关权限'),
  ('00000000000000001061', 'PERMISSION_RECON_UNIPAY_DETAIL', '查看对账信息', '/api/v1/recon/unipay/detail', 1, now(), 1, '对账管理相关权限');

INSERT INTO TB_GROUPS (ID, GROUP_NAME, GROUP_NICKNAME, GROUP_PATH, PARENT_GROUP_ID, CREATE_TIME, ENABLED, NOTE, ORDER_NUMBER)
VALUES
  ('00000000000000010006', 'GROUP_RECON', '对账管理相关权限', NULL, NULL, now(), 1, '对账管理相关权限', 7);

INSERT INTO RF_ORGANIZATION_PERMISSION (ORGANIZATION_ID, PERMISSION_ID)
VALUES
  ('00000000000000000001', '00000000000000001060'),
  ('00000000000000000001', '00000000000000001061');

INSERT INTO RF_GROUP_PERMISSION (GROUP_ID, PERMISSION_ID)
VALUES
  ('00000000000000010006', '00000000000000001060'),
  ('00000000000000010006', '00000000000000001061');

ALTER TABLE `TB_DAILY_INTEREST_STATISTICS` ADD COLUMN `DAILY_OVERDUE_INTEREST` decimal(15,2) DEFAULT NULL COMMENT '当日罚息';

-- ----------------------------
--  2017.10.11 add by homiss
-- ----------------------------

ALTER TABLE TB_BAILOR_DAILY_STATISTICS COMMENT '委托机构日常统计';
ALTER TABLE TB_BAILOR_LOAN_STATISTICS COMMENT '委托机构总体统计';
ALTER TABLE TB_CUSTOMER_LOAN_STATISTICS COMMENT '客户总体统计';
ALTER TABLE TB_LOANAGENCY_DAILY_STATISTICS COMMENT '助贷机构日常统计';
ALTER TABLE TB_LOANAGENCY_LOAN_STATISTICS COMMENT '助贷机构总体统计';
ALTER TABLE TB_PRODUCT_DAILY_STATISTICS COMMENT '产品日常统计';

ALTER TABLE TB_LOAN MODIFY COLUMN SETTLED_DATE datetime COMMENT '放款日期';
ALTER TABLE TB_LOAN MODIFY COLUMN VALUE_DATE datetime COMMENT '起息日';
ALTER TABLE TB_LOAN MODIFY COLUMN DUE_DATE datetime COMMENT '到期日';

ALTER TABLE `TB_LOAN_RECEIPT` ADD COLUMN `FREQUENCY` VARCHAR(255) NOT NULL COMMENT '还款频率';
ALTER TABLE `TB_LOAN_RECEIPT` ADD COLUMN `PERIOD` INT(11) NOT NULL COMMENT '贷款期次';

ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN CUSTOMER_GENDER;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN CUSTOMER_BIRTH_DATE;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN CUSTOMER_ETHNIC;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN CUSTOMER_MARITAL_STAT;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN ADDR_STREET;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN ADDR_TYPE_CODE;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN AGENT_FLAG;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN CITY_CODE;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN COUNTRY_CODE;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN COUNTRY_NUMBER;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN DISTRICT_NUMBER;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN EMPLOYEE_FLAG;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN ID_CHECK_FLAG;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN IN_OUT_FLAG;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN INTERNAL_IND;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN INLAND_OFFSHORE;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN ISS_AUTHORITY;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN ISS_CITY;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN ISS_COUNTRY;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN ISS_DATE;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN ISS_DIST_CODE;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN ISS_EXPIRY_DATE;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN ISS_PLACE;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN ISS_STATE;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN LIVING_CONDITION;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN MOBILE_NUMBER;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN PHONE_NUMBER;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN PREF_FLAG;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN PROVINCE_CODE;
ALTER TABLE TB_LOAN_RECEIPT DROP COLUMN RESIDENCE_TYPE;

-- ----------------------------
--  2017.10.12 add by homiss
-- ----------------------------
ALTER TABLE `TB_LOAN_RECEIPT` ADD COLUMN `LOAN_CLOSE_PAYMENT_DATE` DATE DEFAULT NULL COMMENT '结清日期';
ALTER TABLE `TB_LOAN_RECEIPT` ADD COLUMN `YESTERDAY_BALANCE` DECIMAL(15,2) DEFAULT NULL COMMENT '上日余额';

alter table TB_DAILY_INTEREST_STATISTICS MODIFY COLUMN TIMERECORD DATE NOT NULL COMMENT '记录时间';
alter table TB_DAILY_INTEREST_STATISTICS MODIFY COLUMN TIMEUPDATE DATE NOT NULL COMMENT '更新时间';