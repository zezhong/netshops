/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : shops

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-01-05 22:25:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` char(20) NOT NULL,
  `name` char(10) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('141413321', '路永成', '123456', '男', '15518595228');

-- ----------------------------
-- Table structure for `catagory`
-- ----------------------------
DROP TABLE IF EXISTS `catagory`;
CREATE TABLE `catagory` (
  `cataId` char(8) NOT NULL,
  `cataName` char(10) DEFAULT NULL,
  PRIMARY KEY (`cataId`),
  KEY `idx_CaName` (`cataName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catagory
-- ----------------------------
INSERT INTO `catagory` VALUES ('4', '书籍');
INSERT INTO `catagory` VALUES ('6', '包包');
INSERT INTO `catagory` VALUES ('1', '日用品');
INSERT INTO `catagory` VALUES ('5', '电脑');
INSERT INTO `catagory` VALUES ('3', '眼镜');
INSERT INTO `catagory` VALUES ('2', '茶叶');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `tiltle` varchar(100) DEFAULT NULL,
  `userId` varchar(20) NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('xh', '1', '17-1-5 下午9:22', 'fdth', null);
INSERT INTO `message` VALUES ('dszvgfds', 'degsfs', 'fdgs', 'dsf', null);
INSERT INTO `message` VALUES ('dfbgvxh', 'fghdh', 'fhgd', 'fdghdgf', 'dfbhgd');
INSERT INTO `message` VALUES ('后果非常的好', '1', '17-1-5 下午9:24', '符合规范', null);

-- ----------------------------
-- Table structure for `orderdetail`
-- ----------------------------
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail` (
  `productId` char(10) NOT NULL,
  `orderId` char(8) NOT NULL,
  `qty` int(3) DEFAULT NULL,
  `marketPrice` int(4) DEFAULT NULL,
  PRIMARY KEY (`productId`,`orderId`),
  KEY `orderdetail_ibfk_2` (`orderId`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderdetail
-- ----------------------------
INSERT INTO `orderdetail` VALUES ('cup-01', '21136', '1', '20');
INSERT INTO `orderdetail` VALUES ('cup-01', '22732', '1', '20');
INSERT INTO `orderdetail` VALUES ('cup-01', '36120', '6', '20');
INSERT INTO `orderdetail` VALUES ('cup-01', '55876', '3', '20');
INSERT INTO `orderdetail` VALUES ('glasses-01', '72537', '3', '99');
INSERT INTO `orderdetail` VALUES ('tea-01', '70815', '2', '100');
INSERT INTO `orderdetail` VALUES ('tea-01', '76502', '3', '100');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderId` char(8) NOT NULL,
  `userId` char(8) DEFAULT NULL,
  `orderDate` date DEFAULT NULL,
  `totalPrice` int(5) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `orders_ibfk_1` (`userId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('21136', '1', '2017-01-05', '20');
INSERT INTO `orders` VALUES ('22732', '1', '2017-01-05', '20');
INSERT INTO `orders` VALUES ('36120', '1', '2017-01-05', '20');
INSERT INTO `orders` VALUES ('55876', '1', '2017-01-01', '20');
INSERT INTO `orders` VALUES ('70815', '1', '2017-01-02', '100');
INSERT INTO `orders` VALUES ('72537', '1', '2017-01-01', '99');
INSERT INTO `orders` VALUES ('76502', '1', '2017-01-01', '100');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productId` char(10) NOT NULL,
  `cataId` char(8) DEFAULT NULL,
  `productName` char(10) DEFAULT NULL,
  `costPrice` decimal(8,2) DEFAULT NULL,
  `marketPrice` decimal(8,2) DEFAULT NULL,
  `qty` int(3) DEFAULT NULL,
  `decribe` tinytext,
  PRIMARY KEY (`productId`),
  KEY `idx_ProName` (`productName`),
  KEY `cataId` (`cataId`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cataId`) REFERENCES `catagory` (`cataId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('baggage', '6', '包包', '10000.00', '13290.00', '48', '可爱包包');
INSERT INTO `product` VALUES ('book-01', '4', '将来的你', '10.00', '16.00', '50', '哲理人生，感悟生活');
INSERT INTO `product` VALUES ('computer', '5', '神州', '4000.00', '6999.00', '50', '性价比高，游戏专享');
INSERT INTO `product` VALUES ('cup-01', '1', '水杯', '10.00', '20.00', '87', 'shuibei');
INSERT INTO `product` VALUES ('glasses-01', '3', '眼镜', '60.00', '99.00', '47', '装饰眼镜');
INSERT INTO `product` VALUES ('tea-01', '2', '茶叶', '50.00', '100.00', '12', '信仰毛尖');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` char(8) NOT NULL,
  `name` char(10) DEFAULT NULL,
  `password` char(10) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `idx_UsName` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'aaa', '123456', '男', '123456789');
INSERT INTO `user` VALUES ('2', '张思', '123456', '男', '123456789');

-- ----------------------------
-- Table structure for `useraddress`
-- ----------------------------
DROP TABLE IF EXISTS `useraddress`;
CREATE TABLE `useraddress` (
  `userId` char(8) NOT NULL,
  `addressId` char(8) NOT NULL,
  `address` char(20) DEFAULT NULL,
  PRIMARY KEY (`userId`,`addressId`),
  CONSTRAINT `useraddress_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of useraddress
-- ----------------------------
INSERT INTO `useraddress` VALUES ('1', '101', '信阳');
INSERT INTO `useraddress` VALUES ('2', '102', '安阳');
DROP TRIGGER IF EXISTS `tri_update`;
DELIMITER ;;
CREATE TRIGGER `tri_update` AFTER UPDATE ON `orderdetail` FOR EACH ROW begin
declare a int(3);
select qty into a  from orderdetail where orderId=new.orderId;
update product set qty=qty-a where productId=old.productId;
end
;;
DELIMITER ;
