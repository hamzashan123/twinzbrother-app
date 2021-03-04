/*
 Navicat Premium Data Transfer

 Source Server         : xampplocalhost
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : twinzbrother

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 04/03/2021 11:40:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'Levis', 'brands\\March2021\\MOrRD3KewhdUuhABbdJo.png', '2021-03-03 12:17:56', '2021-03-03 12:17:56');
INSERT INTO `brands` VALUES (2, 'J.', 'brands\\March2021\\PJjblCmbV4MjColWGqL7.jpg', '2021-03-03 20:03:20', '2021-03-03 20:03:20');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categories_slug_unique`(`slug`) USING BTREE,
  INDEX `categories_parent_id_foreign`(`parent_id`) USING BTREE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, NULL, 1, 'Shirts', 'shirts', '2021-03-03 15:05:46', '2021-03-03 18:49:44', NULL);
INSERT INTO `categories` VALUES (2, NULL, 2, 'Pants', 'pants', '2021-03-03 19:26:57', '2021-03-03 19:26:57', 'categories\\March2021\\FjDJpKsRfnyCAu9hTD1R.jpg');
INSERT INTO `categories` VALUES (3, 2, 3, 'Kids', 'kids', '2021-03-03 19:27:32', '2021-03-03 19:27:32', 'categories\\March2021\\7E1L0w43NgSu7Vy59Fp3.webp');

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `amount` double NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupons
-- ----------------------------
INSERT INTO `coupons` VALUES (1, 'Eid Shopping Online', 'For eid we have new offer for copen', 'percentage', 'TWINZ101', '2021-03-03 20:02:28', '2021-03-03 20:02:28', 'active', 150);

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `symbol` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of currencies
-- ----------------------------
INSERT INTO `currencies` VALUES (1, 'Pakistani Rupee', 'PKR-01', 'PKR', 'active', '2021-03-03 12:18:40', '2021-03-03 12:18:40');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `billing_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `billing_city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `billing_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `billing_zip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_zip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `billing_country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for data_rows
-- ----------------------------
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data_rows_data_type_id_foreign`(`data_type_id`) USING BTREE,
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 293 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_rows
-- ----------------------------
INSERT INTO `data_rows` VALUES (1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3);
INSERT INTO `data_rows` VALUES (4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5);
INSERT INTO `data_rows` VALUES (6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6);
INSERT INTO `data_rows` VALUES (7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7);
INSERT INTO `data_rows` VALUES (8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8);
INSERT INTO `data_rows` VALUES (9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10);
INSERT INTO `data_rows` VALUES (10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11);
INSERT INTO `data_rows` VALUES (11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12);
INSERT INTO `data_rows` VALUES (12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3);
INSERT INTO `data_rows` VALUES (15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2);
INSERT INTO `data_rows` VALUES (18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3);
INSERT INTO `data_rows` VALUES (19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4);
INSERT INTO `data_rows` VALUES (20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5);
INSERT INTO `data_rows` VALUES (21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9);
INSERT INTO `data_rows` VALUES (22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2);
INSERT INTO `data_rows` VALUES (24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3);
INSERT INTO `data_rows` VALUES (25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5);
INSERT INTO `data_rows` VALUES (27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 7);
INSERT INTO `data_rows` VALUES (28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8);
INSERT INTO `data_rows` VALUES (29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (30, 5, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, '{}', 2);
INSERT INTO `data_rows` VALUES (31, 5, 'category_id', 'text', 'Category', 0, 0, 1, 1, 1, 0, '{}', 4);
INSERT INTO `data_rows` VALUES (32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 5);
INSERT INTO `data_rows` VALUES (33, 5, 'excerpt', 'text_area', 'Excerpt', 0, 0, 1, 1, 1, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, '{}', 7);
INSERT INTO `data_rows` VALUES (35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":false,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"}]}', 8);
INSERT INTO `data_rows` VALUES (36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"required|unique:posts,slug\"}}', 9);
INSERT INTO `data_rows` VALUES (37, 5, 'meta_description', 'text_area', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 10);
INSERT INTO `data_rows` VALUES (38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 11);
INSERT INTO `data_rows` VALUES (39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 12);
INSERT INTO `data_rows` VALUES (40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, '{}', 13);
INSERT INTO `data_rows` VALUES (41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14);
INSERT INTO `data_rows` VALUES (42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, '{}', 15);
INSERT INTO `data_rows` VALUES (43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{}', 16);
INSERT INTO `data_rows` VALUES (44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1);
INSERT INTO `data_rows` VALUES (45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2);
INSERT INTO `data_rows` VALUES (46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3);
INSERT INTO `data_rows` VALUES (47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4);
INSERT INTO `data_rows` VALUES (48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5);
INSERT INTO `data_rows` VALUES (49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6);
INSERT INTO `data_rows` VALUES (50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7);
INSERT INTO `data_rows` VALUES (51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8);
INSERT INTO `data_rows` VALUES (52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9);
INSERT INTO `data_rows` VALUES (53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10);
INSERT INTO `data_rows` VALUES (54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11);
INSERT INTO `data_rows` VALUES (55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12);
INSERT INTO `data_rows` VALUES (56, 5, 'post_belongsto_category_relationship', 'relationship', 'Category', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3);
INSERT INTO `data_rows` VALUES (174, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (175, 16, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2);
INSERT INTO `data_rows` VALUES (176, 16, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 3);
INSERT INTO `data_rows` VALUES (177, 16, 'rating', 'number', 'Rating', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric|min:0|max:5\"}}', 4);
INSERT INTO `data_rows` VALUES (178, 16, 'designation', 'text', 'Designation', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 5);
INSERT INTO `data_rows` VALUES (179, 16, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8);
INSERT INTO `data_rows` VALUES (180, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9);
INSERT INTO `data_rows` VALUES (181, 16, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (182, 16, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"active\",\"options\":{\"active\":\"active\",\"inactive\":\"inactive\"}}', 7);
INSERT INTO `data_rows` VALUES (189, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (190, 18, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2);
INSERT INTO `data_rows` VALUES (191, 18, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (192, 18, 'designation', 'text', 'Designation', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 4);
INSERT INTO `data_rows` VALUES (193, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (194, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6);
INSERT INTO `data_rows` VALUES (195, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (196, 19, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2);
INSERT INTO `data_rows` VALUES (197, 19, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (198, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (199, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 5);
INSERT INTO `data_rows` VALUES (201, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (202, 20, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2);
INSERT INTO `data_rows` VALUES (203, 20, 'slug', 'text', 'Slug', 0, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"required|unique:products,slug\"}}', 3);
INSERT INTO `data_rows` VALUES (204, 20, 'category_id', 'text', 'Category Id', 0, 0, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (205, 20, 'small_description', 'text_area', 'Small Description', 0, 0, 1, 1, 1, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (206, 20, 'large_description', 'rich_text_box', 'Large Description', 0, 0, 1, 1, 1, 1, '{}', 7);
INSERT INTO `data_rows` VALUES (207, 20, 'regular_price', 'number', 'Regular Price', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 8);
INSERT INTO `data_rows` VALUES (208, 20, 'discounted_price', 'number', 'Discounted Price', 0, 1, 1, 1, 1, 1, '{\"default\":0}', 9);
INSERT INTO `data_rows` VALUES (209, 20, 'sku', 'text', 'Sku', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:products,sku\"}}', 10);
INSERT INTO `data_rows` VALUES (210, 20, 'quantity', 'number', 'Quantity', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|integer\"}}', 11);
INSERT INTO `data_rows` VALUES (211, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 15);
INSERT INTO `data_rows` VALUES (212, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 16);
INSERT INTO `data_rows` VALUES (213, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (214, 21, 'title', 'text', 'Title', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2);
INSERT INTO `data_rows` VALUES (215, 21, 'description', 'text', 'Description', 0, 0, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (216, 21, 'type', 'select_dropdown', 'Type', 0, 1, 1, 1, 1, 1, '{\"default\":\"fixed\",\"options\":{\"fixed\":\"fixed\",\"percentage\":\"percentage\"}}', 4);
INSERT INTO `data_rows` VALUES (217, 21, 'code', 'text', 'Code', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:coupons,code\"}}', 5);
INSERT INTO `data_rows` VALUES (218, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8);
INSERT INTO `data_rows` VALUES (219, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9);
INSERT INTO `data_rows` VALUES (220, 21, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"active\",\"options\":{\"active\":\"active\",\"inactive\":\"inactive\"}}', 7);
INSERT INTO `data_rows` VALUES (221, 21, 'amount', 'number', 'Amount', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 6);
INSERT INTO `data_rows` VALUES (222, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (223, 22, 'user_id', 'text', 'User Id', 0, 0, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (224, 22, 'invoice_id', 'text', 'Invoice Id', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:orders,invoice_id\"}}', 4);
INSERT INTO `data_rows` VALUES (232, 22, 'shipping_address', 'text', 'Shipping Address', 0, 1, 1, 1, 1, 1, '{}', 14);
INSERT INTO `data_rows` VALUES (233, 22, 'shipping_city', 'text', 'Shipping City', 0, 0, 1, 1, 1, 1, '{}', 15);
INSERT INTO `data_rows` VALUES (234, 22, 'shipping_state', 'text', 'Shipping State', 0, 0, 1, 1, 1, 1, '{}', 16);
INSERT INTO `data_rows` VALUES (235, 22, 'shipping_zip', 'text', 'Shipping Zip', 0, 0, 1, 1, 1, 1, '{}', 17);
INSERT INTO `data_rows` VALUES (236, 22, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"processing\",\"options\":{\"processing\":\"processing\",\"complete\":\"complete\",\"canceled\":\"canceled\",\"refunded\":\"refunded\"}}', 18);
INSERT INTO `data_rows` VALUES (237, 22, 'ordered_items', 'text', 'Ordered Items', 0, 0, 1, 1, 1, 1, '{}', 19);
INSERT INTO `data_rows` VALUES (238, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 26);
INSERT INTO `data_rows` VALUES (239, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 27);
INSERT INTO `data_rows` VALUES (240, 22, 'billing_name', 'text', 'Billing Name', 0, 1, 1, 1, 1, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (241, 22, 'billing_email', 'text', 'Billing Email', 0, 1, 1, 1, 1, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (242, 22, 'billing_phone', 'text', 'Billing Phone', 0, 1, 1, 1, 1, 1, '{}', 7);
INSERT INTO `data_rows` VALUES (243, 22, 'billing_address', 'text', 'Billing Address', 0, 1, 1, 1, 1, 1, '{}', 9);
INSERT INTO `data_rows` VALUES (244, 22, 'billing_city', 'text', 'Billing City', 0, 0, 1, 1, 1, 1, '{}', 10);
INSERT INTO `data_rows` VALUES (245, 22, 'billing_state', 'text', 'Billing State', 0, 0, 1, 1, 1, 1, '{}', 11);
INSERT INTO `data_rows` VALUES (246, 22, 'billing_zip', 'text', 'Billing Zip', 0, 0, 1, 1, 1, 1, '{}', 12);
INSERT INTO `data_rows` VALUES (247, 22, 'payment_method', 'select_dropdown', 'Payment Method', 0, 0, 1, 1, 1, 1, '{\"default\":\"cod\",\"options\":{\"cod\":\"cod\",\"stripe\":\"stripe\",\"paypal\":\"paypal\",\"manual\":\"manual\"}}', 24);
INSERT INTO `data_rows` VALUES (248, 22, 'pp_invoice_id', 'text', 'Payment Processor Id', 0, 0, 1, 1, 1, 1, '{}', 25);
INSERT INTO `data_rows` VALUES (250, 22, 'total_amount', 'number', 'Total Amount', 0, 0, 1, 1, 1, 1, '{}', 23);
INSERT INTO `data_rows` VALUES (251, 22, 'conditions', 'text', 'Conditions', 0, 0, 1, 1, 1, 1, '{}', 22);
INSERT INTO `data_rows` VALUES (252, 22, 'order_belongsto_user_relationship', 'relationship', 'User', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2);
INSERT INTO `data_rows` VALUES (253, 22, 'discount', 'number', 'Discount', 0, 0, 1, 1, 1, 1, '{}', 20);
INSERT INTO `data_rows` VALUES (254, 22, 'discounted_subtotal', 'number', 'Discounted Subtotal', 0, 0, 1, 1, 1, 1, '{}', 21);
INSERT INTO `data_rows` VALUES (255, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (256, 23, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (257, 23, 'billing_address', 'text', 'Billing Address', 0, 1, 1, 1, 1, 1, '{}', 5);
INSERT INTO `data_rows` VALUES (258, 23, 'billing_city', 'text', 'Billing City', 0, 0, 1, 1, 1, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (259, 23, 'billing_state', 'text', 'Billing State', 0, 0, 1, 1, 1, 1, '{}', 7);
INSERT INTO `data_rows` VALUES (260, 23, 'billing_zip', 'text', 'Billing Zip', 0, 0, 1, 1, 1, 1, '{}', 8);
INSERT INTO `data_rows` VALUES (261, 23, 'shipping_address', 'text', 'Shipping Address', 0, 1, 1, 1, 1, 1, '{}', 10);
INSERT INTO `data_rows` VALUES (262, 23, 'shipping_city', 'text', 'Shipping City', 0, 0, 1, 1, 1, 1, '{}', 11);
INSERT INTO `data_rows` VALUES (263, 23, 'shipping_state', 'text', 'Shipping State', 0, 0, 1, 1, 1, 1, '{}', 12);
INSERT INTO `data_rows` VALUES (264, 23, 'shipping_zip', 'text', 'Shipping Zip', 0, 0, 1, 1, 1, 1, '{}', 13);
INSERT INTO `data_rows` VALUES (265, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 14);
INSERT INTO `data_rows` VALUES (266, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15);
INSERT INTO `data_rows` VALUES (267, 23, 'customer_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2);
INSERT INTO `data_rows` VALUES (268, 20, 'primary_image', 'image', 'Primary Image', 0, 1, 1, 1, 1, 1, '{}', 12);
INSERT INTO `data_rows` VALUES (269, 20, 'other_image', 'multiple_images', 'Other Image', 0, 0, 1, 1, 1, 1, '{}', 13);
INSERT INTO `data_rows` VALUES (270, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (271, 24, 'product_id', 'text', 'Product Id', 0, 1, 1, 1, 1, 1, '{}', 2);
INSERT INTO `data_rows` VALUES (272, 24, 'user_id', 'text', 'User Id', 0, 1, 1, 1, 1, 1, '{}', 3);
INSERT INTO `data_rows` VALUES (273, 24, 'rating', 'number', 'Rating', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 6);
INSERT INTO `data_rows` VALUES (274, 24, 'description', 'text_area', 'Description', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 7);
INSERT INTO `data_rows` VALUES (275, 24, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 8);
INSERT INTO `data_rows` VALUES (276, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 9);
INSERT INTO `data_rows` VALUES (277, 24, 'review_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4);
INSERT INTO `data_rows` VALUES (278, 24, 'review_belongsto_product_relationship', 'relationship', 'Product', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsTo\",\"column\":\"product_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5);
INSERT INTO `data_rows` VALUES (279, 20, 'product_belongsto_category_relationship', 'relationship', 'Category', 0, 1, 1, 1, 1, 1, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"brands\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5);
INSERT INTO `data_rows` VALUES (280, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1);
INSERT INTO `data_rows` VALUES (281, 25, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 2);
INSERT INTO `data_rows` VALUES (282, 25, 'code', 'text', 'Code', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 3);
INSERT INTO `data_rows` VALUES (283, 25, 'symbol', 'text', 'Symbol', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 4);
INSERT INTO `data_rows` VALUES (284, 25, 'status', 'select_dropdown', 'Status', 0, 1, 1, 1, 1, 1, '{\"default\":\"none\",\"null\":\"\",\"options\":{\"none\":\"none\",\"active\":\"active\"}}', 5);
INSERT INTO `data_rows` VALUES (285, 25, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (286, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{\"default\":\"pakistan\"}', 7);
INSERT INTO `data_rows` VALUES (287, 23, 'billing_country', 'text', 'Billing Country', 0, 0, 1, 1, 1, 1, '{}', 4);
INSERT INTO `data_rows` VALUES (288, 23, 'shipping_country', 'text', 'Shipping Country', 0, 0, 1, 1, 1, 1, '{}', 9);
INSERT INTO `data_rows` VALUES (289, 22, 'billing_country', 'text', 'Billing Country', 0, 0, 1, 1, 1, 1, '{}', 8);
INSERT INTO `data_rows` VALUES (290, 22, 'shipping_country', 'text', 'Shipping Country', 0, 0, 1, 1, 1, 1, '{}', 13);
INSERT INTO `data_rows` VALUES (291, 4, 'image', 'image', 'Image', 0, 0, 1, 1, 1, 1, '{}', 6);
INSERT INTO `data_rows` VALUES (292, 20, 'featured', 'checkbox', 'Featured', 0, 0, 1, 1, 1, 1, '{}', 14);

-- ----------------------------
-- Table structure for data_types
-- ----------------------------
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `model_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `policy_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `controller` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `data_types_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `data_types_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO `data_types` VALUES (1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2020-04-28 09:48:41', '2020-04-28 09:48:41');
INSERT INTO `data_types` VALUES (2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-04-28 09:48:41', '2020-04-28 09:48:41');
INSERT INTO `data_types` VALUES (3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-04-28 09:48:41', '2020-04-28 09:48:41');
INSERT INTO `data_types` VALUES (4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-04-28 09:48:48', '2020-07-26 07:53:27');
INSERT INTO `data_types` VALUES (5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"title\",\"scope\":null}', '2020-04-28 09:48:49', '2020-05-03 14:37:43');
INSERT INTO `data_types` VALUES (6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-04-28 09:48:50', '2020-04-28 09:48:50');
INSERT INTO `data_types` VALUES (16, 'testimonials', 'testimonials', 'Testimonial', 'Testimonials', 'voyager-star', 'App\\Testimonial', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-18 15:28:07', '2020-06-21 05:15:50');
INSERT INTO `data_types` VALUES (18, 'members', 'members', 'Member', 'Members', 'voyager-people', 'App\\Member', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"name\"}', '2020-06-18 15:40:58', '2020-06-18 15:40:58');
INSERT INTO `data_types` VALUES (19, 'brands', 'brands', 'Brand', 'Brands', 'voyager-tag', 'App\\Brand', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"name\"}', '2020-06-20 05:07:56', '2020-06-20 05:07:56');
INSERT INTO `data_types` VALUES (20, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"title\",\"scope\":null}', '2020-06-24 16:19:26', '2020-07-26 07:54:05');
INSERT INTO `data_types` VALUES (21, 'coupons', 'coupons', 'Coupon', 'Coupons', 'voyager-dollar', 'App\\Coupon', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"title\",\"scope\":null}', '2020-06-26 08:53:11', '2020-06-26 09:00:11');
INSERT INTO `data_types` VALUES (22, 'orders', 'orders', 'Order', 'Orders', 'voyager-bag', 'App\\Order', NULL, 'App\\Http\\Controllers\\Voyager\\OrdersController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"invoice_id\",\"scope\":null}', '2020-06-27 08:37:04', '2020-07-26 06:57:23');
INSERT INTO `data_types` VALUES (23, 'customers', 'customers', 'Customer', 'Customers', 'voyager-people', 'App\\Customer', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-30 05:29:08', '2020-07-26 06:56:15');
INSERT INTO `data_types` VALUES (24, 'reviews', 'reviews', 'Review', 'Reviews', 'voyager-star', 'App\\Review', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"product_id\",\"scope\":null}', '2020-07-01 10:43:56', '2020-07-01 10:48:21');
INSERT INTO `data_types` VALUES (25, 'currencies', 'currencies', 'Currency', 'Currencies', 'voyager-credit-cards', 'App\\Currency', NULL, 'App\\Http\\Controllers\\Voyager\\CurrencyController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":\"name\",\"scope\":null}', '2020-07-01 15:55:45', '2020-07-02 10:02:42');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `designation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES (1, 'Test Member', 'members\\March2021\\P9DEndJzTWm3zp7RXNku.jpg', 'Test Designation', '2021-03-03 15:03:09', '2021-03-03 15:03:09');

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `route` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_items_menu_id_foreign`(`menu_id`) USING BTREE,
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES (1, 1, 'Dashboard', '', '_self', 'voyager-boat', '#000000', NULL, 1, '2020-04-28 09:48:42', '2020-07-25 12:47:11', 'voyager.dashboard', 'null');
INSERT INTO `menu_items` VALUES (2, 1, 'Media', '', '_self', 'voyager-images', '#000000', NULL, 4, '2020-04-28 09:48:42', '2020-06-20 15:38:37', 'voyager.media.index', 'null');
INSERT INTO `menu_items` VALUES (3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2020-04-28 09:48:42', '2020-04-28 09:48:42', 'voyager.users.index', NULL);
INSERT INTO `menu_items` VALUES (4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2020-04-28 09:48:42', '2020-04-28 09:48:42', 'voyager.roles.index', NULL);
INSERT INTO `menu_items` VALUES (5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 18, '2020-04-28 09:48:42', '2020-07-25 15:38:56', NULL, NULL);
INSERT INTO `menu_items` VALUES (6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-04-28 09:48:42', '2020-05-03 15:34:55', 'voyager.menus.index', NULL);
INSERT INTO `menu_items` VALUES (7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-04-28 09:48:42', '2020-05-03 15:34:55', 'voyager.database.index', NULL);
INSERT INTO `menu_items` VALUES (8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-04-28 09:48:42', '2020-05-03 15:34:55', 'voyager.compass.index', NULL);
INSERT INTO `menu_items` VALUES (9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-04-28 09:48:42', '2020-05-03 15:34:55', 'voyager.bread.index', NULL);
INSERT INTO `menu_items` VALUES (10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 17, '2020-04-28 09:48:42', '2020-07-25 15:38:56', 'voyager.settings.index', NULL);
INSERT INTO `menu_items` VALUES (11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 7, '2020-04-28 09:48:48', '2020-07-05 07:03:45', 'voyager.categories.index', NULL);
INSERT INTO `menu_items` VALUES (12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 5, '2020-04-28 09:48:49', '2020-07-05 07:03:44', 'voyager.posts.index', NULL);
INSERT INTO `menu_items` VALUES (13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 6, '2020-04-28 09:48:50', '2020-07-05 07:03:44', 'voyager.pages.index', NULL);
INSERT INTO `menu_items` VALUES (14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-04-28 09:48:52', '2020-05-03 15:34:55', 'voyager.hooks', NULL);
INSERT INTO `menu_items` VALUES (18, 2, 'Home', '/', '_self', NULL, '#e4017a', NULL, 1, '2020-05-01 11:27:01', '2021-03-03 20:30:42', NULL, '');
INSERT INTO `menu_items` VALUES (22, 2, 'Contact', '/contact', '_self', NULL, '#000000', NULL, 4, '2020-05-02 11:26:09', '2021-03-03 20:26:20', NULL, '');
INSERT INTO `menu_items` VALUES (23, 3, 'Privacy Policy', '/page/privacy-policy', '_self', NULL, '#000000', NULL, 1, '2020-05-03 10:44:22', '2020-06-20 16:00:25', NULL, '');
INSERT INTO `menu_items` VALUES (24, 3, 'Terms & Condition', '/page/terms-condition', '_self', NULL, '#000000', NULL, 2, '2020-05-03 10:45:11', '2020-06-20 16:00:25', NULL, '');
INSERT INTO `menu_items` VALUES (25, 3, 'Contact', '/contact', '_self', NULL, '#000000', NULL, 4, '2020-05-03 10:47:16', '2020-06-20 16:00:25', NULL, '');
INSERT INTO `menu_items` VALUES (33, 1, 'Testimonials', '', '_self', 'voyager-star', NULL, NULL, 12, '2020-06-18 15:28:07', '2020-07-25 15:39:09', 'voyager.testimonials.index', NULL);
INSERT INTO `menu_items` VALUES (35, 2, 'About', '/about', '_self', NULL, '#000000', NULL, 3, '2020-06-18 15:32:03', '2021-03-03 18:47:01', NULL, '');
INSERT INTO `menu_items` VALUES (37, 1, 'Members', '', '_self', 'voyager-people', NULL, NULL, 13, '2020-06-18 15:40:58', '2020-07-25 15:39:09', 'voyager.members.index', NULL);
INSERT INTO `menu_items` VALUES (38, 1, 'Brands', '', '_self', 'voyager-tag', NULL, NULL, 14, '2020-06-20 05:07:57', '2020-07-25 15:39:09', 'voyager.brands.index', NULL);
INSERT INTO `menu_items` VALUES (39, 3, 'Terms of Service', '#', '_self', NULL, '#000000', NULL, 3, '2020-06-20 16:00:21', '2020-06-20 16:00:25', NULL, '');
INSERT INTO `menu_items` VALUES (40, 1, 'Products', '', '_self', 'voyager-bag', NULL, NULL, 8, '2020-06-24 16:19:27', '2020-07-25 15:38:55', 'voyager.products.index', NULL);
INSERT INTO `menu_items` VALUES (41, 1, 'Coupons', '', '_self', 'voyager-dollar', NULL, NULL, 11, '2020-06-26 08:53:11', '2020-07-25 15:39:09', 'voyager.coupons.index', NULL);
INSERT INTO `menu_items` VALUES (42, 1, 'Orders', '', '_self', 'voyager-bag', '#000000', NULL, 9, '2020-06-27 08:37:05', '2020-07-25 15:38:59', 'voyager.orders.index', 'null');
INSERT INTO `menu_items` VALUES (43, 1, 'Customers', '', '_self', 'voyager-people', NULL, NULL, 10, '2020-06-30 05:29:08', '2020-07-25 15:39:09', 'voyager.customers.index', NULL);
INSERT INTO `menu_items` VALUES (44, 1, 'Reviews', '', '_self', 'voyager-star', NULL, NULL, 15, '2020-07-01 10:43:57', '2020-07-25 15:38:56', 'voyager.reviews.index', NULL);
INSERT INTO `menu_items` VALUES (45, 1, 'Currencies', '', '_self', 'voyager-credit-cards', NULL, NULL, 16, '2020-07-01 15:55:45', '2020-07-25 15:38:56', 'voyager.currencies.index', NULL);
INSERT INTO `menu_items` VALUES (46, 2, 'Shop', '/shop', '_self', NULL, '#000000', NULL, 2, '2020-07-05 07:09:14', '2021-03-03 18:47:01', NULL, '');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menus_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'admin', '2020-04-28 09:48:42', '2020-04-28 09:48:42');
INSERT INTO `menus` VALUES (2, 'header_menu', '2020-05-01 11:23:13', '2020-05-01 11:23:13');
INSERT INTO `menus` VALUES (3, 'footer_menu', '2020-05-01 11:23:26', '2020-05-01 11:23:26');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_01_000000_add_voyager_user_fields', 1);
INSERT INTO `migrations` VALUES (4, '2016_01_01_000000_create_data_types_table', 1);
INSERT INTO `migrations` VALUES (5, '2016_01_01_000000_create_pages_table', 1);
INSERT INTO `migrations` VALUES (6, '2016_01_01_000000_create_posts_table', 1);
INSERT INTO `migrations` VALUES (7, '2016_05_19_173453_create_menu_table', 1);
INSERT INTO `migrations` VALUES (8, '2016_10_21_190000_create_roles_table', 1);
INSERT INTO `migrations` VALUES (9, '2016_10_21_190000_create_settings_table', 1);
INSERT INTO `migrations` VALUES (10, '2016_11_30_135954_create_permission_table', 1);
INSERT INTO `migrations` VALUES (11, '2016_11_30_141208_create_permission_role_table', 1);
INSERT INTO `migrations` VALUES (12, '2016_12_26_201236_data_types__add__server_side', 1);
INSERT INTO `migrations` VALUES (13, '2017_01_13_000000_add_route_to_menu_items_table', 1);
INSERT INTO `migrations` VALUES (14, '2017_01_14_005015_create_translations_table', 1);
INSERT INTO `migrations` VALUES (15, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1);
INSERT INTO `migrations` VALUES (16, '2017_03_06_000000_add_controller_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (17, '2017_04_11_000000_alter_post_nullable_fields_table', 1);
INSERT INTO `migrations` VALUES (18, '2017_04_21_000000_add_order_to_data_rows_table', 1);
INSERT INTO `migrations` VALUES (19, '2017_07_05_210000_add_policyname_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (20, '2017_08_05_000000_add_group_to_settings_table', 1);
INSERT INTO `migrations` VALUES (21, '2017_11_26_013050_add_user_role_relationship', 1);
INSERT INTO `migrations` VALUES (22, '2017_11_26_015000_create_user_roles_table', 1);
INSERT INTO `migrations` VALUES (23, '2018_03_11_000000_add_user_settings', 1);
INSERT INTO `migrations` VALUES (24, '2018_03_14_000000_add_details_to_data_types_table', 1);
INSERT INTO `migrations` VALUES (25, '2018_03_16_000000_make_settings_value_nullable', 1);
INSERT INTO `migrations` VALUES (26, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (27, '2020_06_21_043650_create_brands_table', 1);
INSERT INTO `migrations` VALUES (28, '2020_06_21_043650_create_members_table', 1);
INSERT INTO `migrations` VALUES (29, '2020_06_21_043650_create_testimonials_table', 1);
INSERT INTO `migrations` VALUES (30, '2020_07_05_081839_create_coupons_table', 1);
INSERT INTO `migrations` VALUES (31, '2020_07_05_081839_create_currencies_table', 1);
INSERT INTO `migrations` VALUES (32, '2020_07_05_081839_create_reviews_table', 1);
INSERT INTO `migrations` VALUES (33, '2020_07_26_090339_create_categories_table', 1);
INSERT INTO `migrations` VALUES (34, '2020_07_26_090339_create_customers_table', 1);
INSERT INTO `migrations` VALUES (35, '2020_07_26_090339_create_orders_table', 1);
INSERT INTO `migrations` VALUES (36, '2020_07_26_090339_create_products_table', 1);
INSERT INTO `migrations` VALUES (37, '2020_07_26_090341_add_foreign_keys_to_categories_table', 1);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `invoice_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `billing_name` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `billing_email` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `billing_phone` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `billing_address` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `billing_city` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `billing_state` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `billing_zip` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_city` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_state` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_zip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `ordered_items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `payment_method` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `pp_invoice_id` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `total_amount` double NULL DEFAULT NULL,
  `conditions` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `discount` double NULL DEFAULT NULL,
  `discounted_subtotal` double NULL DEFAULT NULL,
  `billing_country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `shipping_country` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, '0001', 'Admin', 'admin@admin.com', '3123123213', '32133213213', 'dsadasd', '11212', '12121', NULL, NULL, NULL, NULL, 'processing', 'TzozMjoiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbGxlY3Rpb24iOjE6e3M6ODoiACoAaXRlbXMiO2E6MTp7aToxO086MzI6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1Db2xsZWN0aW9uIjoyOntzOjk6IgAqAGNvbmZpZyI7YTo2OntzOjE0OiJmb3JtYXRfbnVtYmVycyI7YjowO3M6ODoiZGVjaW1hbHMiO2k6MDtzOjk6ImRlY19wb2ludCI7czoxOiIuIjtzOjEzOiJ0aG91c2FuZHNfc2VwIjtzOjE6IiwiO3M6Nzoic3RvcmFnZSI7TjtzOjY6ImV2ZW50cyI7Tjt9czo4OiIAKgBpdGVtcyI7YTo3OntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjE2OiJKYW1lcyBIZWFkcGhvbmVzIjtzOjU6InByaWNlIjtkOjI1MDA7czo4OiJxdWFudGl0eSI7czoxOiIyIjtzOjEwOiJhdHRyaWJ1dGVzIjtPOjQxOiJEYXJyeWxkZWNvZGVcQ2FydFxJdGVtQXR0cmlidXRlQ29sbGVjdGlvbiI6MTp7czo4OiIAKgBpdGVtcyI7YTowOnt9fXM6MTA6ImNvbmRpdGlvbnMiO2E6MTp7aTowO086MzE6IkRhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24iOjI6e3M6Mzc6IgBEYXJyeWxkZWNvZGVcQ2FydFxDYXJ0Q29uZGl0aW9uAGFyZ3MiO2E6Mzp7czo0OiJuYW1lIjtzOjI1OiJKYW1lcyBIZWFkcGhvbmVzIGRpc2NvdW50IjtzOjQ6InR5cGUiO3M6MTY6InByb2R1Y3QgZGlzY291bnQiO3M6NToidmFsdWUiO3M6NDoiLTEwMCI7fXM6MTQ6InBhcnNlZFJhd1ZhbHVlIjtkOjEwMDt9fXM6MTU6ImFzc29jaWF0ZWRNb2RlbCI7czoxMToiQXBwXFByb2R1Y3QiO319fX0=', '2021-03-03 15:09:42', '2021-03-03 15:09:42', 'cod', NULL, 5545, 'Tzo0MToiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbmRpdGlvbkNvbGxlY3Rpb24iOjE6e3M6ODoiACoAaXRlbXMiO2E6Mjp7czozOiJWQVQiO086MzE6IkRhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24iOjI6e3M6Mzc6IgBEYXJyeWxkZWNvZGVcQ2FydFxDYXJ0Q29uZGl0aW9uAGFyZ3MiO2E6NTp7czo0OiJuYW1lIjtzOjM6IlZBVCI7czo0OiJ0eXBlIjtzOjM6InZhdCI7czo2OiJ0YXJnZXQiO3M6NToidG90YWwiO3M6NToidmFsdWUiO3M6NjoiMTUuMDAlIjtzOjU6Im9yZGVyIjtpOjE7fXM6MTQ6InBhcnNlZFJhd1ZhbHVlIjtkOjcyMDt9czo4OiJTaGlwcGluZyI7TzozMToiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbmRpdGlvbiI6Mjp7czozNzoiAERhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24AYXJncyI7YTo1OntzOjQ6Im5hbWUiO3M6ODoiU2hpcHBpbmciO3M6NDoidHlwZSI7czo4OiJzaGlwcGluZyI7czo2OiJ0YXJnZXQiO3M6NToidG90YWwiO3M6NToidmFsdWUiO3M6NToiMjUuMDAiO3M6NToib3JkZXIiO2k6Mjt9czoxNDoicGFyc2VkUmF3VmFsdWUiO2Q6MjU7fX19', 0, 4800, 'United States Minor Outlying Islands', NULL);
INSERT INTO `orders` VALUES (2, 1, '123', 'Admin', 'admin@admin.com', '213213213', 'asdasdasdasd', 'sadadas', 'sadasd', '213123', NULL, NULL, NULL, NULL, 'canceled', 'TzozMjoiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbGxlY3Rpb24iOjE6e3M6ODoiACoAaXRlbXMiO2E6MTp7aToxO086MzI6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1Db2xsZWN0aW9uIjoyOntzOjk6IgAqAGNvbmZpZyI7YTo2OntzOjE0OiJmb3JtYXRfbnVtYmVycyI7YjowO3M6ODoiZGVjaW1hbHMiO2k6MDtzOjk6ImRlY19wb2ludCI7czoxOiIuIjtzOjEzOiJ0aG91c2FuZHNfc2VwIjtzOjE6IiwiO3M6Nzoic3RvcmFnZSI7TjtzOjY6ImV2ZW50cyI7Tjt9czo4OiIAKgBpdGVtcyI7YTo3OntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjE2OiJKYW1lcyBIZWFkcGhvbmVzIjtzOjU6InByaWNlIjtkOjI1MDA7czo4OiJxdWFudGl0eSI7aToxO3M6MTA6ImF0dHJpYnV0ZXMiO086NDE6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1BdHRyaWJ1dGVDb2xsZWN0aW9uIjoxOntzOjg6IgAqAGl0ZW1zIjthOjA6e319czoxMDoiY29uZGl0aW9ucyI7YToxOntpOjA7TzozMToiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbmRpdGlvbiI6Mjp7czozNzoiAERhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24AYXJncyI7YTozOntzOjQ6Im5hbWUiO3M6MjU6IkphbWVzIEhlYWRwaG9uZXMgZGlzY291bnQiO3M6NDoidHlwZSI7czoxNjoicHJvZHVjdCBkaXNjb3VudCI7czo1OiJ2YWx1ZSI7czo0OiItMTAwIjt9czoxNDoicGFyc2VkUmF3VmFsdWUiO2Q6MTAwO319czoxNToiYXNzb2NpYXRlZE1vZGVsIjtzOjExOiJBcHBcUHJvZHVjdCI7fX19fQ==', '2021-03-03 19:18:00', '2021-03-03 20:21:11', 'cod', NULL, 2785, 'Tzo0MToiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbmRpdGlvbkNvbGxlY3Rpb24iOjE6e3M6ODoiACoAaXRlbXMiO2E6Mjp7czozOiJWQVQiO086MzE6IkRhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24iOjI6e3M6Mzc6IgBEYXJyeWxkZWNvZGVcQ2FydFxDYXJ0Q29uZGl0aW9uAGFyZ3MiO2E6NTp7czo0OiJuYW1lIjtzOjM6IlZBVCI7czo0OiJ0eXBlIjtzOjM6InZhdCI7czo2OiJ0YXJnZXQiO3M6NToidG90YWwiO3M6NToidmFsdWUiO3M6NjoiMTUuMDAlIjtzOjU6Im9yZGVyIjtpOjE7fXM6MTQ6InBhcnNlZFJhd1ZhbHVlIjtkOjM2MDt9czo4OiJTaGlwcGluZyI7TzozMToiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbmRpdGlvbiI6Mjp7czozNzoiAERhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24AYXJncyI7YTo1OntzOjQ6Im5hbWUiO3M6ODoiU2hpcHBpbmciO3M6NDoidHlwZSI7czo4OiJzaGlwcGluZyI7czo2OiJ0YXJnZXQiO3M6NToidG90YWwiO3M6NToidmFsdWUiO3M6NToiMjUuMDAiO3M6NToib3JkZXIiO2k6Mjt9czoxNDoicGFyc2VkUmF3VmFsdWUiO2Q6MjU7fX19', 0, 2400, 'Pakistan', NULL);
INSERT INTO `orders` VALUES (3, 1, '1231', 'Admin', 'admin@admin.com', '3213213', '123123', '321321', '3213', '2133', NULL, NULL, NULL, NULL, 'processing', 'TzozMjoiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbGxlY3Rpb24iOjE6e3M6ODoiACoAaXRlbXMiO2E6MTp7aToxO086MzI6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1Db2xsZWN0aW9uIjoyOntzOjk6IgAqAGNvbmZpZyI7YTo2OntzOjE0OiJmb3JtYXRfbnVtYmVycyI7YjowO3M6ODoiZGVjaW1hbHMiO2k6MDtzOjk6ImRlY19wb2ludCI7czoxOiIuIjtzOjEzOiJ0aG91c2FuZHNfc2VwIjtzOjE6IiwiO3M6Nzoic3RvcmFnZSI7TjtzOjY6ImV2ZW50cyI7Tjt9czo4OiIAKgBpdGVtcyI7YTo3OntzOjI6ImlkIjtpOjE7czo0OiJuYW1lIjtzOjE2OiJKYW1lcyBIZWFkcGhvbmVzIjtzOjU6InByaWNlIjtkOjI1MDA7czo4OiJxdWFudGl0eSI7czoxOiIxIjtzOjEwOiJhdHRyaWJ1dGVzIjtPOjQxOiJEYXJyeWxkZWNvZGVcQ2FydFxJdGVtQXR0cmlidXRlQ29sbGVjdGlvbiI6MTp7czo4OiIAKgBpdGVtcyI7YTowOnt9fXM6MTA6ImNvbmRpdGlvbnMiO2E6MTp7aTowO086MzE6IkRhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24iOjI6e3M6Mzc6IgBEYXJyeWxkZWNvZGVcQ2FydFxDYXJ0Q29uZGl0aW9uAGFyZ3MiO2E6Mzp7czo0OiJuYW1lIjtzOjI1OiJKYW1lcyBIZWFkcGhvbmVzIGRpc2NvdW50IjtzOjQ6InR5cGUiO3M6MTY6InByb2R1Y3QgZGlzY291bnQiO3M6NToidmFsdWUiO3M6NDoiLTEwMCI7fXM6MTQ6InBhcnNlZFJhd1ZhbHVlIjtkOjEwMDt9fXM6MTU6ImFzc29jaWF0ZWRNb2RlbCI7czoxMToiQXBwXFByb2R1Y3QiO319fX0=', '2021-03-03 19:56:00', '2021-03-03 20:20:32', 'cod', NULL, 2785, 'Tzo0MToiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbmRpdGlvbkNvbGxlY3Rpb24iOjE6e3M6ODoiACoAaXRlbXMiO2E6Mjp7czozOiJWQVQiO086MzE6IkRhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24iOjI6e3M6Mzc6IgBEYXJyeWxkZWNvZGVcQ2FydFxDYXJ0Q29uZGl0aW9uAGFyZ3MiO2E6NTp7czo0OiJuYW1lIjtzOjM6IlZBVCI7czo0OiJ0eXBlIjtzOjM6InZhdCI7czo2OiJ0YXJnZXQiO3M6NToidG90YWwiO3M6NToidmFsdWUiO3M6NjoiMTUuMDAlIjtzOjU6Im9yZGVyIjtpOjE7fXM6MTQ6InBhcnNlZFJhd1ZhbHVlIjtkOjM2MDt9czo4OiJTaGlwcGluZyI7TzozMToiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbmRpdGlvbiI6Mjp7czozNzoiAERhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24AYXJncyI7YTo1OntzOjQ6Im5hbWUiO3M6ODoiU2hpcHBpbmciO3M6NDoidHlwZSI7czo4OiJzaGlwcGluZyI7czo2OiJ0YXJnZXQiO3M6NToidG90YWwiO3M6NToidmFsdWUiO3M6NToiMjUuMDAiO3M6NToib3JkZXIiO2k6Mjt9czoxNDoicGFyc2VkUmF3VmFsdWUiO2Q6MjU7fX19', 0, 2400, 'Pakistan', NULL);
INSERT INTO `orders` VALUES (4, 2, '111', 'hamza', 'hamzashan123@gmail.com', '2133213123213213', '3213213', '3213213', '3213', '21321', NULL, NULL, NULL, NULL, 'complete', 'TzozMjoiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbGxlY3Rpb24iOjE6e3M6ODoiACoAaXRlbXMiO2E6MTp7aToyO086MzI6IkRhcnJ5bGRlY29kZVxDYXJ0XEl0ZW1Db2xsZWN0aW9uIjoyOntzOjk6IgAqAGNvbmZpZyI7YTo2OntzOjE0OiJmb3JtYXRfbnVtYmVycyI7YjowO3M6ODoiZGVjaW1hbHMiO2k6MDtzOjk6ImRlY19wb2ludCI7czoxOiIuIjtzOjEzOiJ0aG91c2FuZHNfc2VwIjtzOjE6IiwiO3M6Nzoic3RvcmFnZSI7TjtzOjY6ImV2ZW50cyI7Tjt9czo4OiIAKgBpdGVtcyI7YTo3OntzOjI6ImlkIjtpOjI7czo0OiJuYW1lIjtzOjEwOiJCbHVlIFNoaXJ0IjtzOjU6InByaWNlIjtkOjExMDA7czo4OiJxdWFudGl0eSI7czoxOiIxIjtzOjEwOiJhdHRyaWJ1dGVzIjtPOjQxOiJEYXJyeWxkZWNvZGVcQ2FydFxJdGVtQXR0cmlidXRlQ29sbGVjdGlvbiI6MTp7czo4OiIAKgBpdGVtcyI7YTowOnt9fXM6MTA6ImNvbmRpdGlvbnMiO2E6MTp7aTowO086MzE6IkRhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24iOjI6e3M6Mzc6IgBEYXJyeWxkZWNvZGVcQ2FydFxDYXJ0Q29uZGl0aW9uAGFyZ3MiO2E6Mzp7czo0OiJuYW1lIjtzOjE5OiJCbHVlIFNoaXJ0IGRpc2NvdW50IjtzOjQ6InR5cGUiO3M6MTY6InByb2R1Y3QgZGlzY291bnQiO3M6NToidmFsdWUiO3M6NDoiLTk1MCI7fXM6MTQ6InBhcnNlZFJhd1ZhbHVlIjtkOjk1MDt9fXM6MTU6ImFzc29jaWF0ZWRNb2RlbCI7czoxMToiQXBwXFByb2R1Y3QiO319fX0=', '2021-03-03 19:58:00', '2021-03-03 20:16:38', 'cod', NULL, 197.5, 'Tzo0MToiRGFycnlsZGVjb2RlXENhcnRcQ2FydENvbmRpdGlvbkNvbGxlY3Rpb24iOjE6e3M6ODoiACoAaXRlbXMiO2E6Mjp7czozOiJWQVQiO086MzE6IkRhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24iOjI6e3M6Mzc6IgBEYXJyeWxkZWNvZGVcQ2FydFxDYXJ0Q29uZGl0aW9uAGFyZ3MiO2E6NTp7czo0OiJuYW1lIjtzOjM6IlZBVCI7czo0OiJ0eXBlIjtzOjM6InZhdCI7czo2OiJ0YXJnZXQiO3M6NToidG90YWwiO3M6NToidmFsdWUiO3M6NjoiMTUuMDAlIjtzOjU6Im9yZGVyIjtpOjE7fXM6MTQ6InBhcnNlZFJhd1ZhbHVlIjtkOjIyLjU7fXM6ODoiU2hpcHBpbmciO086MzE6IkRhcnJ5bGRlY29kZVxDYXJ0XENhcnRDb25kaXRpb24iOjI6e3M6Mzc6IgBEYXJyeWxkZWNvZGVcQ2FydFxDYXJ0Q29uZGl0aW9uAGFyZ3MiO2E6NTp7czo0OiJuYW1lIjtzOjg6IlNoaXBwaW5nIjtzOjQ6InR5cGUiO3M6ODoic2hpcHBpbmciO3M6NjoidGFyZ2V0IjtzOjU6InRvdGFsIjtzOjU6InZhbHVlIjtzOjU6IjI1LjAwIjtzOjU6Im9yZGVyIjtpOjI7fXM6MTQ6InBhcnNlZFJhd1ZhbHVlIjtkOjI1O319fQ==', 0, 150, 'Pakistan', NULL);

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pages_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES (1, 1, 'Terms & Condition', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,', '<h2>1. Acceptance The Use Of Lorem Ipsum Terms and Conditions</h2>\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<p>&nbsp;</p>\n<h2>2. DETAILS</h2>\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<p>&nbsp;</p>\n<h2>3. LEGAL ADVICE</h2>\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<p>&nbsp;</p>\n<h2>4. CHANGE OF USE</h2>\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<h2>5. Links to Third Party apps and websites</h2>\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', NULL, 'terms-condition', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but', 'sss,sss,sss', 'ACTIVE', '2020-04-20 07:16:03', '2020-04-20 07:23:03');
INSERT INTO `pages` VALUES (2, 1, 'Privacy Policy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but', '<div>\n<h2>Data we use</h2>\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n</div>\n<div>\n<h2>How we use</h2>\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n</div>\n<p>&nbsp;</p>\n<div>\n<h2>What we collect</h2>\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\n</div>', NULL, 'privacy-policy', 'wwww eeee eeee', 'sss,sss,sss', 'ACTIVE', '2020-04-20 07:18:06', '2020-04-20 07:18:06');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role`  (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `permission_role_permission_id_index`(`permission_id`) USING BTREE,
  INDEX `permission_role_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES (1, 1);
INSERT INTO `permission_role` VALUES (1, 3);
INSERT INTO `permission_role` VALUES (2, 1);
INSERT INTO `permission_role` VALUES (3, 1);
INSERT INTO `permission_role` VALUES (4, 1);
INSERT INTO `permission_role` VALUES (5, 1);
INSERT INTO `permission_role` VALUES (6, 1);
INSERT INTO `permission_role` VALUES (6, 3);
INSERT INTO `permission_role` VALUES (7, 1);
INSERT INTO `permission_role` VALUES (7, 3);
INSERT INTO `permission_role` VALUES (8, 1);
INSERT INTO `permission_role` VALUES (9, 1);
INSERT INTO `permission_role` VALUES (10, 1);
INSERT INTO `permission_role` VALUES (11, 1);
INSERT INTO `permission_role` VALUES (11, 3);
INSERT INTO `permission_role` VALUES (12, 1);
INSERT INTO `permission_role` VALUES (12, 3);
INSERT INTO `permission_role` VALUES (13, 1);
INSERT INTO `permission_role` VALUES (14, 1);
INSERT INTO `permission_role` VALUES (15, 1);
INSERT INTO `permission_role` VALUES (16, 1);
INSERT INTO `permission_role` VALUES (16, 3);
INSERT INTO `permission_role` VALUES (17, 1);
INSERT INTO `permission_role` VALUES (17, 3);
INSERT INTO `permission_role` VALUES (18, 1);
INSERT INTO `permission_role` VALUES (19, 1);
INSERT INTO `permission_role` VALUES (20, 1);
INSERT INTO `permission_role` VALUES (21, 1);
INSERT INTO `permission_role` VALUES (21, 3);
INSERT INTO `permission_role` VALUES (22, 1);
INSERT INTO `permission_role` VALUES (22, 3);
INSERT INTO `permission_role` VALUES (23, 1);
INSERT INTO `permission_role` VALUES (24, 1);
INSERT INTO `permission_role` VALUES (25, 1);
INSERT INTO `permission_role` VALUES (26, 1);
INSERT INTO `permission_role` VALUES (26, 3);
INSERT INTO `permission_role` VALUES (27, 1);
INSERT INTO `permission_role` VALUES (27, 3);
INSERT INTO `permission_role` VALUES (28, 1);
INSERT INTO `permission_role` VALUES (29, 1);
INSERT INTO `permission_role` VALUES (30, 1);
INSERT INTO `permission_role` VALUES (31, 1);
INSERT INTO `permission_role` VALUES (31, 3);
INSERT INTO `permission_role` VALUES (32, 1);
INSERT INTO `permission_role` VALUES (32, 3);
INSERT INTO `permission_role` VALUES (33, 1);
INSERT INTO `permission_role` VALUES (34, 1);
INSERT INTO `permission_role` VALUES (35, 1);
INSERT INTO `permission_role` VALUES (36, 1);
INSERT INTO `permission_role` VALUES (36, 3);
INSERT INTO `permission_role` VALUES (37, 1);
INSERT INTO `permission_role` VALUES (37, 3);
INSERT INTO `permission_role` VALUES (38, 1);
INSERT INTO `permission_role` VALUES (39, 1);
INSERT INTO `permission_role` VALUES (40, 1);
INSERT INTO `permission_role` VALUES (87, 1);
INSERT INTO `permission_role` VALUES (87, 3);
INSERT INTO `permission_role` VALUES (88, 1);
INSERT INTO `permission_role` VALUES (88, 3);
INSERT INTO `permission_role` VALUES (89, 1);
INSERT INTO `permission_role` VALUES (90, 1);
INSERT INTO `permission_role` VALUES (91, 1);
INSERT INTO `permission_role` VALUES (97, 1);
INSERT INTO `permission_role` VALUES (97, 3);
INSERT INTO `permission_role` VALUES (98, 1);
INSERT INTO `permission_role` VALUES (98, 3);
INSERT INTO `permission_role` VALUES (99, 1);
INSERT INTO `permission_role` VALUES (100, 1);
INSERT INTO `permission_role` VALUES (101, 1);
INSERT INTO `permission_role` VALUES (102, 1);
INSERT INTO `permission_role` VALUES (102, 3);
INSERT INTO `permission_role` VALUES (103, 1);
INSERT INTO `permission_role` VALUES (103, 3);
INSERT INTO `permission_role` VALUES (104, 1);
INSERT INTO `permission_role` VALUES (105, 1);
INSERT INTO `permission_role` VALUES (106, 1);
INSERT INTO `permission_role` VALUES (107, 1);
INSERT INTO `permission_role` VALUES (107, 3);
INSERT INTO `permission_role` VALUES (108, 1);
INSERT INTO `permission_role` VALUES (108, 3);
INSERT INTO `permission_role` VALUES (109, 1);
INSERT INTO `permission_role` VALUES (110, 1);
INSERT INTO `permission_role` VALUES (111, 1);
INSERT INTO `permission_role` VALUES (112, 1);
INSERT INTO `permission_role` VALUES (112, 3);
INSERT INTO `permission_role` VALUES (113, 1);
INSERT INTO `permission_role` VALUES (113, 3);
INSERT INTO `permission_role` VALUES (114, 1);
INSERT INTO `permission_role` VALUES (115, 1);
INSERT INTO `permission_role` VALUES (116, 1);
INSERT INTO `permission_role` VALUES (117, 1);
INSERT INTO `permission_role` VALUES (117, 3);
INSERT INTO `permission_role` VALUES (118, 1);
INSERT INTO `permission_role` VALUES (118, 3);
INSERT INTO `permission_role` VALUES (119, 1);
INSERT INTO `permission_role` VALUES (120, 1);
INSERT INTO `permission_role` VALUES (121, 1);
INSERT INTO `permission_role` VALUES (122, 1);
INSERT INTO `permission_role` VALUES (122, 3);
INSERT INTO `permission_role` VALUES (123, 1);
INSERT INTO `permission_role` VALUES (123, 3);
INSERT INTO `permission_role` VALUES (124, 1);
INSERT INTO `permission_role` VALUES (125, 1);
INSERT INTO `permission_role` VALUES (126, 1);
INSERT INTO `permission_role` VALUES (127, 1);
INSERT INTO `permission_role` VALUES (127, 3);
INSERT INTO `permission_role` VALUES (128, 1);
INSERT INTO `permission_role` VALUES (128, 3);
INSERT INTO `permission_role` VALUES (129, 1);
INSERT INTO `permission_role` VALUES (130, 1);
INSERT INTO `permission_role` VALUES (131, 1);
INSERT INTO `permission_role` VALUES (132, 1);
INSERT INTO `permission_role` VALUES (132, 3);
INSERT INTO `permission_role` VALUES (133, 1);
INSERT INTO `permission_role` VALUES (133, 3);
INSERT INTO `permission_role` VALUES (134, 1);
INSERT INTO `permission_role` VALUES (135, 1);
INSERT INTO `permission_role` VALUES (136, 1);

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `permissions_key_index`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES (1, 'browse_admin', NULL, '2020-04-28 09:48:42', '2020-04-28 09:48:42');
INSERT INTO `permissions` VALUES (2, 'browse_bread', NULL, '2020-04-28 09:48:42', '2020-04-28 09:48:42');
INSERT INTO `permissions` VALUES (3, 'browse_database', NULL, '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (4, 'browse_media', NULL, '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (5, 'browse_compass', NULL, '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (6, 'browse_menus', 'menus', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (7, 'read_menus', 'menus', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (8, 'edit_menus', 'menus', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (9, 'add_menus', 'menus', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (10, 'delete_menus', 'menus', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (11, 'browse_roles', 'roles', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (12, 'read_roles', 'roles', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (13, 'edit_roles', 'roles', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (14, 'add_roles', 'roles', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (15, 'delete_roles', 'roles', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (16, 'browse_users', 'users', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (17, 'read_users', 'users', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (18, 'edit_users', 'users', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (19, 'add_users', 'users', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (20, 'delete_users', 'users', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (21, 'browse_settings', 'settings', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (22, 'read_settings', 'settings', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (23, 'edit_settings', 'settings', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (24, 'add_settings', 'settings', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (25, 'delete_settings', 'settings', '2020-04-28 09:48:43', '2020-04-28 09:48:43');
INSERT INTO `permissions` VALUES (26, 'browse_categories', 'categories', '2020-04-28 09:48:48', '2020-04-28 09:48:48');
INSERT INTO `permissions` VALUES (27, 'read_categories', 'categories', '2020-04-28 09:48:48', '2020-04-28 09:48:48');
INSERT INTO `permissions` VALUES (28, 'edit_categories', 'categories', '2020-04-28 09:48:48', '2020-04-28 09:48:48');
INSERT INTO `permissions` VALUES (29, 'add_categories', 'categories', '2020-04-28 09:48:49', '2020-04-28 09:48:49');
INSERT INTO `permissions` VALUES (30, 'delete_categories', 'categories', '2020-04-28 09:48:49', '2020-04-28 09:48:49');
INSERT INTO `permissions` VALUES (31, 'browse_posts', 'posts', '2020-04-28 09:48:49', '2020-04-28 09:48:49');
INSERT INTO `permissions` VALUES (32, 'read_posts', 'posts', '2020-04-28 09:48:49', '2020-04-28 09:48:49');
INSERT INTO `permissions` VALUES (33, 'edit_posts', 'posts', '2020-04-28 09:48:49', '2020-04-28 09:48:49');
INSERT INTO `permissions` VALUES (34, 'add_posts', 'posts', '2020-04-28 09:48:49', '2020-04-28 09:48:49');
INSERT INTO `permissions` VALUES (35, 'delete_posts', 'posts', '2020-04-28 09:48:50', '2020-04-28 09:48:50');
INSERT INTO `permissions` VALUES (36, 'browse_pages', 'pages', '2020-04-28 09:48:50', '2020-04-28 09:48:50');
INSERT INTO `permissions` VALUES (37, 'read_pages', 'pages', '2020-04-28 09:48:50', '2020-04-28 09:48:50');
INSERT INTO `permissions` VALUES (38, 'edit_pages', 'pages', '2020-04-28 09:48:50', '2020-04-28 09:48:50');
INSERT INTO `permissions` VALUES (39, 'add_pages', 'pages', '2020-04-28 09:48:50', '2020-04-28 09:48:50');
INSERT INTO `permissions` VALUES (40, 'delete_pages', 'pages', '2020-04-28 09:48:50', '2020-04-28 09:48:50');
INSERT INTO `permissions` VALUES (41, 'browse_hooks', NULL, '2020-04-28 09:48:52', '2020-04-28 09:48:52');
INSERT INTO `permissions` VALUES (87, 'browse_testimonials', 'testimonials', '2020-06-18 15:28:07', '2020-06-18 15:28:07');
INSERT INTO `permissions` VALUES (88, 'read_testimonials', 'testimonials', '2020-06-18 15:28:07', '2020-06-18 15:28:07');
INSERT INTO `permissions` VALUES (89, 'edit_testimonials', 'testimonials', '2020-06-18 15:28:07', '2020-06-18 15:28:07');
INSERT INTO `permissions` VALUES (90, 'add_testimonials', 'testimonials', '2020-06-18 15:28:07', '2020-06-18 15:28:07');
INSERT INTO `permissions` VALUES (91, 'delete_testimonials', 'testimonials', '2020-06-18 15:28:07', '2020-06-18 15:28:07');
INSERT INTO `permissions` VALUES (97, 'browse_members', 'members', '2020-06-18 15:40:58', '2020-06-18 15:40:58');
INSERT INTO `permissions` VALUES (98, 'read_members', 'members', '2020-06-18 15:40:58', '2020-06-18 15:40:58');
INSERT INTO `permissions` VALUES (99, 'edit_members', 'members', '2020-06-18 15:40:58', '2020-06-18 15:40:58');
INSERT INTO `permissions` VALUES (100, 'add_members', 'members', '2020-06-18 15:40:58', '2020-06-18 15:40:58');
INSERT INTO `permissions` VALUES (101, 'delete_members', 'members', '2020-06-18 15:40:58', '2020-06-18 15:40:58');
INSERT INTO `permissions` VALUES (102, 'browse_brands', 'brands', '2020-06-20 05:07:57', '2020-06-20 05:07:57');
INSERT INTO `permissions` VALUES (103, 'read_brands', 'brands', '2020-06-20 05:07:57', '2020-06-20 05:07:57');
INSERT INTO `permissions` VALUES (104, 'edit_brands', 'brands', '2020-06-20 05:07:57', '2020-06-20 05:07:57');
INSERT INTO `permissions` VALUES (105, 'add_brands', 'brands', '2020-06-20 05:07:57', '2020-06-20 05:07:57');
INSERT INTO `permissions` VALUES (106, 'delete_brands', 'brands', '2020-06-20 05:07:57', '2020-06-20 05:07:57');
INSERT INTO `permissions` VALUES (107, 'browse_products', 'products', '2020-06-24 16:19:27', '2020-06-24 16:19:27');
INSERT INTO `permissions` VALUES (108, 'read_products', 'products', '2020-06-24 16:19:27', '2020-06-24 16:19:27');
INSERT INTO `permissions` VALUES (109, 'edit_products', 'products', '2020-06-24 16:19:27', '2020-06-24 16:19:27');
INSERT INTO `permissions` VALUES (110, 'add_products', 'products', '2020-06-24 16:19:27', '2020-06-24 16:19:27');
INSERT INTO `permissions` VALUES (111, 'delete_products', 'products', '2020-06-24 16:19:27', '2020-06-24 16:19:27');
INSERT INTO `permissions` VALUES (112, 'browse_coupons', 'coupons', '2020-06-26 08:53:11', '2020-06-26 08:53:11');
INSERT INTO `permissions` VALUES (113, 'read_coupons', 'coupons', '2020-06-26 08:53:11', '2020-06-26 08:53:11');
INSERT INTO `permissions` VALUES (114, 'edit_coupons', 'coupons', '2020-06-26 08:53:11', '2020-06-26 08:53:11');
INSERT INTO `permissions` VALUES (115, 'add_coupons', 'coupons', '2020-06-26 08:53:11', '2020-06-26 08:53:11');
INSERT INTO `permissions` VALUES (116, 'delete_coupons', 'coupons', '2020-06-26 08:53:11', '2020-06-26 08:53:11');
INSERT INTO `permissions` VALUES (117, 'browse_orders', 'orders', '2020-06-27 08:37:05', '2020-06-27 08:37:05');
INSERT INTO `permissions` VALUES (118, 'read_orders', 'orders', '2020-06-27 08:37:05', '2020-06-27 08:37:05');
INSERT INTO `permissions` VALUES (119, 'edit_orders', 'orders', '2020-06-27 08:37:05', '2020-06-27 08:37:05');
INSERT INTO `permissions` VALUES (120, 'add_orders', 'orders', '2020-06-27 08:37:05', '2020-06-27 08:37:05');
INSERT INTO `permissions` VALUES (121, 'delete_orders', 'orders', '2020-06-27 08:37:05', '2020-06-27 08:37:05');
INSERT INTO `permissions` VALUES (122, 'browse_customers', 'customers', '2020-06-30 05:29:08', '2020-06-30 05:29:08');
INSERT INTO `permissions` VALUES (123, 'read_customers', 'customers', '2020-06-30 05:29:08', '2020-06-30 05:29:08');
INSERT INTO `permissions` VALUES (124, 'edit_customers', 'customers', '2020-06-30 05:29:08', '2020-06-30 05:29:08');
INSERT INTO `permissions` VALUES (125, 'add_customers', 'customers', '2020-06-30 05:29:08', '2020-06-30 05:29:08');
INSERT INTO `permissions` VALUES (126, 'delete_customers', 'customers', '2020-06-30 05:29:08', '2020-06-30 05:29:08');
INSERT INTO `permissions` VALUES (127, 'browse_reviews', 'reviews', '2020-07-01 10:43:57', '2020-07-01 10:43:57');
INSERT INTO `permissions` VALUES (128, 'read_reviews', 'reviews', '2020-07-01 10:43:57', '2020-07-01 10:43:57');
INSERT INTO `permissions` VALUES (129, 'edit_reviews', 'reviews', '2020-07-01 10:43:57', '2020-07-01 10:43:57');
INSERT INTO `permissions` VALUES (130, 'add_reviews', 'reviews', '2020-07-01 10:43:57', '2020-07-01 10:43:57');
INSERT INTO `permissions` VALUES (131, 'delete_reviews', 'reviews', '2020-07-01 10:43:57', '2020-07-01 10:43:57');
INSERT INTO `permissions` VALUES (132, 'browse_currencies', 'currencies', '2020-07-01 15:55:45', '2020-07-01 15:55:45');
INSERT INTO `permissions` VALUES (133, 'read_currencies', 'currencies', '2020-07-01 15:55:45', '2020-07-01 15:55:45');
INSERT INTO `permissions` VALUES (134, 'edit_currencies', 'currencies', '2020-07-01 15:55:45', '2020-07-01 15:55:45');
INSERT INTO `permissions` VALUES (135, 'add_currencies', 'currencies', '2020-07-01 15:55:45', '2020-07-01 15:55:45');
INSERT INTO `permissions` VALUES (136, 'delete_currencies', 'currencies', '2020-07-01 15:55:45', '2020-07-01 15:55:45');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `posts_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 1, 1, 'Test Post', 'dadsd', 'Eadasdj', '<p>dsadasd</p>', 'posts\\March2021\\ztrYf2Y04GH7ZuOvmMSg.jpg', 'test-post', 'adsadsaddsad', 'dasdasd', 'PUBLISHED', 1, '2021-03-03 20:19:12', '2021-03-03 20:19:12');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `slug` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `small_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `large_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `regular_price` double NULL DEFAULT NULL,
  `discounted_price` double NULL DEFAULT NULL,
  `sku` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `primary_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `other_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `featured` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Jeans Mens', 'jeans-mens', 2, 'This geans is for mens', '<div class=\"yuRUbf\" style=\"font-size: small; line-height: 1.58; color: #202124; font-family: arial, sans-serif;\">\r\n<h3 class=\"LC20lb DKV0Md\" style=\"font-size: 20px; font-weight: normal; margin: 0px 0px 3px; padding: 5px 0px 0px; display: inline-block; line-height: 1.3;\">Generator, Origins and Meaning</h3>\r\n<div class=\"TbwUpd NJjxre\" style=\"display: inline-block; padding-bottom: 2px; padding-top: 1px; text-size-adjust: none; position: absolute; left: 0px; top: 0px;\">&nbsp;</div>\r\n<div class=\"B6fmyf\" style=\"position: absolute; top: 0px; height: 0px; visibility: hidden; white-space: nowrap;\">\r\n<div class=\"TbwUpd\" style=\"display: inline-block; padding-bottom: 2px; padding-top: 1px; text-size-adjust: none;\">&nbsp;</div>\r\n<div class=\"eFM0qc\" style=\"display: inline-block; padding-bottom: 2px; padding-top: 1px; padding-left: 2px; visibility: visible;\">\r\n<div class=\"action-menu\" style=\"display: inline; margin: 1px 3px 0px; position: relative; user-select: none; vertical-align: middle;\"><a id=\"am-b1\" class=\"GHDvEf\" style=\"color: #1a0dab; text-decoration-line: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.1); display: inline-block; height: 12px; margin-top: 1px; user-select: none; width: 13px;\" role=\"button\" href=\"https://www.google.com/search?q=lorem+ipsum&amp;rlz=1C1CHBF_enPK849PK849&amp;oq=lorem+ipsum&amp;aqs=chrome..69i57.2959j0j1&amp;sourceid=chrome&amp;ie=UTF-8#\" aria-label=\"Result options\" aria-expanded=\"false\" aria-haspopup=\"true\" data-ved=\"2ahUKEwiz2_vH7ZTvAhUDilwKHX1wByAQ7B0wAXoECAEQBA\"></a>\r\n<ol class=\"action-menu-panel\" style=\"margin: 0px; padding: 0px; position: absolute; left: 0px; top: 12px; visibility: hidden; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid rgba(0, 0, 0, 0.2); font-size: 13px; z-index: 3; transition: opacity 0.218s ease 0s; box-shadow: rgba(0, 0, 0, 0.2) 0px 2px 4px; outline: 0px;\" tabindex=\"-1\" role=\"menu\" data-ved=\"2ahUKEwiz2_vH7ZTvAhUDilwKHX1wByAQqR8wAXoECAEQBQ\">\r\n<li class=\"action-menu-item\" style=\"margin: 0px; padding: 0px; list-style: none; cursor: pointer; user-select: none;\" role=\"menuitem\">&nbsp;</li>\r\n</ol>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"IsZvec\" style=\"max-width: 48em; color: #4d5156; line-height: 1.58; font-family: arial, sans-serif;\"><span class=\"aCOpRe\"><span style=\"font-weight: bold; color: #5f6368;\">Lorem ipsum</span>, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.</span></div>', 1500, 850, 'jeans', 4, '2021-03-03 15:07:00', '2021-03-03 19:56:53', 'products\\March2021\\sV62c9KkIGBfxQqixpnF.webp', '[\"products\\\\March2021\\\\NtO97Ig1fThVVuUim8vF.jpeg\"]', '0');
INSERT INTO `products` VALUES (2, 'Blue Shirt', 'blue-shirt', 1, 'This is blue shirt,', '<p>dasdsadsadsadsadsasasasasasasasasasasasasasasasasasasasasasasasasasasa</p>', 1100, 150, 'shirt', 1, '2021-03-03 19:33:00', '2021-03-03 20:37:21', 'products\\March2021\\vyjy5LXsK8bdnzcD0ju0.jpg', '[\"products\\\\March2021\\\\2I6G7mg3J5SOw800B8pm.jpg\"]', '0');

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `rating` double NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reviews
-- ----------------------------
INSERT INTO `reviews` VALUES (1, 1, 1, 3, 'Best shirt', '2021-03-03 18:53:04', '2021-03-03 18:53:04');
INSERT INTO `reviews` VALUES (2, 1, 1, 3, 'i will purchase again', '2021-03-03 18:53:25', '2021-03-03 18:53:25');
INSERT INTO `reviews` VALUES (3, 2, 1, 5, 'Brst', '2021-03-03 19:35:00', '2021-03-03 19:35:00');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'admin', 'Administrator', '2020-04-28 09:48:42', '2020-04-28 09:48:42');
INSERT INTO `roles` VALUES (2, 'user', 'Normal User', '2020-04-28 09:48:42', '2020-04-28 09:48:42');
INSERT INTO `roles` VALUES (3, 'Admin Admin', 'Admin Admin', '2020-04-29 08:29:05', '2020-04-29 08:29:05');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `settings_key_unique`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES (1, 'site.title', 'Site Title', 'TwinzBrother', '', 'text', 1, 'Site');
INSERT INTO `settings` VALUES (2, 'site.description', 'Site Description', 'This site is for the local shop for Men and Kids.', '', 'text', 2, 'Site');
INSERT INTO `settings` VALUES (3, 'site.logo', 'Site Logo', 'settings\\March2021\\qdh75reHK68B8rSyf9iz.jpg', '', 'image', 3, 'Site');
INSERT INTO `settings` VALUES (4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site');
INSERT INTO `settings` VALUES (5, 'admin.bg_image', 'Admin Background Image', 'settings\\March2021\\WUXlp4OE7PRzuD5KjnC1.jpg', '', 'image', 5, 'Admin');
INSERT INTO `settings` VALUES (6, 'admin.title', 'Admin Title', 'TwinzBrother', '', 'text', 1, 'Admin');
INSERT INTO `settings` VALUES (7, 'admin.description', 'Admin Description', 'Shop Scripts', '', 'text', 2, 'Admin');
INSERT INTO `settings` VALUES (8, 'admin.loader', 'Admin Loader', NULL, '', 'image', 3, 'Admin');
INSERT INTO `settings` VALUES (9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin');
INSERT INTO `settings` VALUES (10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');
INSERT INTO `settings` VALUES (11, 'social.facebook', 'Facebook', 'facebook.com', NULL, 'text', 6, 'Social');
INSERT INTO `settings` VALUES (13, 'social.youtube', 'Youtube', 'youtube.com', NULL, 'text', 8, 'Social');
INSERT INTO `settings` VALUES (21, 'home.about', 'about', '<p><span style=\"color: #6c757d; font-family: \'Open Sans\', Arial, sans-serif; font-size: 15px;\">Deserunt cupiditate error repudiandae doloribus est sit id ad repellendus voluptates molestiae ratione eaque, iure, odit culpa delectus harum asperiores ab a aut, molestias possimus! Tempore commodi iste soluta voluptatibus.&nbsp;</span><span style=\"color: #6c757d; font-family: \'Open Sans\', Arial, sans-serif; font-size: 15px;\">Deserunt cupiditate error repudiandae doloribus est sit id ad repellendus voluptates molestiae ratione eaque.</span></p>', NULL, 'rich_text_box', 16, 'Home');
INSERT INTO `settings` VALUES (28, 'home.hero_title', 'Hero Title', 'Finding Your Perfect Shoes', NULL, 'text', 24, 'Home');
INSERT INTO `settings` VALUES (29, 'home.hero_subtitle', 'Hero Small Title', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.', NULL, 'text', 25, 'Home');
INSERT INTO `settings` VALUES (30, 'home.about_image', 'About Image', 'settings\\March2021\\53noQYpnFhV85sFNWXhi.jpg', NULL, 'image', 17, 'Home');
INSERT INTO `settings` VALUES (31, 'contact.email', 'Email', 'hello@company.com', NULL, 'text', 26, 'Contact');
INSERT INTO `settings` VALUES (32, 'contact.phone', 'Phone', '+338-444-66', NULL, 'text', 27, 'Contact');
INSERT INTO `settings` VALUES (33, 'contact.location', 'Location', '28/C, New Jersey, USA', NULL, 'text', 28, 'Contact');
INSERT INTO `settings` VALUES (34, 'home.banner', 'banner', 'settings\\March2021\\73L7HRAWYIwNTWMS8YNu.jpg', NULL, 'image', 29, 'Home');
INSERT INTO `settings` VALUES (35, 'social.twitter', 'Twitter', NULL, NULL, 'text', 30, 'Social');
INSERT INTO `settings` VALUES (36, 'social.linkedin', 'LinkedIn', 'linkedin.com', NULL, 'text', 31, 'Social');
INSERT INTO `settings` VALUES (37, 'shop.vat', 'VAT (%)', '0', NULL, 'text', 32, 'Shop');
INSERT INTO `settings` VALUES (38, 'shop.shipping', 'Shipping', '50.00', NULL, 'text', 33, 'Shop');

-- ----------------------------
-- Table structure for testimonials
-- ----------------------------
DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE `testimonials`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `rating` double NULL DEFAULT NULL,
  `designation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of testimonials
-- ----------------------------
INSERT INTO `testimonials` VALUES (1, 'Test testimonial', 'Test', 4, 'Test Designation', '2021-03-03 15:04:39', '2021-03-03 15:04:39', 'testimonials\\March2021\\4K028yCb1af0aq7RvUj1.jpg', 'active');

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `translations_table_name_column_name_foreign_key_locale_unique`(`table_name`, `column_name`, `foreign_key`, `locale`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `user_roles_user_id_index`(`user_id`) USING BTREE,
  INDEX `user_roles_role_id_index`(`role_id`) USING BTREE,
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (2, 2);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'users/default.png',
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'Admin', 'admin@admin.com', 'users\\March2021\\zo1LhqW21OzjfRHcerCf.jpg', NULL, '$2y$10$zRweSzRMFvrAFeUT45rYF.Jh76epic4JMKSNWY/PUlBBUBPTR7t32', 'vGOXRkDtqclxOjqjLAFtCk5OuoSgLBVdhjbHqKZgNkoSVGMAJXB0FPJFuGUL', '{\"locale\":\"en\"}', '2021-03-03 11:42:48', '2021-03-03 12:10:27');
INSERT INTO `users` VALUES (2, 2, 'hamza', 'hamzashan123@gmail.com', 'users\\March2021\\OiCnslBoPMRDORHz7mGW.jpg', NULL, '$2y$10$zj26wD2Cmx1MTCKdTWfaMeta9NvBRNK9t75ZVDl2NBreEiHwRuP6i', NULL, '{\"locale\":\"en\"}', '2021-03-03 11:44:41', '2021-03-03 12:15:47');

SET FOREIGN_KEY_CHECKS = 1;
