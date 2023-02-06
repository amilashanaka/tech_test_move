/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : project

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 06/02/2023 10:32:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `bedrooms` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, 'berminham', 'SA12 2HN', '2', 'building');
INSERT INTO `company` VALUES (2, 'cardiff', 'PA11 2HN', '2', 'building');
INSERT INTO `company` VALUES (3, 'Neath', 'SA10  2HN', '2', 'building');
INSERT INTO `company` VALUES (4, 'bristol', 'BS7 1D0', '2', 'building');
INSERT INTO `company` VALUES (5, 'cardiff', 'SA23 3RF', '2', 'building');
INSERT INTO `company` VALUES (6, 'newport', 'SA12 PH3', '2', 'building');

-- ----------------------------
-- Table structure for company_matching_settings
-- ----------------------------
DROP TABLE IF EXISTS `company_matching_settings`;
CREATE TABLE `company_matching_settings`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `company_id` int(255) NOT NULL,
  `postcodes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bedrooms` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `unique_id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of company_matching_settings
-- ----------------------------

-- ----------------------------
-- Table structure for doctrine_migration_versions
-- ----------------------------
DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions`  (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime(0) NULL DEFAULT NULL,
  `execution_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of doctrine_migration_versions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
