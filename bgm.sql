/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80016
Source Host           : 127.0.0.1:3306
Source Database       : bgm

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-10-20 12:27:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attendance
-- ----------------------------
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
  `emp_id` int(5) NOT NULL,
  `emp_name` varchar(16) DEFAULT NULL,
  `dept` varchar(255) DEFAULT NULL,
  `late_num` int(3) DEFAULT NULL,
  `leave_early_num` int(3) DEFAULT NULL,
  `attend_day` int(3) DEFAULT NULL,
  `absent_day` int(3) DEFAULT NULL,
  `ask_leave_day` int(3) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of attendance
-- ----------------------------
INSERT INTO `attendance` VALUES ('1', '沈文怡', '宜春智能物联', '1', '3', '0', '0', '0');
INSERT INTO `attendance` VALUES ('2', '江俊豪', '宜春智能物联', '0', '4', '0', '0', '0');
INSERT INTO `attendance` VALUES ('3', '刘斌', '宜春智能物联', '0', '3', '0', '0', '0');
INSERT INTO `attendance` VALUES ('4', '肖钒', '宜春智能物联', '0', '2', '0', '0', '0');
INSERT INTO `attendance` VALUES ('5', '扬延', '宜春智能物联', '0', '1', '0', '0', '0');
INSERT INTO `attendance` VALUES ('6', '刘行家', '宜春智能物联', '0', '2', '0', '0', '0');
INSERT INTO `attendance` VALUES ('7', '任仕杰', '宜春智能物联', '0', '2', '0', '0', '0');
INSERT INTO `attendance` VALUES ('8', '王龙威', '宜春智能物联', '0', '4', '0', '0', '0');
INSERT INTO `attendance` VALUES ('9', '徐根荣', '宜春智能物联', '0', '4', '0', '0', '0');
INSERT INTO `attendance` VALUES ('10', '饶知慧', '宜春智能物联', '1', '6', '0', '0', '0');
INSERT INTO `attendance` VALUES ('11', '姚云', '宜春智能物联', '1', '4', '0', '0', '0');
INSERT INTO `attendance` VALUES ('12', '戴振萍', '宜春智能物联', '0', '0', '0', '0', '0');
INSERT INTO `attendance` VALUES ('13', '刘春杰', '宜春智能物联', '1', '2', '0', '0', '0');
INSERT INTO `attendance` VALUES ('14', '万宇坤', '宜春智能物联', '0', '6', '0', '0', '0');
INSERT INTO `attendance` VALUES ('15', '李欣科', '宜春智能物联', '0', '5', '0', '0', '0');
INSERT INTO `attendance` VALUES ('16', '谢志强', '宜春智能物联', '0', '6', '0', '0', '0');
INSERT INTO `attendance` VALUES ('17', '刘啸林', '宜春智能物联', '2', '2', '0', '0', '0');
INSERT INTO `attendance` VALUES ('18', '赖健', '宜春智能物联', '0', '5', '0', '0', '0');
INSERT INTO `attendance` VALUES ('19', '何明', '宜春智能物联', '0', '4', '0', '0', '0');
INSERT INTO `attendance` VALUES ('20', '周洵', '宜春智能物联', '0', '4', '0', '0', '0');
INSERT INTO `attendance` VALUES ('21', '颜韬', '宜春智能物联', '0', '5', '0', '0', '0');
INSERT INTO `attendance` VALUES ('22', '陈伴绵', '宜春智能物联', '0', '5', '0', '0', '0');
INSERT INTO `attendance` VALUES ('23', '黄贤俊', '宜春智能物联', '0', '4', '0', '0', '0');
INSERT INTO `attendance` VALUES ('24', '梁健', '宜春智能物联', '1', '3', '0', '0', '0');
INSERT INTO `attendance` VALUES ('25', '陈文清', '宜春智能物联', '1', '3', '0', '0', '0');
INSERT INTO `attendance` VALUES ('26', '邵海欣', '宜春智能物联', '0', '5', '0', '0', '0');
INSERT INTO `attendance` VALUES ('27', '于佳烨', '宜春大数据', '0', '8', '0', '0', '0');
INSERT INTO `attendance` VALUES ('28', '胡玉林', '宜春大数据', '1', '10', '0', '0', '0');
INSERT INTO `attendance` VALUES ('29', '李鑫皓', '宜春大数据', '0', '6', '0', '0', '0');
INSERT INTO `attendance` VALUES ('30', '廖九金', '宜春大数据', '1', '10', '0', '0', '0');
INSERT INTO `attendance` VALUES ('31', '罗琪', '宜春大数据', '0', '5', '0', '0', '0');
INSERT INTO `attendance` VALUES ('32', '倪宗龙', '宜春大数据', '0', '5', '0', '0', '0');
INSERT INTO `attendance` VALUES ('33', '王星明', '宜春大数据', '1', '10', '0', '0', '0');
INSERT INTO `attendance` VALUES ('34', '熊赞', '宜春大数据', '0', '6', '0', '0', '0');
INSERT INTO `attendance` VALUES ('35', '袁仁伟', '宜春大数据', '2', '9', '0', '0', '0');
INSERT INTO `attendance` VALUES ('36', '张玉成', '宜春大数据', '0', '6', '0', '0', '0');
INSERT INTO `attendance` VALUES ('37', '祝雷', '宜春大数据', '4', '4', '0', '0', '0');
INSERT INTO `attendance` VALUES ('38', '陈尚怀', '宜春大数据', '0', '5', '0', '0', '0');
INSERT INTO `attendance` VALUES ('39', '龚希辉', '宜春大数据', '0', '2', '4', '0', '0');
INSERT INTO `attendance` VALUES ('40', '李鑫', '宜春大数据', '0', '8', '0', '0', '0');
INSERT INTO `attendance` VALUES ('41', '卢地生', '宜春大数据', '0', '6', '0', '0', '0');
INSERT INTO `attendance` VALUES ('42', '邬杰锋', '宜春大数据', '0', '4', '0', '0', '0');
INSERT INTO `attendance` VALUES ('43', '肖荣', '宜春大数据', '2', '7', '0', '0', '0');
INSERT INTO `attendance` VALUES ('44', '陈亚东', '宜春大数据', '0', '5', '0', '0', '0');
INSERT INTO `attendance` VALUES ('45', '郭毅立', '宜春大数据', '2', '5', '0', '0', '0');
INSERT INTO `attendance` VALUES ('46', '张润华', '宜春大数据', '2', '5', '0', '0', '0');
INSERT INTO `attendance` VALUES ('47', '王彬彬', '宜春大数据', '0', '8', '0', '0', '0');
INSERT INTO `attendance` VALUES ('48', '刘露明', '宜春大数据', '1', '6', '0', '0', '0');
INSERT INTO `attendance` VALUES ('49', '陈源富', '宜春大数据', '0', '9', '0', '0', '0');
INSERT INTO `attendance` VALUES ('50', '曾锦霖', '宜春大数据', '0', '9', '0', '0', '0');
INSERT INTO `attendance` VALUES ('51', '邱文平', '宜春大数据', '0', '10', '0', '0', '0');
INSERT INTO `attendance` VALUES ('52', '黄世川', '宜春大数据', '0', '10', '0', '0', '0');
INSERT INTO `attendance` VALUES ('53', '吴德蔚', '宜春大数据', '0', '9', '0', '0', '0');
INSERT INTO `attendance` VALUES ('54', '徐槐林', '宜春大数据', '0', '10', '0', '0', '0');
INSERT INTO `attendance` VALUES ('55', '张育柏', '宜春大数据', '0', '10', '0', '0', '0');
INSERT INTO `attendance` VALUES ('56', '李文锐', '宜春大数据', '0', '10', '0', '0', '0');
INSERT INTO `attendance` VALUES ('57', '于杰', '宜春大数据', '0', '7', '0', '0', '0');
INSERT INTO `attendance` VALUES ('58', '叶佩佩', '西安文理大数据', '0', '2', '2', '0', '0');
INSERT INTO `attendance` VALUES ('59', '叶茂', '西安文理大数据', '0', '2', '2', '0', '0');
INSERT INTO `attendance` VALUES ('60', '徐盈盈', '西安文理大数据', '0', '1', '2', '0', '0');
INSERT INTO `attendance` VALUES ('61', '温承志', '宜春大数据', '0', '0', '5', '0', '0');

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `level` int(11) DEFAULT NULL,
  `title` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('2', '员工信息', null);
