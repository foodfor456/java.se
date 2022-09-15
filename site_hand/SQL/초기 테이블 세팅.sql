drop database `hand_made`;

create database `hand_made`;

use `hand_made`;

DROP TABLE IF EXISTS `wish`;

CREATE TABLE `wish` (
	`wi_num`	int	NOT NULL,
	`wi_me_id`	varchar(15)	NOT NULL,
	`wi_pr_code`	char(8)	NOT NULL
);

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	varchar(15)	NOT NULL,
	`me_pw`	varchar(255)	NULL,
	`me_email`	varchar(50)	NULL,
	`me_post`	varchar(10)	NULL,
	`me_addr`	varchar(50)	NULL,
	`me_addr_detail`	varchar(20)	NULL,
	`me_phon`	varchar(15)	NULL,
	`me_authority`	int	NULL,
	`me_vali`	int	NULL
);

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
	`pr_code`	char(8)	NOT NULL,
	`pr_title`	varchar(50)	NULL,
	`pr_content`	longtext	NULL,
	`pr_price`	int	NULL,
	`pr_stock`	int	NULL,
	`pr_date`	date	NULL,
	`pr_cs_num`	int	NULL,
	`pr_me_id`	varchar(15)	NOT NULL
);

DROP TABLE IF EXISTS `prCategoryL`;

CREATE TABLE `prCategoryL` (
	`cl_num`	int	NULL,
	`cl_name`	varchar(5)	NOT NULL
);

DROP TABLE IF EXISTS `prCategoryS`;

CREATE TABLE `prCategoryS` (
	`cs_num`	int	NULL,
	`cs_name`	varchar(5)	NOT NULL,
	`cs_cl_num`	int	NULL
);

DROP TABLE IF EXISTS `prOption`;

CREATE TABLE `prOption` (
	`op_num`	int	NOT NULL,
	`op_title`	varchar(15)	NULL,
	`op_content`	varchar(100)	NULL,
	`op_price`	int	NULL
);

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
	`fi_num`	int	NOT NULL,
	`fi_name`	varchar(255)	NULL,
	`fi_ori_name`	varchar(255)	NULL,
	`fi_table`	varchar(15)	NULL,
	`fi_code`	varchar(10)	NULL
);

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
	`ca_num`	int	NOT NULL,
	`ca_amount`	int	NULL,
	`ca_me_id`	varchar(15)	NOT NULL,
	`ca_po_num`	int	NULL
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
	`bd_num`	int	NOT NULL,
	`bd_title`	varchar(20)	NULL,
	`bd_content`	longtext	NULL,
	`bd_date`	date	NULL,
	`bd_views`	int	NULL,
	`bd_me_id`	varchar(15)	NOT NULL,
	`bd_bc_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `region`;

CREATE TABLE `region` (
	`rg_name`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
	`rt_num`	int	NOT NULL,
	`rt_value`	int	NULL,
	`rt_me_id`	varchar(15)	NOT NULL,
	`rt_bd_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `likes`;

CREATE TABLE `likes` (
	`li_num`	int	NOT NULL,
	`li_state`	int	NULL,
	`li_table`	varchar(15)	NULL,
	`li_tnum`	int	NULL,
	`li_me_id`	varchar(15)	NOT NULL
);

DROP TABLE IF EXISTS `waitingProduct`;

CREATE TABLE `waitingProduct` (
	`wp_num`	int	NOT NULL,
	`wp_state`	varchar(5)	NULL,
	`wp_note`	varchar(100)	NULL,
	`wp_date`	date	NULL,
	`wp_pr_code`	char(8)	NOT NULL
);

DROP TABLE IF EXISTS `buy`;