INSERT INTO `catalog` VALUES ('2', '考勤记录', null);
INSERT INTO `catalog` VALUES ('2', '个人信息', null);
INSERT INTO `catalog` VALUES ('3', '考勤记录', null);
INSERT INTO `catalog` VALUES ('3', '个人信息', null);
INSERT INTO `catalog` VALUES ('1', '权限管理', null);
INSERT INTO `catalog` VALUES ('1', '管理员信息', null);
INSERT INTO `catalog` VALUES ('1', '个人信息', null);
INSERT INTO `catalog` VALUES ('2', '导入信息', null);

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `emp_id` int(5) NOT NULL COMMENT '员工号(主键)',
  `dept` varchar(16) DEFAULT NULL COMMENT '员工姓名',
  `emp_name` varchar(20) DEFAULT NULL COMMENT '部门',
  `stu_id` varchar(15) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL COMMENT '性别,m:man,w:woman,n:none',
  `tel` varchar(11) DEFAULT NULL COMMENT '手机号',
  `address` varchar(25) DEFAULT NULL COMMENT '住址',
  `disable` int(1) DEFAULT '0' COMMENT '是否禁用（0：不禁用，1：禁用）',
  `level` int(1) DEFAULT '3' COMMENT '员工等级（3：员工、2：管理员、1：超级管理员）',
  `password` varchar(16) DEFAULT '123456' COMMENT '密码',
  PRIMARY KEY (`emp_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of emp
-- ----------------------------
INSERT INTO `emp` VALUES ('2', '智能物联', '江俊豪', '16050518121', '男', '', '', '1', '2', '123456');
INSERT INTO `emp` VALUES ('4', '智能物联', '肖钒', '', '', '1234567890', '宜春学院', '0', '3', '123456');
INSERT INTO `emp` VALUES ('5', '智能物联', '扬延', '', '', '', '', '0', '3', '123456');
INSERT INTO `emp` VALUES ('6', '智能物联', '刘行家', '', '', '', '', '0', '3', '123456');
INSERT INTO `emp` VALUES ('7', '智能物联', '任仕杰', '16050518223', '', '13224433223', '2assa', '0', '2', '123456');
INSERT INTO `emp` VALUES ('8', '智能物联', '王龙威', '', '', '', '', '1', '3', '123456');
INSERT INTO `emp` VALUES ('9', '智能物联', '徐根荣', '16050518221', '', '1221', '', '0', '2', '123456');
INSERT INTO `emp` VALUES ('10', '智能物联', '饶知慧', '', '女', '', 'dsfsdf', '0', '2', '123456');
INSERT INTO `emp` VALUES ('11', '智能物联', '姚云', '', '', '', '', '0', '3', '123456');
INSERT INTO `emp` VALUES ('12', '宜春智能物联', '戴振萍', null, null, null, null, '0', '3', '123456');
INSERT INTO `emp` VALUES ('13', '宜春智能物联', '刘春杰', null, null, null, null, '0', '3', '123456');
INSERT INTO `emp` VALUES ('14', '宜春智能物联', '万宇坤', null, null, null, null, '0', '3', '123456');
INSERT INTO `emp` VALUES ('15', '宜春智能物联', '李欣科', null, null, null, null, '0', '3', '123456');
INSERT INTO `emp` VALUES ('16', '宜春智能物联', '谢志强', null, null, null, null, '0', '3', '123456');
INSERT INTO `emp` VALUES ('17', '宜春智能物联', '刘啸林', null, null, null, null, '0', '3', '123456');
INSERT INTO `emp` VALUES ('18', '智能物联', '赖健', '', '', '', '', '0', '3', '123456');
INSERT INTO `emp` VALUES ('19', '宜春智能物联', '何明', null, '男', '13666368920', '德国', '0', '1', '123456');
INSERT INTO `emp` VALUES ('20', '宜春智能物联', '周洵', null, null, null, null, '0', '3', '123456');
INSERT INTO `emp` VALUES ('21', '智能物联', '颜韬', '', '女', '', '', '0', '2', '123456');
INSERT INTO `emp` VALUES ('22', '宜春智能物联', '陈伴绵', null, null, null, null, '0', '3', '123456');
INSERT INTO `emp` VALUES ('23', '宜春智能物联', '黄贤俊', null, null, null, null, '0', '3', '123456');
INSERT INTO `emp` VALUES ('24', '智能物联', '梁健', '', '', '', '', '1', '3', '123456');
INSERT INTO `emp` VALUES ('25', '宜春智能物联', '陈文清', null, null, null, null, '0', '3', '123456');
INSERT INTO `emp` VALUES ('26', '宜春智能物联', '邵海欣', null, null, null, null, '0', '3', '123456');
INSERT INTO `emp` VALUES ('27', 'java大数据', '于佳烨', '16050506109', '男', '18920936390', '1003室', '0', '2', '123456');
INSERT INTO `emp` VALUES ('28', '宜春大数据', '胡玉林', '16050506115\r\n', '男', '15279635130', '412室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('29', '宜春大数据', '李鑫皓', '16050506119\r\n', '男', '17879553283', '406室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('30', 'java大数据', '廖九金', '16050506120', '男', '1367854445', '宜春学院', '0', '2', '123456');
INSERT INTO `emp` VALUES ('31', '宜春大数据', '罗琪', '16050506123\r\n', '男', '15879623710', '406室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('32', '宜春大数据', '倪宗龙', '16050506125\r\n', '男', '17879552802', '406室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('33', '宜春大数据', '王星明', '16050506128\r\n', '男', '15720922101', '412室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('34', '宜春大数据', '熊赞', '16050506134\r\n', '男', '15180559914', '404室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('35', '宜春大数据', '袁仁伟', '16050506139\r\n', '男', '18270566680', '412室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('36', 'java大数据', '张玉成', '16050506140', '', '', '', '0', '3', '123456');
INSERT INTO `emp` VALUES ('37', '宜春大数据', '祝雷', '16050506141\r\n', '男', '18407801741', '412室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('38', '宜春大数据', '陈尚怀', '16050506210\r\n', '男', '18870523911', '406室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('39', '宜春大数据', '龚希辉', '16050506213\r\n', '男', '18370389153', '404室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('40', '宜春大数据', '李鑫', '16050506217\r\n', '男', '18270020920', '406室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('41', '宜春大数据', '卢地生', '16050506222\r\n', '男', '15170625562', '406室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('42', '宜春大数据', '邬杰锋', '16050506230\r\n', '男', '18296523566', '404室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('44', '宜春大数据', '陈亚东', '16050506112\r\n', '男', '17879553055', '415室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('45', 'java大数据', '郭毅立', '16050518108', '', '', '', '0', '3', '123456');
INSERT INTO `emp` VALUES ('46', '宜春大数据', '张润华', '16050518130\r\n', '男', '18296598749', '415室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('47', '宜春大数据', '王彬彬', '16050518217\r\n', '男', '15770887034', '603室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('48', '宜春大数据', '刘露明', '16050518214\r\n', '男', '15932834277', '603室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('49', '宜春大数据', '陈源富', '16050518206\r\n', '男', '18870540595', '606室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('50', '宜春大数据', '曾锦霖', '16050518224\r\n', '男', '18470190525', '606室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('51', '宜春大数据', '邱文平', '16050518117\r\n', '男', '13755968759', '607室', '0', '3', '123456');
INSERT INTO `emp` VALUES ('52', 'java大数据', '黄世川', '16050518110', '', '', '', '0', '3', '123');
INSERT INTO `emp` VALUES ('53', 'java大数据', '吴德蔚', '16050518122', '', null, null, '1', '3', '123456');
INSERT INTO `emp` VALUES ('54', '智能物联', '徐槐林', '16050518126', '', '', '', '0', '3', '123456');
INSERT INTO `emp` VALUES ('55', 'java大数据', '张育柏', '16050518226', '', '', '', '0', '3', '123456');
INSERT INTO `emp` VALUES ('56', 'java大数据', '李文锐', '16050518212', '', '', '', '0', '3', '123456');
INSERT INTO `emp` VALUES ('57', 'java大数据', '于杰', '16050518223', '', '', '', '0', '3', '123456');
INSERT INTO `emp` VALUES ('59', 'java大数据', '叶茂', '', '', '', '', '0', '2', '123456');
INSERT INTO `emp` VALUES ('60', 'java大数据', '徐盈盈', '', '', '', '', '0', '2', '123456');
INSERT INTO `emp` VALUES ('61', 'java大数据', '温承志', '16050518121', '', '', '', '0', '2', '123456');