CREATE TABLE `buy` (
	`bu_num`	int	NOT NULL,
	`bu_date`	date	NULL,
	`bu_send`	varchar(10)	NULL,
	`bu_note`	varchar(10)	NULL,
	`bu_request`	varchar(100)	NULL,
	`bu_me_id`	varchar(15)	NOT NULL,
	`bu_ad_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `addrBook`;

CREATE TABLE `addrBook` (
	`ab_num`	int	NOT NULL,
	`ab_name`	varchar(10)	NULL,
	`ab_to`	varchar(15)	NULL,
	`ab_phon`	varchar(15)	NULL,
	`ab_post`	varchar(10)	NULL,
	`ab_addr`	varchar(50)	NULL,
	`ab_addr_detail`	varchar(20)	NULL,
	`ab_me_id`	varchar(15)	NOT NULL
);


DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
	`co_num`	int	NOT NULL,
	`co_content`	varchar(150)	NULL,
	`co_date`	date	NULL,
	`co_ori_num`	int	NULL,
	`co_depth`	int	NULL,
	`co_order`	int	NULL,
	`cd_secret`	int	NULL,
	`co_table`	varchar(10)	NULL,
	`co_tnum`	int	NULL,
	`co_me_id`	varchar(15)	NOT NULL
);

DROP TABLE IF EXISTS `buyDetail`;

CREATE TABLE `buyDetail` (
	`by_num`	int	NOT NULL,
	`by_amount`	int	NULL,
	`by_price`	int	NULL,
	`by_state`	varchar(5)	NULL,
	`by_po_num`	int	NULL,
	`by_bu_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `boardType`;

CREATE TABLE `boardType` (
	`bt_name`	varchar(15)	NOT NULL
);

DROP TABLE IF EXISTS `boardCategory`;

CREATE TABLE `boardCategory` (
	`bc_num`	int	NOT NULL,
	`bc_name`	varchar(15)	NULL,
	`bc_bt_name`	varchar(15)	NOT NULL
);

DROP TABLE IF EXISTS `rgBoard`;

CREATE TABLE `rgBoard` (
	`rb_num`	int	NOT NULL,
	`rb_rg_name`	varchar(10)	NOT NULL,
	`rb_bd_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
	`ad_num`	int	NOT NULL,
	`ad_to`	varchar(10)	NULL,
	`ad_phon`	varchar(15)	NULL,
	`ad_post`	varchar(10)	NULL,
	`ad_addr`	varchar(50)	NULL,
	`ad_addr_detail`	varchar(20)	NULL
);

DROP TABLE IF EXISTS `complain`;

CREATE TABLE `complain` (
	`cp_num`	int	NULL,
	`cp_note`	varchar(100)	NULL,
	`cp_state`	varchar(5)	NULL,
    `cp_date` DATETIME NULL,
	`cp_ct_type`	varchar(10)	NOT NULL,
	`cp_by_num`	int	NOT NULL,
	`cp_me_id`	varchar(15)	NOT NULL
);

DROP TABLE IF EXISTS `cpType`;

CREATE TABLE `cpType` (
	`ct_type`	varchar(10)	NOT NULL
);

DROP TABLE IF EXISTS `prSelect`;

CREATE TABLE `prSelect` (
	`ps_num`	int	NOT NULL,
	`ps_po_num`	int	NULL,
	`ps_pr_code`	char(8)	NOT NULL,
	`ps_op_num`	int	NOT NULL
);



ALTER TABLE `wish` ADD CONSTRAINT `PK_WISH` PRIMARY KEY (
	`wi_num`
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_id`
);

ALTER TABLE `product` ADD CONSTRAINT `PK_PRODUCT` PRIMARY KEY (
	`pr_code`
);

ALTER TABLE `prCategoryL` ADD CONSTRAINT `PK_PRCATEGORYL` PRIMARY KEY (
	`cl_num`
);

ALTER TABLE `prCategoryS` ADD CONSTRAINT `PK_PRCATEGORYS` PRIMARY KEY (
	`cs_num`
);

ALTER TABLE `prOption` ADD CONSTRAINT `PK_PROPTION` PRIMARY KEY (
	`op_num`
);

ALTER TABLE `file` ADD CONSTRAINT `PK_FILE` PRIMARY KEY (
	`fi_num`
);

ALTER TABLE `cart` ADD CONSTRAINT `PK_CART` PRIMARY KEY (
	`ca_num`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`bd_num`
);

ALTER TABLE `region` ADD CONSTRAINT `PK_REGION` PRIMARY KEY (
	`rg_name`
);

ALTER TABLE `rating` ADD CONSTRAINT `PK_RATING` PRIMARY KEY (
	`rt_num`
);

ALTER TABLE `likes` ADD CONSTRAINT `PK_LIKES` PRIMARY KEY (
	`li_num`
);

ALTER TABLE `waitingProduct` ADD CONSTRAINT `PK_WAITINGPRODUCT` PRIMARY KEY (
	`wp_num`
);

ALTER TABLE `buy` ADD CONSTRAINT `PK_BUY` PRIMARY KEY (
	`bu_num`
);

ALTER TABLE `addrBook` ADD CONSTRAINT `PK_ADDRBOOK` PRIMARY KEY (
	`ab_num`
);

ALTER TABLE `comment` ADD CONSTRAINT `PK_COMMENT` PRIMARY KEY (
	`co_num`
);

ALTER TABLE `buyDetail` ADD CONSTRAINT `PK_BUYDETAIL` PRIMARY KEY (
	`by_num`
);

ALTER TABLE `boardType` ADD CONSTRAINT `PK_BOARDTYPE` PRIMARY KEY (
	`bt_name`
);

ALTER TABLE `boardCategory` ADD CONSTRAINT `PK_BOARDCATEGORY` PRIMARY KEY (
	`bc_num`
);

ALTER TABLE `rgBoard` ADD CONSTRAINT `PK_RGBOARD` PRIMARY KEY (
	`rb_num`
);

ALTER TABLE `address` ADD CONSTRAINT `PK_ADDRESS` PRIMARY KEY (
	`ad_num`
);

ALTER TABLE `complain` ADD CONSTRAINT `PK_COMPLAIN` PRIMARY KEY (
	`cp_num`
);

ALTER TABLE `cpType` ADD CONSTRAINT `PK_CPTYPE` PRIMARY KEY (
	`ct_type`
);

ALTER TABLE `prSelect` ADD CONSTRAINT `PK_PRSELECT` PRIMARY KEY (
	`ps_num`
);
ALTER TABLE `hand_made`.`addrbook` 
CHANGE COLUMN `ab_num` `ab_num` INT NOT NULL AUTO_INCREMENT,
CHANGE COLUMN `ab_name` `ab_name` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `ab_to` `ab_to` VARCHAR(15) NOT NULL ,
CHANGE COLUMN `ab_phon` `ab_phon` VARCHAR(15) NOT NULL ,
CHANGE COLUMN `ab_post` `ab_post` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `ab_addr` `ab_addr` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `ab_addr_detail` `ab_addr_detail` VARCHAR(20) NOT NULL ;


ALTER TABLE `hand_made`.`address` 
CHANGE COLUMN `ad_num` `ad_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `ad_to` `ad_to` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `ad_phon` `ad_phon` VARCHAR(15) NOT NULL ,
CHANGE COLUMN `ad_post` `ad_post` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `ad_addr` `ad_addr` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `ad_addr_detail` `ad_addr_detail` VARCHAR(20) NOT NULL ;

ALTER TABLE `hand_made`.`board` 
CHANGE COLUMN `bd_num` `bd_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `bd_title` `bd_title` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `bd_content` `bd_content` LONGTEXT NOT NULL ,
CHANGE COLUMN `bd_date` `bd_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
CHANGE COLUMN `bd_views` `bd_views` INT NOT NULL DEFAULT 1 ;

ALTER TABLE `hand_made`.`boardcategory` 
CHANGE COLUMN `bc_num` `bc_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `bc_name` `bc_name` VARCHAR(15) NOT NULL ;

ALTER TABLE `hand_made`.`buy` 
CHANGE COLUMN `bu_request` `bu_request` VARCHAR(100) NULL DEFAULT ' ' AFTER `bu_send`,
CHANGE COLUMN `bu_date` `bu_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
CHANGE COLUMN `bu_send` `bu_send` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `bu_note` `bu_note` VARCHAR(10) NULL ;

ALTER TABLE `hand_made`.`buydetail` 
CHANGE COLUMN `by_num` `by_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `by_amount` `by_amount` INT NOT NULL ,
CHANGE COLUMN `by_price` `by_price` INT NOT NULL ;

ALTER TABLE `hand_made`.`cart` 
CHANGE COLUMN `ca_po_num` `ca_po_num` INT NULL DEFAULT NULL AFTER `ca_amount`,
CHANGE COLUMN `ca_num` `ca_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `ca_amount` `ca_amount` INT NOT NULL ;

ALTER TABLE `hand_made`.`comment` 
CHANGE COLUMN `co_num` `co_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `co_content` `co_content` VARCHAR(150) NOT NULL ,
CHANGE COLUMN `co_date` `co_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
CHANGE COLUMN `co_ori_num` `co_ori_num` INT NOT NULL ,
CHANGE COLUMN `co_depth` `co_depth` INT NOT NULL DEFAULT 1 ,
CHANGE COLUMN `co_order` `co_order` INT NOT NULL ,
CHANGE COLUMN `cd_secret` `cd_secret` INT NOT NULL DEFAULT 1 ,
CHANGE COLUMN `co_table` `co_table` VARCHAR(10) NOT NULL ,
CHANGE COLUMN `co_tnum` `co_tnum` INT NOT NULL ;

ALTER TABLE `hand_made`.`complain` 
CHANGE COLUMN `cp_num` `cp_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `cp_note` `cp_note` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `cp_state` `cp_state` VARCHAR(5) NOT NULL,
CHANGE COLUMN `cp_date` `cp_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE `hand_made`.`file` 
CHANGE COLUMN `fi_num` `fi_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `fi_name` `fi_name` VARCHAR(255) NOT NULL ,
CHANGE COLUMN `fi_ori_name` `fi_ori_name` VARCHAR(255) NOT NULL ,
CHANGE COLUMN `fi_table` `fi_table` VARCHAR(15) NOT NULL ,
CHANGE COLUMN `fi_code` `fi_code` VARCHAR(10) NOT NULL ;

ALTER TABLE `hand_made`.`likes` 
CHANGE COLUMN `li_num` `li_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `li_state` `li_state` INT NOT NULL ,
CHANGE COLUMN `li_table` `li_table` VARCHAR(15) NOT NULL ,
CHANGE COLUMN `li_tnum` `li_tnum` INT NOT NULL ;

ALTER TABLE `hand_made`.`member` 
CHANGE COLUMN `me_pw` `me_pw` VARCHAR(255) NOT NULL ,
CHANGE COLUMN `me_authority` `me_authority` INT NOT NULL DEFAULT 0 ,
CHANGE COLUMN `me_vali` `me_vali` INT NOT NULL DEFAULT 0 ;

ALTER TABLE `hand_made`.`prcategoryl` 
CHANGE COLUMN `cl_num` `cl_num` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `hand_made`.`prcategorys` 
CHANGE COLUMN `cs_num` `cs_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `cs_cl_num` `cs_cl_num` INT NOT NULL ;

ALTER TABLE `hand_made`.`product` 
CHANGE COLUMN `pr_title` `pr_title` VARCHAR(50) NOT NULL ,
CHANGE COLUMN `pr_content` `pr_content` LONGTEXT NOT NULL ,
CHANGE COLUMN `pr_price` `pr_price` INT NOT NULL DEFAULT 0 ,
CHANGE COLUMN `pr_stock` `pr_amount` INT NOT NULL DEFAULT 0 ,
CHANGE COLUMN `pr_date` `pr_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ,
CHANGE COLUMN `pr_cs_num` `pr_cs_num` INT NOT NULL ;

ALTER TABLE `hand_made`.`proption` 
CHANGE COLUMN `op_num` `op_num` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `hand_made`.`prselect` 
CHANGE COLUMN `ps_num` `ps_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `ps_po_num` `ps_po_num` INT NOT NULL ;

ALTER TABLE `hand_made`.`rating` 
CHANGE COLUMN `rt_num` `rt_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `rt_value` `rt_value` INT NOT NULL ;

ALTER TABLE `hand_made`.`rgboard` 
CHANGE COLUMN `rb_num` `rb_num` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `hand_made`.`waitingproduct` 
CHANGE COLUMN `wp_num` `wp_num` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `wp_state` `wp_state` VARCHAR(5) NOT NULL ,
CHANGE COLUMN `wp_note` `wp_note` VARCHAR(100) NOT NULL ,
CHANGE COLUMN `wp_date` `wp_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ;

ALTER TABLE `hand_made`.`wish` 
CHANGE COLUMN `wi_num` `wi_num` INT NOT NULL AUTO_INCREMENT ;

ALTER TABLE `wish` ADD CONSTRAINT `FK_member_TO_wish_1` FOREIGN KEY (
	`wi_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `wish` ADD CONSTRAINT `FK_product_TO_wish_1` FOREIGN KEY (
	`wi_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_prCategoryS_TO_product_1` FOREIGN KEY (
	`pr_cs_num`
)
REFERENCES `prCategoryS` (
	`cs_num`
);

ALTER TABLE `product` ADD CONSTRAINT `FK_member_TO_product_1` FOREIGN KEY (
	`pr_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `prCategoryS` ADD CONSTRAINT `FK_prCategoryL_TO_prCategoryS_1` FOREIGN KEY (
	`cs_cl_num`
)
REFERENCES `prCategoryL` (
	`cl_num`
);

ALTER TABLE `cart` ADD CONSTRAINT `FK_member_TO_cart_1` FOREIGN KEY (
	`ca_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_member_TO_board_1` FOREIGN KEY (
	`bd_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_boardCategory_TO_board_1` FOREIGN KEY (
	`bd_bc_num`
)
REFERENCES `boardCategory` (
	`bc_num`
);

ALTER TABLE `rating` ADD CONSTRAINT `FK_member_TO_rating_1` FOREIGN KEY (
	`rt_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `rating` ADD CONSTRAINT `FK_board_TO_rating_1` FOREIGN KEY (
	`rt_bd_num`
)
REFERENCES `board` (
	`bd_num`
);

ALTER TABLE `likes` ADD CONSTRAINT `FK_member_TO_likes_1` FOREIGN KEY (
	`li_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `waitingProduct` ADD CONSTRAINT `FK_product_TO_waitingProduct_1` FOREIGN KEY (
	`wp_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `buy` ADD CONSTRAINT `FK_member_TO_buy_1` FOREIGN KEY (
	`bu_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `buy` ADD CONSTRAINT `FK_address_TO_buy_1` FOREIGN KEY (
	`bu_ad_num`
)
REFERENCES `address` (
	`ad_num`
);

ALTER TABLE `addrBook` ADD CONSTRAINT `FK_member_TO_addrBook_1` FOREIGN KEY (
	`ab_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_member_TO_comment_1` FOREIGN KEY (
	`co_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `buyDetail` ADD CONSTRAINT `FK_buy_TO_buyDetail_1` FOREIGN KEY (
	`by_bu_num`
)
REFERENCES `buy` (
	`bu_num`
);

ALTER TABLE `boardCategory` ADD CONSTRAINT `FK_boardType_TO_boardCategory_1` FOREIGN KEY (
	`bc_bt_name`
)
REFERENCES `boardType` (
	`bt_name`
);

ALTER TABLE `rgBoard` ADD CONSTRAINT `FK_region_TO_rgBoard_1` FOREIGN KEY (
	`rb_rg_name`
)
REFERENCES `region` (
	`rg_name`
);

ALTER TABLE `rgBoard` ADD CONSTRAINT `FK_board_TO_rgBoard_1` FOREIGN KEY (
	`rb_bd_num`
)
REFERENCES `board` (
	`bd_num`
);

ALTER TABLE `complain` ADD CONSTRAINT `FK_cpType_TO_complain_1` FOREIGN KEY (
	`cp_ct_type`
)
REFERENCES `cpType` (
	`ct_type`
);

ALTER TABLE `complain` ADD CONSTRAINT `FK_buyDetail_TO_complain_1` FOREIGN KEY (
	`cp_by_num`
)
REFERENCES `buyDetail` (
	`by_num`
);

ALTER TABLE `complain` ADD CONSTRAINT `FK_member_TO_complain_1` FOREIGN KEY (
	`cp_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `prSelect` ADD CONSTRAINT `FK_product_TO_prSelect_1` FOREIGN KEY (
	`ps_pr_code`
)
REFERENCES `product` (
	`pr_code`
);

ALTER TABLE `prSelect` ADD CONSTRAINT `FK_prOption_TO_prSelect_1` FOREIGN KEY (
	`ps_op_num`
)
REFERENCES `prOption` (
	`op_num`
);

