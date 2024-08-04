/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : localhost:3306
 Source Schema         : petshop

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 22/03/2024 14:24:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `main_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_9c9614b2f9d01665800ea8dbff7`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `FK_9c9614b2f9d01665800ea8dbff7` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 'heheheh ', 'OK main', 'OK detail', 'type OK', '2023-10-20 10:18:21.473394', '2024-01-16 04:00:35.000000', '2024-01-16 04:00:35.000000', 1, '');
INSERT INTO `address` VALUES (3, 'heheheh ', 'OK main 1 ', 'OK detail 1', 'type OK', '2023-10-20 10:27:41.264392', '2024-01-16 04:00:40.000000', '2024-01-16 04:00:40.000000', 1, '');
INSERT INTO `address` VALUES (4, 'heheheh ', 'OK main 1 ', 'OK detail 1', 'type OK', '2023-10-20 10:28:14.994343', '2023-10-20 10:28:14.994343', NULL, 8, '');
INSERT INTO `address` VALUES (5, 'heheheh ', 'OK main 1 ', 'OK detail 1', 'type OK', '2023-10-20 10:28:20.793162', '2023-10-30 00:38:01.000000', '2023-10-30 00:38:01.000000', 9, '0999999999');
INSERT INTO `address` VALUES (6, 'Trinh Hoàng', 'Nga Thái - Nga Sơn - Thanh Hóa', 'xóm 5 - Hoàng Promax', 'home', '2023-10-20 14:14:20.097632', '2024-01-08 09:39:32.000000', NULL, 1, '396254427');
INSERT INTO `address` VALUES (7, 'Trần Thúy OK', 'Nga Tiến - Nga Sơn - Thanh Hóa', 'thôn 7 Thúy Promax', 'home', '2023-10-20 14:17:10.258609', '2024-01-26 04:03:32.000000', NULL, 1, '0348036857');
INSERT INTO `address` VALUES (8, 'Test => OK', 'Thanh Hóa', 'không cần biết OK hehe', 'home', '2023-10-20 14:19:27.087669', '2023-10-30 00:11:00.000000', NULL, 9, '0329219538');
INSERT INTO `address` VALUES (9, 'Trịnh Văn Hoàng', 'Hà Nội', 'không cần biết OK', 'office', '2023-10-20 14:21:47.790486', '2023-10-30 00:00:18.000000', NULL, 9, '0396254427');
INSERT INTO `address` VALUES (10, 'Nguyen Van A', 'Nga Thái - Nga Sơn - Thanh Hóa', 'Xóm  9', 'home', '2023-10-20 14:50:48.265443', '2024-01-26 04:04:05.000000', NULL, 1, '0987654321');
INSERT INTO `address` VALUES (11, 'thjdshfjhdsfdshf Testtttt', 'heheheheheh', 'hrhfdsjfdsghfsdfghfgds', 'home', '2023-10-20 14:58:34.458227', '2023-12-14 07:25:37.000000', '2023-12-14 07:25:37.000000', 1, '');
INSERT INTO `address` VALUES (12, 'Tesstttttttttt', 'fhdjghfdghhfgfhg', 'gfdjhgdfhgjfdghfhgj', 'office', '2023-10-20 15:48:08.091411', '2023-12-14 07:25:17.000000', '2023-12-14 07:25:17.000000', 1, '');
INSERT INTO `address` VALUES (13, 'Nguyen Thi B', 'Minh Khai - Bắc Từ Liêm - Hà Nội', 'Ngách 132/66', 'home', '2023-10-20 15:48:39.389233', '2024-01-26 04:05:02.000000', NULL, 1, '0987678999');
INSERT INTO `address` VALUES (14, 'Thuy Promax', 'Minh Khai - Bắc Từ Liêm - Hà Nội', 'Ngách 132/66', 'home', '2023-10-20 15:50:49.411858', '2024-01-26 04:07:18.000000', NULL, 1, '0987567888');
INSERT INTO `address` VALUES (15, 'Hoang Promax', 'Minh Khai - Bắc Từ Liêm - Hà Nội', 'ĐHCNHN', 'office', '2023-10-20 15:51:03.421664', '2024-01-26 04:05:43.000000', NULL, 1, '0396254427');
INSERT INTO `address` VALUES (16, 'Trịnh Hoàng', 'Nga Thái - Nga Sơn - Thanh Hóa', 'Xóm 5 - Hoàng Promax OK', 'home', '2023-10-20 16:14:56.873251', '2023-10-20 16:14:56.873251', NULL, 9, '0396254427');
INSERT INTO `address` VALUES (18, 'test 123', 'OK main', 'xóm 5 - Hoàng Promax', 'home', '2024-01-16 04:14:23.267799', '2024-01-16 04:14:38.000000', '2024-01-16 04:14:38.000000', 1, '11111111');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_a026be7ca12f8999cbdf96dec2`(`name` ASC) USING BTREE,
  UNIQUE INDEX `IDX_de87485f6489f5d0995f584195`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'hoangtrinh07super', 'hoang0702bmw@gmail.com', 'hoang@@0702Hehe', NULL, '2023-05-27 03:49:26.861112', '2023-05-27 03:49:26.861112', NULL);

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `preview_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blogs
-- ----------------------------
INSERT INTO `blogs` VALUES (1, 'helloo 11111', NULL, '2023-06-04 09:40:49.469432', '2023-06-04 09:48:10.000000', '2023-06-04 09:48:10.000000', '');
INSERT INTO `blogs` VALUES (2, 'hihihi', 'hehehehe 1111', '2023-06-04 15:23:33.517687', '2023-06-28 15:36:02.000000', '2023-06-28 15:36:02.000000', '');
INSERT INTO `blogs` VALUES (3, 'hihihi', 'hehehehe 1111 222', '2023-06-28 15:09:43.204025', '2023-06-28 15:47:46.000000', NULL, '');
INSERT INTO `blogs` VALUES (4, 'ok', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/p6_orig-1.png', '2023-08-09 14:51:08.325669', '2023-08-21 16:11:12.376201', NULL, '\r\n<p><span style={{color: \'#333\', fontSize: 16}}>Chế độ ăn cho chó con</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Chó con từ 2 tháng tuổi đến 6 tháng tuổi cho ăn 3 bữa một ngày, thời gian chia đều trong ngày cho hợp lý. Các bữa ăn cần có một khoảng thời gian nhất định để cho chó tiêu hóa hết thức ăn (Không nhất thiết người ăn lúc nào thì cho chó ăn lúc đó, sẽ không hợp lý về thời gian).</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Khẩu phần ăn uống phải đầy đủ chất dinh dưỡng, năng lượng: Protein,béo, tinh bột, khoáng chất và vitamin từ các thức ăn tự nhiên. Không nên lạm dụng thuốc, hoặc thức ăn tổng hợp. Rất lưu ý không cho ăn quá nhiều sữa, cá tanh, mỡ. Cụ thể thức ăn cho chó bao gồm: bột gạo, bột ngô, thịt băm nhỏ hoặc các lục phủ ngũ tạng của gia súc (trâu, bò, ngựa, hạn chế thịt lợn vì khó tiêu). Thức ăn đều phải nấu chín và loãng như cháo đừng cho ăn khô sẽ không tốt. Định lựơng bao nhiêu là tùy vào giống chó to hay nhỏ mà ước lượng vì không có cụ thể .</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Cho chó con ăn khoảng 3-4 bữa ngày, chỉ cho ăn gần no thì dừng. Không bao giờ cho chó ăn quá no. Có thể một tuần cho chó ăn một bữa ăn no hơn bình thường và ăn thêm một quả trứng gà nhưng phải nấu chín sau đó cho ăn tái dần cho đến khi có thể ăn sống không sao cả. Không để sẵn đồ ăn chó lúc nào thích ăn thì ăn.</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Nước uống sạch, luôn đầy đủ.&nbsp; Dụng cụ cho ăn: bát, đĩa… phải luôn rửa sạch sẽ, khô ráo và phải đảm bảo xối nước sạch hết độ kiềm sút&nbsp;(bazơ) của xà-phòng.</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Sau bữa ăn nên cho chó chạy tự do và vệ sinh 5 , 10 phút và cũng để tiêu hóa thức ăn . Bữa chiều tối ăn nhiều hơn một chút và chủ chó dành thời gian thả chó nhiều hơn .</span></p>\r\n   <p><em><span style={{color: \'#333\', fontSize: 16}}><u>Lưu ý khi cho chó ăn:</u></span></em></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Khi thấy chó có những biểu hiện khác thường: nôn, bỏ ăn, buồn dầu, tiêu chảy, nghi ốm, phải ngừng cho ăn, mời Bác sỹ Thú Y khám và tư vấn. Cho ăn cưỡng bức lúc này là cực kỳ nguy hiểm đối với chó.</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Không cho ăn thức ăn ôi thiu, thức ăn thừa của mèo, cám lợn, hoặc nước rác, phân người và động vật khác. Những mùi ”dễ sợ” với người thường sẽ nguy hiểm đối với chó con .Bạn hãy cẩn thận!</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Bữa ăn của chó thường kéo dài không quá 5 phút , nếu chó ăn hết sạch và còn hơi thòm thèm là đủ , sau khi ăn lập tức phải mang bát đi rửa ngay cho sạch sẽ . Nếu chó ăn xong mà còn thừa thức ăn , đem đổ đi và bữa sau phải giảm định lượng xuống cho phù hợp (một số người nuôi chó có thói quen hay để thừa thức ăn để khi nào đói chó tự ăn, như vậy là hại chó vì thức ăn thừa dễ ôi thiu chó sẽ bị đi ngoài rất dễ chết).</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Một số hành động chiều chó rất tốt cho chó yêu của bạn</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>– Sau khi đi dạo buổi tối có thể cho uống một ít sữa hoặc nước đường pha loãng. Bạn hãy chịu khó vuốt ve hay dắt cún đi dạo nhẹ nhàng, cún sẽ thân thiết hơn với bạn đấy!</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>– Chó con rất thích gặm, mài răng, rất hay cắn nát giày dép, đệm mút sa-lông không những hỏng đồ mà còn ăn nuốt gây độc và viêm tắc đường tiêu hóa. Bạn nên để chó tránh xa các thứ này. Hãy tìm mua trên thị trường những “cục xương giả, đồ chơi” giành riêng cho chó được các chuyên gia nghiên cứu và sản xuất. Hoặc bạn có thể dùng xương cẳng chân lợn đã luộc chín, bỏ tủy, ngâm nước vôi trong 10 ngày, phơi sấy khô, vô trùng cho chó gặm, mài răng.&nbsp;</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Chăm sóc sức khoẻ, phòng trừ dịch bệnh cho cún con</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>– Tiêm phòng dịch: Bạn nên nhờ Bác sỹ Thú y của bạn kiểm tra lại toàn bộ và tư vấn về quy trình tiêm phòng dịch riêng cho chó của bạn.”<em>Miễn dịch cơ bản</em>“(Primary Vaccination) là khái niệm cực kỳ quan trọng với chó non. Chó 3 tháng tuổi ít nhất phải đựơc tiêm phòng miễn dịch 2 lần đối với các bệnh: Care, Pavo, Lepto, Parainfluenza, Dại… Mọi lần tiêm phải có dán nhãn thuốc và ghi ngày tiêm và ký tên người tiêm trong “sổ sức khoẻ” của chó.&nbsp;</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>– Tẩy giun sán: Ít nhất 2 lần khi chó được 4 tháng tuổi trị các loại giun: đũa, giun móc… Nên cho uống thuốc phòng bệnh “giun tim” từ 4 tháng tuổi.&nbsp;</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Khi nào thì chó con trưởng thành?</span></p>\r\n   <p><span style={{color: \'#333\', fontSize: 16}}>Sau 5 tháng có thể bổ sung hàng tuần một ít thịt bò, ngựa sống nhưng phải thật tươi với cường độ từ ít đến nhiều sau này (đối với chó to, canh gác và làm nghiệp vụ).&nbsp; Đừng sợ chó bị đi ngoài khi cho ăn thịt sống, vì bản năng hoang dã chó vẫn ăn thị sống từ các con thú trong rừng, sau khi ở với người chó mới thuần hóa ăn các thức ăn khác của người. Còn đối với chó nhỏ dùng để làm cảnh thì bạn có thể cho ít thịt đã nấu chín</span></p>');
INSERT INTO `blogs` VALUES (5, 'ok2', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/banner-about001.jpg', '2023-08-09 15:02:20.111758', '2023-08-21 16:13:49.575878', NULL, '<p style={{ color: \'#333\', fontSize: 16 }}>\r\n                Tuổi thọ trung bình của mèo nếu sống trong nhà là 13 năm. Nhưng nếu mèo sống thả rông bên ngoài nhà thì\r\n                tuổi thọ bị giảm mất 3 năm so với mèo sống trong nhà. Vì khi sống bên ngoài, chúng thường gặp phải các\r\n                mối nguy hiểm hay bất lợi khác như môi trường ô nhiễm, có thể bị xe chẹt, bị chó hoặc các động vật hoang\r\n                dã hay lũ mèo “du côn” khác bắt nạt và tấn công. Tất cả các yếu tố trên đều tiềm ẩn những nguy cơ gây\r\n                bệnh và những rủi ro dẫn đến tử vong cho mèo.\r\n            </p>\r\n            <p style={{ color: \'#333\', fontSize: 16 }}>\r\n                <strong>Tiêm phòng thường xuyên và đều đặn</strong>\r\n            </p>\r\n            <p style={{ color: \'#333\', fontSize: 16 }}>\r\n                Tiêm phòng cho mèo là việc hết sức cần thiết giúp chúng khỏe mạnh, ít bệnh tật và phòng tránh lây bệnh\r\n                sang cho người nuôi lẫn người thân trong gia đình. Bạn có thể tiêm phòng cho mèo để tránh những bệnh như\r\n                suy giảm bạch cầu, viêm phổi do virus Herpes, dại, viêm mũi khí quản truyền nhiễm,.. Hãy tuân thủ nghiêm\r\n                ngặt lịch tiêm chủng cho mèo, đặc biệt là mèo trưởng thành.\r\n            </p>\r\n            <p style={{ color: \'#333\', fontSize: 16 }}>\r\n                <strong>Đảm bảo chế độ ăn uống</strong>\r\n            </p>\r\n            <p style={{ color: \'#333\', fontSize: 16 }}>\r\n                Với bất cứ một con người hay động vật đều cần phải có được một chế độ dinh dưỡng nhất định. Bạn nên lập\r\n                một chế độ ăn uống phù hợp cho mèo để đảm bảo chúng có đủ chất dinh dưỡng trong quá trình trưởng thành.\r\n                Nếu bạn không có nhiều thời gian thì nên chọn những thực phẩm chế biến sẵn đủ chất dinh dưỡng và chỉ cần\r\n                đến địa chỉ mua thức ăn cho mèo uy tín là có thể đảm bảo thể chất khỏe mạnh cho những “người bạn” của\r\n                mình. Những thực phẩm có chất lượng cao thường đắt, tuy nhiên, bạn lại có thể an tâm về hàm lượng\r\n                calories, đạm, xơ và chất béo mà chúng cung cấp. Không nên cho mèo ăn thịt cá ôi thiu, xương gà, socola,\r\n                đồ uống có cồn, rau thơm, nho khô, hạnh nhân, khoai tây…\r\n            </p>\r\n            <p style={{ color: \'#333\', fontSize: 16 }}>\r\n                Nếu chú mèo kén ăn, bạn nên bổ sung thêm thực phẩm như multivitamin hoặc canxi. Nếu mèo bị bong tróc da\r\n                hoặc lông xỉn màu, hãy bổ sung thêm vitamin, khoáng chất hoặc omega. Còn nếu mèo bị viêm khớp, hãy thử\r\n                bổ sung glucosamine, chondroitin thông qua các thực phẩm chức năng hoặc thuốc về xương khớp cho mèo.\r\n            </p>\r\n            <p style={{ color: \'#333\', fontSize: 16 }}>\r\n                <strong>Giữ vệ sinh răng miệng cho mèo</strong>\r\n            </p>\r\n            <p style={{ color: \'#333\', fontSize: 16 }}>\r\n                Khi mèo được 2 tuổi, chúng rất dễ mắc phải các vấn đề về răng miệng do thiếu vệ sinh răng miệng hoặc\r\n                kiểm tra thú y định kỳ. Bạn cần 1 bàn chải lông mềm để làm sạch răng cho mèo. Hãy bắt đầu cho mèo làm\r\n                quen với hương vị của kem đánh răng dành cho vật nuôi, sau đó chải dọc theo nướu răng hàm trên, rồi đánh\r\n                từ sau ra trước. Chỉ mất 30 giây là bạn có thể đánh răng xong cho mèo rồi. Nếu dành thời gian thường\r\n                xuyên chăm sóc răng cho mèo, bạn sẽ không phải trả một khoản tiền lớn để chữa các bệnh về răng miệng cho\r\n                mèo.\r\n            </p>\r\n            <p style={{ color: \'#333\', fontSize: 16 }}>\r\n                <strong>Cho mèo chơi đùa tự do</strong>\r\n            </p>\r\n            <p style={{ color: \'#333\', fontSize: 16 }}>\r\n                Chơi đùa hỗ trợ mèo con phát triển về thể chất và kỹ năng tương tác. Mèo sẽ thay đổi cách chơi khi chúng\r\n                lớn lên, và vào lúc chúng đạt 14 tuần tuổi, chúng chủ yếu chỉ thích đùa nghịch với các vật thể. Chúng sẽ\r\n                chú ý theo, vồ lấy, khều, cào và cắn. Đây đều là các kỹ năng săn mồi cơ bản của loài mèo.\r\n            </p>\r\n            <p style={{ color: \'#333\', fontSize: 16 }}>\r\n                Chơi đùa là cách mèo thỏa mãn bản năng săn mồi, giảm thiểu sự buồn chán, ngăn ngừa các hành vi xấu, đồng\r\n                thời cũng là cách để mèo giảm cân, tăng cường sức khỏe.\r\n            </p>\r\n            <p style={{ color: \'#333\', fontSize: 16 }}>\r\n                Hiện nay trên thị trường có rất nhiều đồ chơi cho mèo như banh dây, chuột bông, cây cào móng… Hãy ‘săn’\r\n                vài món đồ chơi đó hoặc cho mèo tự chơi với những thứ có sẵn xung quanh bạn như lông, quả bóng, cuộn\r\n                bông, những túi giấy (không có nhựa), hộp các – tông. Mèo sẽ vui chơi và không bao giờ biết chán. Bạn sẽ\r\n                ngạc nhiên và thích thú khi nhìn chúng chơi với đồ chơi.\r\n            </p>');
INSERT INTO `blogs` VALUES (6, 'de', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/https_2F2Fcdn.evbuc_.com2Fimages2F351569232F1585027677272F12Foriginal-300x150.jpg', '2023-08-09 15:04:45.958452', '2023-08-21 16:17:00.845912', NULL, '<ul style={{listStyle: \'none\', color: \"#333\", fontSize: 16}}>\r\n      <li >\r\n         <div >\r\n            <p><strong>Kinh nghiệm nuôi chó con:&nbsp;Chọn chó con khỏe mạnh để nuôi</strong></p>\r\n            <p>Mọi người khi đi mua chó cần lưu ý, chỉ nên mua&nbsp;chó con&nbsp;từ 2 đến 2,5 tháng tuổi trở nên, như vậy mới đảm bảo về thể lực tối thiểu khi ta chăm sóc. Tốt nhất mua chó của chủ nuôi có chó mẹ ở nhà đẻ, hoặc trực tiếp nhập về có nguồn gốc, lý lịch rõ ràng. Đó là những chú chó nhanh nhẹn, khoẻ mạnh, có “sổ sức khoẻ” đi kèm dán tem các loại vaccin phòng dịch, ngày tẩy giun sán.</p>\r\n            <pre><em>Hướng dẫn kinh nghiệm nuôi chó co</em></pre>\r\n         </div>\r\n      </li>\r\n      <li >\r\n         <div >2</div>\r\n         <div >\r\n            <p><strong>Kinh nghiệm nuôi chó con:&nbsp;Chuẩn bị chỗ ở kĩ lưỡng cho chó con</strong></p>\r\n            <p>Chỗ ở của chó con cần hoáng mát, ấm, có đủ ánh sáng nhất là có thể tắm nắng buổi sáng từ 9-11h. Chỗ ở của chó con phải có chỗ ngủ, vệ sinh cố định. Cất dọn những thứ chó con có thể gặm nhai, nuốt: đồ nhựa,sắt thủy tinh… đặc biệt tránh xa dây điện và các đồ dùng điện, bếp lửa ga, vật dụng cháy nổ, hóa chất và cây cỏ độc. Tránh để chó con ở vị trí cao: cửa sổ, ban công, cầu thang dễ rơi ngã.</p>\r\n            <p>Nếu nhà bạn đã có con vật khác: chó, mèo… Cẩn thận cho tiếp xúc, làm quen từ từ kẻo “ma cũ bắt nạt ma mới”, làm chó của bạn hoảng sợ hoặc bị tấn công, tai nạn và các stress tâm lý khác.</p>\r\n            <p>Không nên cho cún nằm điều hoà và nằm trước quạt vì như vậy cún rất dễ có khả năng bị nhiễm lạnh…</p>\r\n         </div>\r\n      </li>\r\n   </ul>\r\n   <ul >\r\n      <li >\r\n         <div >3</div>\r\n         <div >\r\n            <p><strong>Kinh nghiệm nuôi chó con:&nbsp;Tắm cho chó con thế nào mới đúng?</strong></p>\r\n            <p>Khi vừa mua cún về bạn không nên tắm cho cún bằng nước ngay, nếu thấy cún hôi có thể dung phấn tắm khô tắm. Vì nếu tắm ngay, cún rất dễ có khả năng bị viêm phổi và kế phát sang các bệnh truyền nhiễm nguy hiểm.</p>\r\n            <p>Những đêm đầu tiên xa mẹ, xa chủ cũ chó có thể kêu sủa. Bạn hãy âu yếm vuốt ve để chó yên giấc và cảm nhận được tình thương nhé!</p>\r\n            <p>Sau khi đã quen, bạn có thể tắm cho cún. Có thể tắm cho chó bằng nước ấm, nên dùng xà-phòng của chó phòng ngừa ve rận có bán ở các siêu thị. Sấy, lau khô ngay sau khi tắm. Không để nước vào tai chó. Nên dùng bông khô ngoáy sạch tai sau tắm tránh bệnh thối tai. (<em>Viêm tai giữa rất khó chữa</em>).</p>\r\n            <p><em><strong>Khi nào bạn không nên tắm cho cún?</strong></em></p>\r\n            <p>– Khi thời tiết quá lạnh, miền Bắc vào mùa đông những ngày lạnh giá, nhiệt độ xuống dưới 18 độ C.</p>\r\n            <p>– Chó non đang bú hoặc mới tách xa mẹ.</p>\r\n            <p>– Chó ốm hoặc có dấu hiệu bị ốm.</p>\r\n            <p>– Chó mới mua về nuôi.</p>\r\n            <pre><em>Hướng dẫn kinh nghiệm nuôi chó con: Lưu ý khi tắm cho chó</em></pre>\r\n         </div>\r\n      </li>\r\n   </ul>\r\n   <ul >\r\n      <li >\r\n         <div >4</div>\r\n         <div >\r\n            <p><strong>Kinh nghiệm nuôi chó con:&nbsp;Chế độ ăn cho chó con</strong></p>\r\n            <p>Chó con từ 2 tháng tuổi đến 6 tháng tuổi cho ăn 3 bữa một ngày, thời gian chia đều trong ngày cho hợp lý. Các bữa ăn cần có một khoảng thời gian nhất định để cho chó tiêu hóa hết thức ăn (Không nhất thiết người ăn lúc nào thì cho chó ăn lúc đó, sẽ không hợp lý về thời gian).</p>\r\n            <p>Khẩu phần ăn uống phải đầy đủ chất dinh dưỡng, năng lượng: Protein,béo, tinh bột, khoáng chất và vitamin từ các thức ăn tự nhiên. Không nên lạm dụng thuốc, hoặc thức ăn tổng hợp. Rất lưu ý không cho ăn quá nhiều sữa, cá tanh, mỡ. Cụ thể thức ăn cho chó bao gồm: bột gạo, bột ngô, thịt băm nhỏ hoặc các lục phủ ngũ tạng của gia súc (trâu, bò, ngựa, hạn chế thịt lợn vì khó tiêu). Thức ăn đều phải nấu chín và loãng như cháo đừng cho ăn khô sẽ không tốt. Định lựơng bao nhiêu là tùy vào giống chó to hay nhỏ mà ước lượng vì không có cụ thể .</p>\r\n            <p>Cho chó con ăn khoảng 3-4 bữa ngày, chỉ cho ăn gần no thì dừng. Không bao giờ cho chó ăn quá no. Có thể một tuần cho chó ăn một bữa ăn no hơn bình thường và ăn thêm một quả trứng gà nhưng phải nấu chín sau đó cho ăn tái dần cho đến khi có thể ăn sống không sao cả. Không để sẵn đồ ăn chó lúc nào thích ăn thì ăn.</p>\r\n            <p>Nước uống sạch, luôn đầy đủ.&nbsp; Dụng cụ cho ăn: bát, đĩa… phải luôn rửa sạch sẽ, khô ráo và phải đảm bảo xối nước sạch hết độ kiềm sút&nbsp;(bazơ) của xà-phòng.</p>\r\n            <p>Sau bữa ăn nên cho chó chạy tự do và vệ sinh 5 , 10 phút và cũng để tiêu hóa thức ăn . Bữa chiều tối ăn nhiều hơn một chút và chủ chó dành thời gian thả chó nhiều hơn&nbsp;</p>\r\n         </div>\r\n      </li>\r\n   </ul>');

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL DEFAULT 1,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_5a9dade7a4baafc128f8e0d8041`(`customer_id` ASC) USING BTREE,
  INDEX `FK_7d0e145ebd287c1565f15114a18`(`product_id` ASC) USING BTREE,
  CONSTRAINT `FK_5a9dade7a4baafc128f8e0d8041` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_7d0e145ebd287c1565f15114a18` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (1, 1, '2023-05-29 16:34:56.654761', '2023-08-29 02:24:50.964243', NULL, 15, 1);
INSERT INTO `carts` VALUES (2, 1, '2023-05-29 18:04:57.939828', '2023-05-29 18:04:57.939828', NULL, 1, 3);
INSERT INTO `carts` VALUES (4, 10, '2023-05-31 15:39:27.146944', '2023-05-31 15:39:27.146944', NULL, 1, 1);
INSERT INTO `carts` VALUES (5, 10, '2023-06-25 16:25:36.260930', '2023-06-25 16:25:36.260930', NULL, 1, 13);
INSERT INTO `carts` VALUES (10, 10, '2023-06-26 13:46:37.141018', '2023-06-26 13:46:37.141018', NULL, 1, 14);
INSERT INTO `carts` VALUES (11, 10, '2023-06-26 13:47:14.478584', '2023-06-28 12:42:11.000000', '2023-06-28 12:42:11.000000', 1, 14);
INSERT INTO `carts` VALUES (13, 1, '2023-08-25 17:24:32.183579', '2023-08-25 17:24:32.183579', NULL, 12, 38);
INSERT INTO `carts` VALUES (14, 1, '2023-08-26 07:08:45.538721', '2023-08-26 07:08:45.538721', NULL, 12, 36);
INSERT INTO `carts` VALUES (15, 1, '2023-08-26 07:08:50.841189', '2023-08-26 07:08:50.841189', NULL, 12, 36);
INSERT INTO `carts` VALUES (16, 1, '2023-08-26 07:09:16.723615', '2023-08-26 07:09:16.723615', NULL, 12, 36);
INSERT INTO `carts` VALUES (17, 1, '2023-08-26 07:12:06.176447', '2023-08-26 07:12:06.176447', NULL, 12, 50);
INSERT INTO `carts` VALUES (18, 1, '2023-08-26 07:34:46.996990', '2023-08-26 07:34:46.996990', NULL, 12, 50);
INSERT INTO `carts` VALUES (19, 1, '2023-08-26 07:36:02.794881', '2023-08-26 07:36:02.794881', NULL, 12, 50);
INSERT INTO `carts` VALUES (20, 1, '2023-08-26 07:45:58.346810', '2023-08-26 07:45:58.346810', NULL, 12, 58);
INSERT INTO `carts` VALUES (21, 1, '2023-08-26 07:46:10.788650', '2023-08-26 07:46:10.788650', NULL, 12, 52);
INSERT INTO `carts` VALUES (22, 1, '2023-08-26 07:53:02.705256', '2023-08-26 07:53:02.705256', NULL, 12, 47);
INSERT INTO `carts` VALUES (23, 1, '2023-08-26 07:53:24.120157', '2023-08-26 07:53:24.120157', NULL, 12, 40);
INSERT INTO `carts` VALUES (24, 1, '2023-08-26 07:53:35.803687', '2023-08-26 07:53:35.803687', NULL, 12, 46);
INSERT INTO `carts` VALUES (25, 1, '2023-08-26 07:53:41.036243', '2023-08-26 07:53:41.036243', NULL, 12, 45);
INSERT INTO `carts` VALUES (26, 9, '2023-08-26 07:54:18.329233', '2023-08-26 07:54:18.329233', NULL, 12, 43);
INSERT INTO `carts` VALUES (27, 1, '2023-08-27 09:35:41.144318', '2023-08-27 09:35:41.144318', NULL, 12, 59);
INSERT INTO `carts` VALUES (28, 1, '2023-08-27 09:40:23.445751', '2023-08-27 09:40:23.445751', NULL, 12, 56);
INSERT INTO `carts` VALUES (29, 1, '2023-08-27 16:15:03.648775', '2023-08-27 16:15:03.648775', NULL, 12, 54);
INSERT INTO `carts` VALUES (30, 1, '2023-08-27 16:35:54.149962', '2023-08-27 16:35:54.149962', NULL, 12, 57);
INSERT INTO `carts` VALUES (31, 1, '2023-08-28 15:03:19.897894', '2023-08-28 15:03:19.897894', NULL, 12, 48);
INSERT INTO `carts` VALUES (32, 1, '2023-09-07 15:01:02.821359', '2023-09-07 15:01:02.821359', NULL, 1, 37);
INSERT INTO `carts` VALUES (33, 1, '2023-09-07 15:01:07.079421', '2023-09-07 15:01:07.079421', NULL, 1, 37);
INSERT INTO `carts` VALUES (34, 1, '2023-09-07 15:04:30.714269', '2023-09-07 15:04:30.714269', NULL, 1, 37);
INSERT INTO `carts` VALUES (35, 1, '2023-09-07 15:08:26.455372', '2023-09-07 15:08:26.455372', NULL, 1, 37);
INSERT INTO `carts` VALUES (36, 1, '2023-09-07 15:10:25.787671', '2023-09-07 15:10:25.787671', NULL, 1, 37);
INSERT INTO `carts` VALUES (37, 1, '2023-09-07 15:12:04.942437', '2023-09-07 15:12:04.942437', NULL, 1, 37);
INSERT INTO `carts` VALUES (38, 1, '2023-09-07 15:45:03.643351', '2023-09-07 15:45:03.643351', NULL, 1, 36);
INSERT INTO `carts` VALUES (39, 1, '2023-09-07 15:45:16.476016', '2023-09-07 15:45:16.476016', NULL, 1, 43);
INSERT INTO `carts` VALUES (40, 1, '2023-09-10 14:26:46.408215', '2023-09-10 14:26:46.408215', NULL, 1, 46);
INSERT INTO `carts` VALUES (41, 1, '2023-09-10 16:42:37.576978', '2023-09-10 16:42:37.576978', NULL, 1, 49);
INSERT INTO `carts` VALUES (42, 1, '2023-09-10 16:46:13.927774', '2023-09-10 16:46:13.927774', NULL, 1, 51);
INSERT INTO `carts` VALUES (43, 1, '2023-09-10 16:48:59.193086', '2023-09-10 16:48:59.193086', NULL, 1, 54);
INSERT INTO `carts` VALUES (44, 1, '2023-09-10 16:51:07.640305', '2023-09-10 16:51:07.640305', NULL, 1, 52);
INSERT INTO `carts` VALUES (45, 1, '2023-09-10 16:54:17.277367', '2023-09-10 16:54:17.277367', NULL, 1, 42);
INSERT INTO `carts` VALUES (46, 1, '2023-09-10 16:55:39.269949', '2023-09-10 16:55:39.269949', NULL, 1, 40);
INSERT INTO `carts` VALUES (47, 1, '2023-09-14 16:14:49.097683', '2023-09-14 16:14:49.097683', NULL, 1, 59);
INSERT INTO `carts` VALUES (48, 1, '2023-09-14 16:16:07.280155', '2023-09-14 16:16:07.280155', NULL, 1, 55);
INSERT INTO `carts` VALUES (49, 1, '2023-09-14 16:23:19.646926', '2023-09-14 16:23:19.646926', NULL, 1, 57);
INSERT INTO `carts` VALUES (50, 1, '2023-09-14 16:26:22.037317', '2023-09-14 16:26:22.037317', NULL, 1, 58);
INSERT INTO `carts` VALUES (51, 1, '2023-09-14 16:42:00.129973', '2023-09-14 16:42:00.129973', NULL, 1, 50);
INSERT INTO `carts` VALUES (52, 1, '2023-09-14 16:44:32.879199', '2023-09-14 16:44:32.879199', NULL, 1, 48);
INSERT INTO `carts` VALUES (53, 1, '2023-09-14 16:44:43.917103', '2023-09-14 16:44:43.917103', NULL, 1, 47);
INSERT INTO `carts` VALUES (54, 1, '2023-09-14 16:46:06.981827', '2023-09-14 16:46:06.981827', NULL, 1, 41);
INSERT INTO `carts` VALUES (55, 1, '2023-09-14 16:46:56.422006', '2023-09-14 16:46:56.422006', NULL, 1, 39);
INSERT INTO `carts` VALUES (56, 1, '2023-09-14 16:47:55.768703', '2023-09-14 16:47:55.768703', NULL, 1, 56);
INSERT INTO `carts` VALUES (57, 1, '2023-09-14 16:48:13.109674', '2023-09-14 16:48:13.109674', NULL, 1, 44);
INSERT INTO `carts` VALUES (58, 1, '2023-09-14 16:49:31.638883', '2023-09-14 16:49:31.638883', NULL, 1, 38);
INSERT INTO `carts` VALUES (59, 1, '2023-09-14 16:49:44.614096', '2023-09-14 16:49:44.614096', NULL, 1, 53);
INSERT INTO `carts` VALUES (60, 1, '2023-10-06 06:49:50.327259', '2023-10-06 06:49:50.327259', NULL, 8, 36);
INSERT INTO `carts` VALUES (61, 1, '2023-10-06 07:02:03.184098', '2023-10-06 07:02:03.184098', NULL, 8, 47);
INSERT INTO `carts` VALUES (62, 1, '2023-10-06 07:10:15.066715', '2023-10-06 07:10:15.066715', NULL, 8, 54);
INSERT INTO `carts` VALUES (63, 1, '2023-10-06 07:17:08.262490', '2023-10-06 07:17:08.262490', NULL, 8, 46);
INSERT INTO `carts` VALUES (64, 1, '2023-10-06 07:19:56.132476', '2023-10-06 07:19:56.132476', NULL, 8, 48);
INSERT INTO `carts` VALUES (65, 1, '2023-10-06 07:21:29.071145', '2023-10-06 07:21:29.071145', NULL, 8, 50);
INSERT INTO `carts` VALUES (66, 5, '2023-10-06 07:25:53.297904', '2023-10-06 07:25:53.297904', NULL, 8, 58);
INSERT INTO `carts` VALUES (67, 2, '2024-01-18 06:57:22.429561', '2024-01-18 06:57:22.429561', NULL, 16, 47);
INSERT INTO `carts` VALUES (68, 1, '2024-01-18 07:00:01.397729', '2024-01-18 07:00:01.397729', NULL, 16, 45);
INSERT INTO `carts` VALUES (69, 1, '2024-01-18 07:51:08.971356', '2024-01-18 07:51:08.971356', NULL, 16, 43);
INSERT INTO `carts` VALUES (70, 1, '2024-01-18 15:02:35.706861', '2024-01-18 15:02:35.706861', NULL, 16, 49);
INSERT INTO `carts` VALUES (71, 1, '2024-03-01 10:24:54.775302', '2024-03-01 10:24:54.775302', NULL, 16, 40);

-- ----------------------------
-- Table structure for chats
-- ----------------------------
DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NULL DEFAULT NULL,
  `message_emit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `message_on` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `customer_` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_ec09bc2616849e329a7e4b44ffb`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `FK_ec09bc2616849e329a7e4b44ffb` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chats
-- ----------------------------

-- ----------------------------
-- Table structure for conversations
-- ----------------------------
DROP TABLE IF EXISTS `conversations`;
CREATE TABLE `conversations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `conversation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `conversation_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'personal',
  `createdByCustomer_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_9a77772be44fa1577f3ea9ad9d1`(`createdByCustomer_id` ASC) USING BTREE,
  CONSTRAINT `FK_9a77772be44fa1577f3ea9ad9d1` FOREIGN KEY (`createdByCustomer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of conversations
-- ----------------------------
INSERT INTO `conversations` VALUES (2, 'test', '2024-01-03 04:02:02.613377', '2024-01-03 04:02:02.613377', NULL, 'personal', 9);
INSERT INTO `conversations` VALUES (3, NULL, '2024-01-03 08:31:34.069490', '2024-01-03 08:31:34.069490', NULL, 'personal', 1);
INSERT INTO `conversations` VALUES (4, NULL, '2024-01-04 04:15:23.709070', '2024-01-04 04:15:23.709070', NULL, 'personal', 1);
INSERT INTO `conversations` VALUES (6, NULL, '2024-01-11 02:55:00.311265', '2024-01-11 02:55:00.311265', NULL, 'personal', 1);

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `birth_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `avatar_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 'Trịnh Văn Hoàng', 'hoangtrinh@gmail.com', '123', 'Đại học Công Nghiệp Hà Nội - Gà Công Nghiệp', '09999999999911', 'Male', '01/01/2002', 'http://localhost:3009/images/uploads/avt.jpg', '2023-05-27 03:49:39.114246', '2024-03-11 21:13:35.000000', NULL);
INSERT INTO `customers` VALUES (6, 'Trịnh Văn Hoàng 2 wwwwwwwwwwww', 'hoangtrinh2oangtrinh2wwwww@gmail.com', 'Anhemtao@@99', NULL, NULL, NULL, NULL, NULL, '2023-06-25 15:51:02.245288', '2023-06-28 14:37:48.000000', '2023-06-28 14:37:48.000000');
INSERT INTO `customers` VALUES (7, 'Trịnh Văn Hoàng 11', 'hoangtrinh11@gmail.com', 'Anhemtao@@9925', 'Đại học Công Nghiệp Hà Nội - Gà Công Nghiệp', '09999999999911', 'Male', '01/01/2002', 'https://hehehe.com', '2023-06-25 16:57:37.238342', '2023-10-17 15:51:57.000000', '2023-06-28 04:25:12.000000');
INSERT INTO `customers` VALUES (8, 'Trịnh Văn Hoàng tesst', 'hoangtrinh11test@gmail.com', 'Anhemtao@@9925', 'Đại học Công Nghiệp Hà Nội - Gà Công Nghiệp', '09999999999911', 'Male', NULL, 'http://localhost:3009/images/uploads/girlcute.jpg', '2023-06-26 13:45:31.887750', '2023-12-14 07:47:26.972869', NULL);
INSERT INTO `customers` VALUES (9, 'Trịnh Văn Hoàng fsdfdsf', 'hoangtrifsdfdfnh@gmail.com', 'awncut', 'Đại học Công Nghiệp Hà Nội - Gà Công Nghiệp', '09999999999911', 'Male', '01/01/2002', 'http://localhost:3009/images/uploads/ht.jpg', '2023-06-26 14:04:16.844618', '2023-11-01 21:13:06.000000', NULL);
INSERT INTO `customers` VALUES (10, 'Trịnh Văn Hoàng fsdfdsf ok ', 'hoangtrifsdfdfnhok@gmail.com', 'Anhemtao@@9925', NULL, NULL, NULL, NULL, NULL, '2023-06-26 14:29:41.390145', '2023-07-27 15:06:44.000000', '2023-07-27 15:06:44.000000');
INSERT INTO `customers` VALUES (11, 'Trịnh Văn Hoàng fsdfdsf ok', 'hoangtrifsdfdfnhok@gmail.com', 'Anhemtao@@9925', NULL, NULL, NULL, NULL, NULL, '2023-06-26 14:30:05.423047', '2023-06-28 12:39:06.000000', '2023-06-28 12:39:06.000000');
INSERT INTO `customers` VALUES (12, 'hello', 'haongtrinh@gmail.com', '123456@@', 'Đại học Công Nghiệp Hà Nội - Gà Công Nghiệp', '09999999', 'male', '07/02/2002', 'https://assets.tryhackme.com/img/modules/linux-fundamentals.png', '2023-07-27 15:50:22.082246', '2023-10-17 15:51:38.000000', NULL);
INSERT INTO `customers` VALUES (13, 'user test', 'email@gmail.com', '123456@', NULL, NULL, NULL, '09/09/2002', NULL, '2023-07-30 14:12:04.165238', '2023-07-30 14:29:50.000000', '2023-07-30 14:29:50.000000');
INSERT INTO `customers` VALUES (14, 'toi la user', 'user132@gmail.com', '132456', 'Đại học Công Nghiệp Hà Nội - Gà Công Nghiệp', '987654321', 'male', '01/01/2002', NULL, '2023-07-30 14:14:24.498444', '2024-01-31 07:25:47.746269', '2023-07-30 14:33:00.000000');
INSERT INTO `customers` VALUES (15, 'tesst user', 'aaaa@gmail.com', '123456', 'Đại học Công Nghiệp Hà Nội - Gà Công Nghiệp', NULL, 'male', NULL, NULL, '2023-07-30 14:25:50.418253', '2024-01-31 07:25:51.093984', '2023-07-30 14:28:47.000000');
INSERT INTO `customers` VALUES (16, 'kzCute', 'kz@gmail.com', '123', 'Ha Noi - Viet Nam', NULL, 'female', '20/04/2005', 'http://localhost:3009/images/uploads/kk_25.jpg', '2024-01-11 02:53:08.871744', '2024-02-29 21:29:14.000000', NULL);
INSERT INTO `customers` VALUES (17, 'kzCute111', 'kz@gmail.com', '123gfgfgfgf@@@', NULL, NULL, NULL, NULL, NULL, '2024-01-15 02:45:09.738674', '2024-01-15 02:45:09.738674', NULL);
INSERT INTO `customers` VALUES (18, 'sdfhdfdsg', 'kz@gmail.com', 'fhdgsf11233@@', NULL, NULL, NULL, NULL, NULL, '2024-01-15 02:54:13.222847', '2024-01-15 02:54:13.222847', NULL);
INSERT INTO `customers` VALUES (19, 'dadsdsds', 'kz@gmail.com', 'fsdfsdfsdfd111@', NULL, NULL, NULL, NULL, NULL, '2024-01-15 02:56:48.836196', '2024-01-15 02:56:48.836196', NULL);
INSERT INTO `customers` VALUES (20, 'dadsdsdssadsdsd', 'kz@gmail.com', 'fsdfsdfsdfd111@', NULL, NULL, NULL, NULL, NULL, '2024-01-15 02:57:49.604800', '2024-01-15 02:57:49.604800', NULL);
INSERT INTO `customers` VALUES (21, 'dadsdsdsfdfdfsfdfsfsfdsfsdfsd', 'kz@gmail.com', 'fsdfsdfsdfd111@', NULL, NULL, NULL, NULL, NULL, '2024-01-15 03:05:53.720116', '2024-01-15 03:05:53.720116', NULL);
INSERT INTO `customers` VALUES (22, 'dadsdsdsfdfdfsfdfsfsfdsfsdfsdsadsddsad', 'kz@gmail.com', 'fsdfsdfsdfd111@', NULL, NULL, NULL, NULL, NULL, '2024-01-15 03:07:57.831275', '2024-01-15 03:07:57.831275', NULL);
INSERT INTO `customers` VALUES (23, 'dadsdsdsfdfdfsfdfsfsfdsfsdfsdsadsddsadddsadsdsd', 'kz@gmail.com', 'fsdfsdfsdfd111@', NULL, NULL, NULL, NULL, NULL, '2024-01-15 03:09:16.616086', '2024-01-15 03:09:16.616086', NULL);
INSERT INTO `customers` VALUES (24, 'gggggOK', 'kz111@gmail.com', 'fsdfsdfsdfd111@', NULL, NULL, NULL, NULL, NULL, '2024-01-15 03:12:26.112381', '2024-01-15 03:12:26.112381', NULL);
INSERT INTO `customers` VALUES (25, 'BROKEN', 'brok@gmail.com', '123456@@Abc', NULL, NULL, NULL, NULL, NULL, '2024-01-15 03:15:07.079953', '2024-01-15 03:15:07.079953', NULL);
INSERT INTO `customers` VALUES (26, 'broZ', 'brozz@gmail.com', '123@@abcd', NULL, '0987654123', 'male', '03/03/2005', 'http://localhost:3009/images/uploads/catleg.png', '2024-01-15 03:22:43.957203', '2024-01-15 04:07:38.000000', NULL);

-- ----------------------------
-- Table structure for friendship
-- ----------------------------
DROP TABLE IF EXISTS `friendship`;
CREATE TABLE `friendship`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `customerInvite_id` int NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_eb4f591b46b7fd01759211318b4`(`customer_id` ASC) USING BTREE,
  INDEX `FK_a3e8a384afa8de4b3c8d794eade`(`customerInvite_id` ASC) USING BTREE,
  CONSTRAINT `FK_a3e8a384afa8de4b3c8d794eade` FOREIGN KEY (`customerInvite_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_eb4f591b46b7fd01759211318b4` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of friendship
-- ----------------------------
INSERT INTO `friendship` VALUES (1, 'friended', '2023-12-18 04:29:15.993890', '2024-01-02 02:53:45.000000', '2023-12-28 08:37:09.000000', 1, 8);
INSERT INTO `friendship` VALUES (2, 'waiting', '2023-12-18 04:39:18.995051', '2023-12-28 08:33:09.000000', '2023-12-28 08:33:09.000000', 1, 13);
INSERT INTO `friendship` VALUES (5, 'friended', '2023-12-18 06:49:06.534669', '2024-01-02 02:46:34.000000', '2024-01-02 02:45:18.000000', 1, 12);
INSERT INTO `friendship` VALUES (6, 'waiting', '2023-12-18 07:29:56.086189', '2023-12-28 08:33:09.000000', '2023-12-28 08:33:09.000000', 1, 10);
INSERT INTO `friendship` VALUES (7, 'friended', '2023-12-18 08:55:15.237095', '2024-01-02 02:46:34.000000', '2024-01-02 02:45:18.000000', 1, 12);
INSERT INTO `friendship` VALUES (8, 'friended', '2023-12-18 09:00:37.452850', '2024-01-02 02:46:34.000000', '2024-01-02 02:45:18.000000', 1, 12);
INSERT INTO `friendship` VALUES (9, 'friended', '2023-12-18 09:02:32.970498', '2024-01-02 02:46:34.000000', '2024-01-02 02:45:18.000000', 1, 12);
INSERT INTO `friendship` VALUES (10, 'friended', '2023-12-18 09:04:32.775620', '2024-01-02 02:46:34.000000', '2024-01-02 02:45:18.000000', 1, 12);
INSERT INTO `friendship` VALUES (11, 'friended', '2023-12-18 09:06:10.531102', '2024-01-02 02:46:34.000000', '2024-01-02 02:45:18.000000', 1, 12);
INSERT INTO `friendship` VALUES (12, 'friended', '2023-12-18 09:09:32.402799', '2024-01-02 02:46:34.000000', '2024-01-02 02:45:18.000000', 1, 12);
INSERT INTO `friendship` VALUES (13, 'friended', '2023-12-18 09:09:46.595781', '2024-01-02 02:46:34.000000', '2024-01-02 02:45:18.000000', 1, 12);
INSERT INTO `friendship` VALUES (14, 'friended', '2023-12-18 14:51:25.208036', '2024-01-02 02:29:02.000000', '2023-12-28 08:35:53.000000', 1, 9);
INSERT INTO `friendship` VALUES (15, 'friended', '2023-12-19 15:05:31.608864', '2024-01-02 02:29:02.000000', '2023-12-28 08:35:53.000000', 1, 9);
INSERT INTO `friendship` VALUES (16, 'friended', '2023-12-19 15:05:34.594359', '2024-01-02 02:53:45.000000', '2023-12-28 08:37:09.000000', 1, 8);
INSERT INTO `friendship` VALUES (17, 'friended', '2023-12-19 15:05:35.365586', '2024-01-02 02:46:34.000000', '2024-01-02 02:45:18.000000', 1, 12);
INSERT INTO `friendship` VALUES (18, 'waiting', '2023-12-26 02:39:28.979443', '2023-12-28 08:33:09.000000', '2023-12-28 08:33:09.000000', 8, 9);
INSERT INTO `friendship` VALUES (20, 'friended', '2023-12-28 08:35:41.378832', '2024-01-02 02:29:02.000000', '2023-12-28 08:35:53.000000', 1, 9);
INSERT INTO `friendship` VALUES (21, 'friended', '2023-12-28 08:35:43.911390', '2024-01-02 02:46:34.000000', '2024-01-02 02:45:18.000000', 1, 12);
INSERT INTO `friendship` VALUES (22, 'friended', '2023-12-28 08:36:46.730888', '2024-01-02 02:53:45.000000', '2023-12-28 08:37:09.000000', 1, 8);
INSERT INTO `friendship` VALUES (23, 'friended', '2023-12-28 08:36:48.195095', '2024-01-02 02:29:02.000000', NULL, 1, 9);
INSERT INTO `friendship` VALUES (24, 'friended', '2024-01-02 02:45:15.785369', '2024-01-02 02:46:34.000000', '2024-01-02 02:45:18.000000', 1, 12);
INSERT INTO `friendship` VALUES (25, 'friended', '2024-01-02 02:45:31.739941', '2024-01-02 02:46:34.000000', NULL, 1, 12);
INSERT INTO `friendship` VALUES (26, 'friended', '2024-01-02 02:45:53.550473', '2024-01-02 02:53:45.000000', NULL, 1, 8);
INSERT INTO `friendship` VALUES (27, 'waiting', '2024-01-11 02:54:10.073953', '2024-01-16 02:14:23.640094', NULL, 1, 16);

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `conversation_id` int NULL DEFAULT NULL,
  `sender_id` int NULL DEFAULT NULL,
  `receiver_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_3bc55a7c3f9ed54b520bb5cfe23`(`conversation_id` ASC) USING BTREE,
  INDEX `FK_22133395bd13b970ccd0c34ab22`(`sender_id` ASC) USING BTREE,
  INDEX `FK_b561864743d235f44e70addc1f5`(`receiver_id` ASC) USING BTREE,
  CONSTRAINT `FK_22133395bd13b970ccd0c34ab22` FOREIGN KEY (`sender_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_3bc55a7c3f9ed54b520bb5cfe23` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_b561864743d235f44e70addc1f5` FOREIGN KEY (`receiver_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messages
-- ----------------------------
INSERT INTO `messages` VALUES (1, 'hello conversation 3', '2024-01-04 09:04:46.695261', '2024-01-05 10:29:07.406664', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (2, 'hello conversation #2', '2024-01-04 09:06:17.294871', '2024-01-05 10:29:08.252974', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (3, 'hello conversation #3', '2024-01-04 09:06:23.929982', '2024-01-05 10:29:11.233223', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (4, 'hello conversation #4', '2024-01-08 02:08:35.719155', '2024-01-08 02:08:35.719155', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (5, 'hello test message', '2024-01-08 02:17:18.310012', '2024-01-08 02:17:18.310012', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (6, '???', '2024-01-08 02:21:49.388852', '2024-01-08 02:21:49.388852', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (7, 'tét OK', '2024-01-08 02:25:20.291972', '2024-01-08 02:25:20.291972', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (8, 'sub men', '2024-01-08 02:25:33.880149', '2024-01-08 02:25:33.880149', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (9, 'hehehe', '2024-01-08 02:25:36.713574', '2024-01-08 02:25:36.713574', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (10, 'sub', '2024-01-08 02:48:15.823694', '2024-01-08 02:48:15.823694', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (11, 'fsdfsdf', '2024-01-08 02:49:17.830156', '2024-01-08 02:49:17.830156', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (12, 'fsdfdsf', '2024-01-08 02:50:08.503426', '2024-01-08 02:50:08.503426', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (13, 'fsfd', '2024-01-08 02:51:26.147549', '2024-01-08 02:51:26.147549', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (14, 'fdsf', '2024-01-08 02:51:57.384852', '2024-01-08 02:51:57.384852', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (15, 'fffff', '2024-01-08 02:52:00.337439', '2024-01-08 02:52:00.337439', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (16, 'fsdf', '2024-01-08 02:52:05.363611', '2024-01-08 02:52:05.363611', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (17, 'fsdfsdfsdOOO', '2024-01-08 02:53:55.389815', '2024-01-08 02:53:55.389815', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (18, 'OK OK', '2024-01-08 02:55:42.991472', '2024-01-08 02:55:42.991472', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (19, 'HELLO OK', '2024-01-08 02:56:12.186391', '2024-01-08 02:56:12.186391', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (20, 'SAO EM', '2024-01-08 02:57:27.732383', '2024-01-08 02:57:27.732383', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (21, '???', '2024-01-08 02:57:36.539898', '2024-01-08 02:57:36.539898', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (22, 'TVH SENT', '2024-01-08 03:00:29.813701', '2024-01-08 03:00:29.813701', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (23, 'TVH OK OK', '2024-01-08 03:02:06.785634', '2024-01-08 03:02:06.785634', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (24, 'OK HELLO SENT', '2024-01-08 03:02:15.439001', '2024-01-08 03:02:15.439001', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (25, 'hello chao anh zai', '2024-01-08 03:04:04.669023', '2024-01-08 03:04:04.669023', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (26, 'TVH chao em zai', '2024-01-08 03:04:28.973016', '2024-01-08 03:04:28.973016', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (27, 'hello chao anh zai nhe', '2024-01-08 03:07:54.886207', '2024-01-08 03:07:54.886207', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (28, 'ok em zai hello', '2024-01-08 03:08:02.688802', '2024-01-08 03:08:02.688802', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (29, 'guts chops anh zai', '2024-01-08 03:08:15.965346', '2024-01-08 03:08:15.965346', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (30, 'hehehe', '2024-01-08 03:08:21.726053', '2024-01-08 03:08:21.726053', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (31, 'dhgshdsa', '2024-01-08 03:19:21.305690', '2024-01-08 03:19:21.305690', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (32, 'fsdfd', '2024-01-08 03:19:22.978838', '2024-01-08 03:19:22.978838', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (33, 'fsd', '2024-01-08 03:21:27.011983', '2024-01-08 03:21:27.011983', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (34, 'OK', '2024-01-08 03:22:43.675406', '2024-01-08 03:22:43.675406', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (35, 'hello cậu', '2024-01-08 09:14:35.160304', '2024-01-08 09:14:35.160304', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (36, 'bạn là ai HEHE', '2024-01-08 09:14:46.554939', '2024-01-08 09:14:46.554939', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (37, 'hello anh bạn', '2024-01-08 09:15:10.906549', '2024-01-08 09:15:10.906549', NULL, 4, 1, 8);
INSERT INTO `messages` VALUES (38, 'hello anh bạn', '2024-01-08 09:15:13.621174', '2024-01-08 09:15:13.621174', NULL, 4, 1, 8);
INSERT INTO `messages` VALUES (39, 'hí', '2024-01-08 09:16:07.805124', '2024-01-08 09:16:07.805124', NULL, 4, 1, 8);
INSERT INTO `messages` VALUES (40, 'sao thế ng anh em', '2024-01-08 09:17:28.954366', '2024-01-08 09:17:28.954366', NULL, 4, 8, 1);
INSERT INTO `messages` VALUES (41, 'bạn xinh quá', '2024-01-08 09:17:39.972381', '2024-01-08 09:17:39.972381', NULL, 4, 1, 8);
INSERT INTO `messages` VALUES (42, 'nma tớ có cu', '2024-01-08 09:17:51.309700', '2024-01-08 09:17:51.309700', NULL, 4, 8, 1);
INSERT INTO `messages` VALUES (43, 'vail, bye!', '2024-01-08 09:17:58.738442', '2024-01-08 09:17:58.738442', NULL, 4, 1, 8);
INSERT INTO `messages` VALUES (44, ':((((((((((((', '2024-01-08 09:18:05.460327', '2024-01-08 09:18:05.460327', NULL, 4, 8, 1);
INSERT INTO `messages` VALUES (45, 'hí cậu', '2024-01-08 09:42:15.814260', '2024-01-08 09:42:15.814260', NULL, 4, 1, 8);
INSERT INTO `messages` VALUES (46, 'hí cc', '2024-01-08 09:42:26.504492', '2024-01-08 09:42:26.504492', NULL, 4, 8, 1);
INSERT INTO `messages` VALUES (47, '😥😥', '2024-01-08 09:42:37.726537', '2024-01-08 09:42:37.726537', NULL, 4, 1, 8);
INSERT INTO `messages` VALUES (48, '😆😆😆', '2024-01-08 09:42:46.268018', '2024-01-08 09:42:46.268018', NULL, 4, 8, 1);
INSERT INTO `messages` VALUES (49, 'chào em', '2024-01-09 03:00:17.229544', '2024-01-09 03:00:17.229544', NULL, 4, 1, 8);
INSERT INTO `messages` VALUES (50, 'chào cc', '2024-01-09 03:00:26.139468', '2024-01-09 09:46:22.591932', NULL, 4, 8, 1);
INSERT INTO `messages` VALUES (51, '', '2024-01-09 09:47:53.032462', '2024-01-09 09:49:17.043280', NULL, 2, 9, 1);
INSERT INTO `messages` VALUES (52, '', '2024-01-11 02:55:00.352247', '2024-01-11 02:55:00.352247', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (53, 'hellooo em dep gai', '2024-01-11 02:56:53.032516', '2024-01-11 02:56:53.032516', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (54, 'em co ny roi anh zai', '2024-01-11 02:57:08.835997', '2024-01-11 02:57:08.835997', NULL, 6, 16, 1);
INSERT INTO `messages` VALUES (55, 'sad', '2024-01-11 02:57:14.091949', '2024-01-11 02:57:14.091949', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (56, 'test nhe hello', '2024-01-14 13:59:22.460092', '2024-01-14 13:59:22.460092', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (57, 'hello KZ', '2024-01-14 14:03:41.819354', '2024-01-14 14:03:41.819354', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (58, 'hello Hello', '2024-01-14 14:10:47.358712', '2024-01-14 14:10:47.358712', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (59, 'OK anh nhe', '2024-01-14 14:11:04.976763', '2024-01-14 14:11:04.976763', NULL, 6, 16, 1);
INSERT INTO `messages` VALUES (60, 'what', '2024-01-14 14:15:33.272112', '2024-01-14 14:15:33.272112', NULL, 4, 1, 8);
INSERT INTO `messages` VALUES (61, 'OK Hello nhe', '2024-01-14 14:17:05.091504', '2024-01-14 14:17:05.091504', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (62, 'hehehe', '2024-01-14 14:17:08.352632', '2024-01-14 14:17:08.352632', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (63, 'UKM em', '2024-01-14 14:18:50.284459', '2024-01-14 14:18:50.284459', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (64, 'OK anh', '2024-01-14 14:19:07.604627', '2024-01-14 14:19:07.604627', NULL, 3, 12, 1);
INSERT INTO `messages` VALUES (65, 'anh nhan roi em', '2024-01-14 14:25:04.483363', '2024-01-14 14:25:04.483363', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (66, 'tesst lai', '2024-01-14 14:26:13.088370', '2024-01-14 14:26:13.088370', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (67, 'Hello em', '2024-01-14 14:28:00.085833', '2024-01-14 14:28:00.085833', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (68, 'la sao', '2024-01-14 14:28:17.406462', '2024-01-14 14:28:17.406462', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (69, 'OK', '2024-01-14 14:30:29.100234', '2024-01-14 14:30:29.100234', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (70, 'BRUH', '2024-01-14 14:32:31.345083', '2024-01-14 14:32:31.345083', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (71, 'OKEY', '2024-01-14 14:33:32.002414', '2024-01-14 14:33:32.002414', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (72, 'YES', '2024-01-14 14:34:11.027857', '2024-01-14 14:34:11.027857', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (73, 'OKEY RE', '2024-01-14 14:35:14.259691', '2024-01-14 14:35:14.259691', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (74, 'test re', '2024-01-14 14:36:23.523909', '2024-01-14 14:36:23.523909', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (75, 'kkk', '2024-01-14 14:38:09.845857', '2024-01-14 14:38:09.845857', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (76, 'zzz', '2024-01-14 14:38:47.430122', '2024-01-14 14:38:47.430122', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (77, 'FFF', '2024-01-14 14:41:11.625784', '2024-01-14 14:41:11.625784', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (78, 'BBB', '2024-01-14 14:42:15.323837', '2024-01-14 14:42:15.323837', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (79, 'XXX', '2024-01-14 14:44:06.464976', '2024-01-14 14:44:06.464976', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (80, 'zzz kkk', '2024-01-14 14:48:34.073480', '2024-01-14 14:48:34.073480', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (81, 'OKey bro', '2024-01-14 14:48:57.780552', '2024-01-14 14:48:57.780552', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (82, 'test', '2024-01-14 14:50:52.615011', '2024-01-14 14:50:52.615011', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (83, 'brokemn', '2024-01-14 14:52:08.887654', '2024-01-14 14:52:08.887654', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (84, 'bruh hh', '2024-01-14 14:54:42.627686', '2024-01-14 14:54:42.627686', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (85, 'haml', '2024-01-14 14:55:50.121108', '2024-01-14 14:55:50.121108', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (86, 'nghi no cay', '2024-01-14 14:58:16.129652', '2024-01-14 14:58:16.129652', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (87, 'OK', '2024-01-14 15:00:02.699097', '2024-01-14 15:00:02.699097', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (88, 'sao v', '2024-01-14 15:00:31.284939', '2024-01-14 15:00:31.284939', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (89, 'hu', '2024-01-14 15:01:21.717999', '2024-01-14 15:01:21.717999', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (90, 'hi', '2024-01-14 15:02:13.967616', '2024-01-14 15:02:13.967616', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (91, 'z', '2024-01-14 15:03:22.487802', '2024-01-14 15:03:22.487802', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (92, 'OK', '2024-01-14 15:05:29.975623', '2024-01-14 15:05:29.975623', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (93, 'DONE', '2024-01-14 15:08:22.081474', '2024-01-14 15:08:22.081474', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (94, 'OK ROI NHE', '2024-01-14 15:08:34.626379', '2024-01-14 15:08:34.626379', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (95, 'OK em nhe', '2024-01-14 15:09:20.318762', '2024-01-14 15:09:20.318762', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (96, 'sao v', '2024-01-14 15:09:41.999466', '2024-01-14 15:09:41.999466', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (97, 'kh sao', '2024-01-14 15:11:47.945056', '2024-01-14 15:11:47.945056', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (98, 'ao ma', '2024-01-14 15:13:23.823661', '2024-01-14 15:13:23.823661', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (99, 'OK NHE', '2024-01-14 15:17:41.234396', '2024-01-14 15:17:41.234396', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (100, 'fsdghfsdfdgfs', '2024-01-14 15:17:44.026807', '2024-01-14 15:17:44.026807', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (101, 'cay the nhi', '2024-01-14 15:24:18.698573', '2024-01-14 15:24:18.698573', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (102, 'chan luon', '2024-01-14 15:26:50.945898', '2024-01-14 15:26:50.945898', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (103, 'gggg', '2024-01-14 15:28:49.984309', '2024-01-14 15:28:49.984309', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (104, 'fff', '2024-01-14 15:28:53.692720', '2024-01-14 15:28:53.692720', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (105, 'BRO', '2024-01-14 15:33:52.032547', '2024-01-14 15:33:52.032547', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (106, 'LLL', '2024-01-14 15:34:42.895594', '2024-01-14 15:34:42.895594', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (107, 'BRUH', '2024-01-14 15:36:37.865755', '2024-01-14 15:36:37.865755', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (108, 'OK', '2024-01-14 15:37:28.507075', '2024-01-14 15:37:28.507075', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (109, 'Z', '2024-01-14 15:39:32.544758', '2024-01-14 15:39:32.544758', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (110, 'OK', '2024-01-14 15:41:39.551458', '2024-01-14 15:41:39.551458', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (111, 'sss', '2024-01-14 15:42:11.958285', '2024-01-14 15:42:11.958285', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (112, 'sss', '2024-01-14 15:42:27.972627', '2024-01-14 15:42:27.972627', NULL, 4, 1, 8);
INSERT INTO `messages` VALUES (113, 'zo', '2024-01-14 15:44:00.723262', '2024-01-14 15:44:00.723262', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (114, 'bro', '2024-01-14 15:44:45.607368', '2024-01-14 15:44:45.607368', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (115, 'ZA', '2024-01-14 15:45:37.501466', '2024-01-14 15:45:37.501466', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (116, 'BRO', '2024-01-14 15:47:20.146542', '2024-01-14 15:47:20.146542', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (117, 'DONE OK', '2024-01-14 15:47:28.519553', '2024-01-14 15:47:28.519553', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (118, 'TEST SUCCESS', '2024-01-14 15:48:35.240717', '2024-01-14 15:48:35.240717', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (119, 'TO TOP', '2024-01-14 15:48:47.655907', '2024-01-14 15:48:47.655907', NULL, 4, 1, 8);
INSERT INTO `messages` VALUES (120, 'hehehe', '2024-01-16 04:20:02.265039', '2024-01-16 04:20:02.265039', NULL, 3, 1, 12);
INSERT INTO `messages` VALUES (121, 'alo', '2024-03-11 21:14:38.226974', '2024-03-11 21:14:38.226974', NULL, 6, 16, 1);
INSERT INTO `messages` VALUES (122, 'dhffhgfs', '2024-03-15 23:04:04.107391', '2024-03-15 23:04:04.107391', NULL, 6, 1, 16);
INSERT INTO `messages` VALUES (123, 'fdsf', '2024-03-15 23:04:11.950370', '2024-03-15 23:04:11.950370', NULL, 6, 1, 16);

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `avatar_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `seen` tinyint NOT NULL DEFAULT 0,
  `customer_id` int NULL DEFAULT NULL,
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_b55350bc786b052e8523f313b9a`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `FK_b55350bc786b052e8523f313b9a` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notifications
-- ----------------------------
INSERT INTO `notifications` VALUES (37, 'Trịnh Hoàng đã bày tỏ cảm xúc về bài viết của Thúy cute. kkk', 'http://localhost:3009/images/uploads/avt_git.jpg', 1, 16, '2024-02-01 16:00:20.000000', NULL, '2024-02-01 15:58:08.089759');
INSERT INTO `notifications` VALUES (38, 'Trịnh Hoàng đã bày tỏ cảm xúc về bài viết của Thúy cute. kkk', 'http://localhost:3009/images/uploads/avt_git.jpg', 1, 16, '2024-02-01 16:00:16.000000', NULL, '2024-02-01 15:58:24.165667');
INSERT INTO `notifications` VALUES (39, 'Trịnh Hoàng đã bày tỏ cảm xúc về bài viết của Thúy cute. kkk', 'http://localhost:3009/images/uploads/avt_git.jpg', 1, 16, '2024-02-01 16:01:19.000000', NULL, '2024-02-01 16:00:32.634600');
INSERT INTO `notifications` VALUES (40, 'Trịnh Hoàng đã bày tỏ cảm xúc về bài viết của Thúy cute. kkk', 'http://localhost:3009/images/uploads/avt_git.jpg', 1, 16, '2024-02-01 16:10:40.000000', NULL, '2024-02-01 16:01:25.538276');
INSERT INTO `notifications` VALUES (41, 'Trịnh Hoàng đã bày tỏ cảm xúc về bài viết của Thúy cute. kkk', 'http://localhost:3009/images/uploads/avt_git.jpg', 1, 16, '2024-02-01 16:19:55.000000', NULL, '2024-02-01 16:01:27.096550');
INSERT INTO `notifications` VALUES (42, 'test 111', 'http://localhost:3009/images/uploads/avt_git.jpg', 1, 16, '2024-02-01 16:11:48.000000', NULL, '2024-02-01 16:11:28.751733');
INSERT INTO `notifications` VALUES (43, 'test 222\n', 'http://localhost:3009/images/uploads/avt_git.jpg', 1, 16, '2024-02-01 16:18:48.000000', NULL, '2024-02-01 16:11:34.679637');
INSERT INTO `notifications` VALUES (44, 'test 333', 'http://localhost:3009/images/uploads/avt_git.jpg', 1, 16, '2024-02-29 15:11:27.000000', NULL, '2024-02-01 16:12:42.361774');
INSERT INTO `notifications` VALUES (45, 'test 444', 'http://localhost:3009/images/uploads/avt_git.jpg', 1, 16, '2024-02-29 15:09:42.000000', NULL, '2024-02-01 16:19:02.303071');
INSERT INTO `notifications` VALUES (46, 'test success', 'http://localhost:3009/images/uploads/avt_git.jpg', 1, 16, '2024-03-06 14:56:02.000000', NULL, '2024-02-29 22:03:38.728621');
INSERT INTO `notifications` VALUES (47, 'hehehehheeh', 'http://localhost:3009/images/uploads/avt_git.jpg', 0, 16, '2024-02-29 22:07:22.295343', NULL, '2024-02-29 22:07:22.295343');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'processing',
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_ac832121b6c331b084ecc4121fd`(`product_id` ASC) USING BTREE,
  INDEX `FK_772d0ce0473ac2ccfa26060dbe9`(`customer_id` ASC) USING BTREE,
  CONSTRAINT `FK_772d0ce0473ac2ccfa26060dbe9` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ac832121b6c331b084ecc4121fd` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 1, 190000, 'shipping', '2023-09-23 16:10:10.098403', '2023-11-06 03:56:24.000000', NULL, 59, 1);
INSERT INTO `orders` VALUES (2, 1, 100000, 'shipping', '2023-09-23 16:27:44.641215', '2023-11-06 03:32:46.000000', NULL, 59, 1);
INSERT INTO `orders` VALUES (3, 1, 65000, 'processing', '2023-10-05 15:23:56.204227', '2023-10-05 15:23:56.204227', NULL, 47, 1);
INSERT INTO `orders` VALUES (4, 1, 14289000, 'shipping', '2023-10-06 06:50:33.888021', '2023-11-06 03:58:05.000000', NULL, 60, 8);
INSERT INTO `orders` VALUES (5, 1, 14289000, 'processing', '2023-10-06 07:01:45.117387', '2023-10-06 07:01:45.117387', NULL, 36, 8);
INSERT INTO `orders` VALUES (6, 1, 5500000, 'processing', '2023-10-06 07:02:15.222002', '2023-10-06 07:02:15.222002', NULL, 47, 8);
INSERT INTO `orders` VALUES (7, 1, 700000, 'processing', '2023-10-06 07:11:10.514636', '2023-10-06 07:11:10.514636', NULL, 54, 8);
INSERT INTO `orders` VALUES (8, 1, 6800000, 'processing', '2023-10-06 07:17:17.220196', '2023-10-06 07:17:17.220196', NULL, 46, 8);
INSERT INTO `orders` VALUES (9, 1, 8500000, 'processing', '2023-10-06 07:20:06.734183', '2023-10-06 07:20:06.734183', NULL, 48, 8);
INSERT INTO `orders` VALUES (10, 1, 6500000, 'finished', '2023-10-06 07:21:38.498375', '2023-11-06 04:06:23.000000', NULL, 50, 8);
INSERT INTO `orders` VALUES (11, 5, 35000, 'processing', '2023-10-06 07:26:04.985593', '2023-10-06 07:26:04.985593', NULL, 58, 8);
INSERT INTO `orders` VALUES (12, 1, 35000, 'processing', '2024-01-18 03:38:08.705623', '2024-01-18 03:38:08.705623', NULL, 56, 1);
INSERT INTO `orders` VALUES (13, 1, 190000, 'processing', '2024-01-18 03:40:03.982700', '2024-01-18 03:40:03.982700', NULL, 53, 1);
INSERT INTO `orders` VALUES (14, 1, 190000, 'processing', '2024-01-18 03:40:49.762161', '2024-01-18 03:40:49.762161', NULL, 53, 1);
INSERT INTO `orders` VALUES (15, 1, 8562000, 'processing', '2024-01-18 03:41:59.922398', '2024-01-18 03:41:59.922398', NULL, 41, 1);
INSERT INTO `orders` VALUES (16, 1, 190000, 'processing', '2024-01-18 03:43:13.952896', '2024-01-18 03:43:13.952896', NULL, 53, 1);
INSERT INTO `orders` VALUES (17, 1, 190000, 'processing', '2024-01-18 03:45:34.626693', '2024-01-18 03:45:34.626693', NULL, 53, 1);
INSERT INTO `orders` VALUES (18, 1, 35000, 'processing', '2024-01-18 03:47:20.619739', '2024-01-18 03:47:20.619739', NULL, 58, 1);
INSERT INTO `orders` VALUES (19, 1, 8562000, 'processing', '2024-01-18 03:48:49.731532', '2024-01-18 03:48:49.731532', NULL, 41, 1);
INSERT INTO `orders` VALUES (20, 1, 300000, 'processing', '2024-01-18 03:50:17.482156', '2024-01-18 03:50:17.482156', NULL, 55, 1);
INSERT INTO `orders` VALUES (21, 1, 10650000, 'processing', '2024-01-18 03:51:06.772530', '2024-01-18 03:51:06.772530', NULL, 38, 1);
INSERT INTO `orders` VALUES (22, 1, 8900000, 'processing', '2024-01-18 03:52:43.508058', '2024-01-18 03:52:43.508058', NULL, 44, 1);
INSERT INTO `orders` VALUES (23, 1, 7500000, 'processing', '2024-01-18 03:54:32.999597', '2024-01-18 03:54:32.999597', NULL, 49, 1);
INSERT INTO `orders` VALUES (24, 1, 3089000, 'processing', '2024-01-18 03:56:38.629778', '2024-01-18 03:56:38.629778', NULL, 40, 1);
INSERT INTO `orders` VALUES (25, 1, 11000000, 'processing', '2024-01-18 03:58:42.865426', '2024-01-18 03:58:42.865426', NULL, 42, 1);
INSERT INTO `orders` VALUES (26, 2, 5500000, 'processing', '2024-01-18 06:58:00.964835', '2024-01-18 06:58:00.964835', NULL, 47, 16);
INSERT INTO `orders` VALUES (27, 1, 4500000, 'processing', '2024-01-18 07:00:21.496307', '2024-01-18 07:00:21.496307', NULL, 45, 16);
INSERT INTO `orders` VALUES (28, 1, 4500000, 'processing', '2024-01-18 07:33:35.901233', '2024-01-18 07:33:35.901233', NULL, 45, 16);
INSERT INTO `orders` VALUES (29, 2, 5500000, 'processing', '2024-01-18 07:36:48.357486', '2024-01-18 07:36:48.357486', NULL, 47, 16);
INSERT INTO `orders` VALUES (30, 1, 4500000, 'processing', '2024-01-18 07:39:51.627354', '2024-01-18 07:39:51.627354', NULL, 45, 16);
INSERT INTO `orders` VALUES (31, 1, 5000000, 'processing', '2024-01-18 07:51:29.919040', '2024-01-18 07:51:29.919040', NULL, 43, 16);
INSERT INTO `orders` VALUES (32, 1, 5000000, 'processing', '2024-01-18 07:59:09.843013', '2024-01-18 07:59:09.843013', NULL, 43, 16);
INSERT INTO `orders` VALUES (33, 1, 5000000, 'processing', '2024-01-18 08:05:21.909038', '2024-01-18 08:05:21.909038', NULL, 43, 16);
INSERT INTO `orders` VALUES (34, 1, 5000000, 'processing', '2024-01-18 08:19:54.799604', '2024-01-18 08:19:54.799604', NULL, 43, 16);
INSERT INTO `orders` VALUES (35, 1, 5000000, 'processing', '2024-01-18 08:22:21.586555', '2024-01-18 08:22:21.586555', NULL, 43, 16);
INSERT INTO `orders` VALUES (36, 1, 4500000, 'processing', '2024-01-18 08:24:26.688903', '2024-01-18 08:24:26.688903', NULL, 45, 16);
INSERT INTO `orders` VALUES (37, 1, 5000000, 'processing', '2024-01-18 10:23:59.379934', '2024-01-18 10:23:59.379934', NULL, 43, 16);
INSERT INTO `orders` VALUES (38, 2, 5500000, 'processing', '2024-01-18 14:53:43.026413', '2024-01-18 14:53:43.026413', NULL, 47, 16);
INSERT INTO `orders` VALUES (39, 1, 5000000, 'processing', '2024-01-18 14:57:29.374352', '2024-01-18 14:57:29.374352', NULL, 43, 16);
INSERT INTO `orders` VALUES (40, 1, 7500000, 'processing', '2024-01-18 15:02:49.545419', '2024-01-18 15:02:49.545419', NULL, 49, 16);
INSERT INTO `orders` VALUES (41, 1, 7500000, 'processing', '2024-01-18 16:39:53.347130', '2024-01-18 16:39:53.347130', NULL, 49, 16);
INSERT INTO `orders` VALUES (42, 1, 4500000, 'processing', '2024-01-20 02:33:28.112153', '2024-01-20 02:33:28.112153', NULL, 45, 16);
INSERT INTO `orders` VALUES (43, 1, 7500000, 'processing', '2024-01-20 09:55:42.448704', '2024-01-20 09:55:42.448704', NULL, 49, 16);
INSERT INTO `orders` VALUES (44, 1, 8500000, 'processing', '2024-01-20 13:36:39.326866', '2024-01-20 13:36:39.326866', NULL, 48, 12);
INSERT INTO `orders` VALUES (45, 1, 190000, 'processing', '2024-03-11 21:15:43.288045', '2024-03-11 21:15:43.288045', NULL, 53, 1);
INSERT INTO `orders` VALUES (46, 1, 190000, 'processing', '2024-03-15 23:07:09.098371', '2024-03-15 23:07:09.098371', NULL, 53, 1);

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `order_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_b2f7b823a21562eeca20e72b006`(`order_id` ASC) USING BTREE,
  CONSTRAINT `FK_b2f7b823a21562eeca20e72b006` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payments
-- ----------------------------
INSERT INTO `payments` VALUES (1, '00', '2024-01-18 03:38:08.774285', '2024-01-18 03:38:08.774285', NULL, 12);
INSERT INTO `payments` VALUES (2, '00', '2024-01-18 03:40:04.015389', '2024-01-18 03:40:04.015389', NULL, 13);
INSERT INTO `payments` VALUES (3, '00', '2024-01-18 03:40:49.800028', '2024-01-18 03:40:49.800028', NULL, 14);
INSERT INTO `payments` VALUES (4, '00', '2024-01-18 03:41:59.948945', '2024-01-18 03:41:59.948945', NULL, 15);
INSERT INTO `payments` VALUES (5, '00', '2024-01-18 03:43:13.979235', '2024-01-18 03:43:13.979235', NULL, 16);
INSERT INTO `payments` VALUES (6, '00', '2024-01-18 03:44:39.353967', '2024-01-18 03:44:39.353967', NULL, 1);
INSERT INTO `payments` VALUES (7, '00', '2024-01-18 03:45:34.656241', '2024-01-18 03:45:34.656241', NULL, 17);
INSERT INTO `payments` VALUES (8, '00', '2024-01-18 03:47:20.651859', '2024-01-18 03:47:20.651859', NULL, 18);
INSERT INTO `payments` VALUES (9, '00', '2024-01-18 03:48:49.764324', '2024-01-18 03:48:49.764324', NULL, 19);
INSERT INTO `payments` VALUES (10, '00', '2024-01-18 03:50:17.517491', '2024-01-18 03:50:17.517491', NULL, 20);
INSERT INTO `payments` VALUES (11, '01', '2024-01-18 03:51:06.804812', '2024-01-18 03:51:36.000000', NULL, 21);
INSERT INTO `payments` VALUES (12, '01', '2024-01-18 03:52:43.531014', '2024-01-18 03:53:08.000000', NULL, 22);
INSERT INTO `payments` VALUES (13, '01', '2024-01-18 03:54:33.030643', '2024-01-18 03:54:56.000000', NULL, 23);
INSERT INTO `payments` VALUES (14, '01', '2024-01-18 03:56:38.656852', '2024-01-18 03:57:10.000000', NULL, 24);
INSERT INTO `payments` VALUES (15, '01', '2024-01-18 03:58:42.899374', '2024-01-18 06:53:16.000000', NULL, 25);
INSERT INTO `payments` VALUES (16, '00', '2024-01-18 06:58:01.000189', '2024-01-18 06:58:01.000189', NULL, 26);
INSERT INTO `payments` VALUES (17, '01', '2024-01-18 07:00:21.526405', '2024-01-18 07:00:58.000000', NULL, 27);
INSERT INTO `payments` VALUES (18, '01', '2024-01-18 07:33:35.944735', '2024-01-18 07:34:08.000000', NULL, 28);
INSERT INTO `payments` VALUES (19, '01', '2024-01-18 07:36:48.420834', '2024-01-18 07:37:12.000000', NULL, 29);
INSERT INTO `payments` VALUES (20, '01', '2024-01-18 07:39:51.665288', '2024-01-18 07:40:18.000000', NULL, 30);
INSERT INTO `payments` VALUES (21, '01', '2024-01-18 07:51:29.966533', '2024-01-18 07:52:02.000000', NULL, 31);
INSERT INTO `payments` VALUES (22, '00', '2024-01-18 07:59:09.883198', '2024-01-18 07:59:09.883198', NULL, 32);
INSERT INTO `payments` VALUES (23, '00', '2024-01-18 08:05:21.975965', '2024-01-18 08:05:21.975965', NULL, 33);
INSERT INTO `payments` VALUES (24, '03', '2024-01-18 08:19:54.933729', '2024-01-18 08:20:14.000000', NULL, 34);
INSERT INTO `payments` VALUES (25, '03', '2024-01-18 08:22:21.624930', '2024-01-18 08:22:35.000000', NULL, 35);
INSERT INTO `payments` VALUES (26, '03', '2024-01-18 08:24:26.758640', '2024-01-18 08:24:40.000000', NULL, 36);
INSERT INTO `payments` VALUES (27, '01', '2024-01-18 10:23:59.552200', '2024-01-18 10:24:40.000000', NULL, 37);
INSERT INTO `payments` VALUES (28, '00', '2024-01-18 14:53:43.133152', '2024-01-18 14:55:41.000000', NULL, 38);
INSERT INTO `payments` VALUES (29, '00', '2024-01-18 14:57:29.955686', '2024-01-18 14:57:58.000000', NULL, 39);
INSERT INTO `payments` VALUES (30, '03', '2024-01-18 15:02:49.599139', '2024-01-18 15:03:05.000000', NULL, 40);
INSERT INTO `payments` VALUES (31, '00', '2024-01-18 16:39:53.438508', '2024-01-18 16:40:26.000000', NULL, 41);
INSERT INTO `payments` VALUES (32, '03', '2024-01-20 02:33:28.173160', '2024-01-20 02:33:42.000000', NULL, 42);
INSERT INTO `payments` VALUES (33, '00', '2024-01-20 09:55:42.492885', '2024-01-20 09:56:53.000000', NULL, 43);
INSERT INTO `payments` VALUES (34, '00', '2024-01-20 13:36:39.364635', '2024-01-20 13:37:10.000000', NULL, 44);
INSERT INTO `payments` VALUES (35, '00', '2024-03-11 21:15:43.358167', '2024-03-11 21:18:36.000000', NULL, 45);
INSERT INTO `payments` VALUES (36, '00', '2024-03-15 23:07:09.164767', '2024-03-15 23:08:18.000000', NULL, 46);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` int NOT NULL,
  `quantity` int NOT NULL,
  `rate` int NULL DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `preview_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `sub_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'san pham cute hot me qua hihi ok', 'cat', 100010, 1010, 5, 'Trắng tuyết', 'https://preview.jpg', '2023-05-27 18:11:16.104997', '2023-07-30 14:51:30.000000', '2023-07-30 14:51:30.000000', NULL, NULL);
INSERT INTO `products` VALUES (2, 'Shiba', 'dogs', 5000000, 5, 5, 'Vàng gold', 'path to images', '2023-05-27 18:13:28.410797', '2023-08-06 07:51:44.000000', '2023-08-06 07:51:44.000000', NULL, NULL);
INSERT INTO `products` VALUES (3, 'Pate 1', 'foods', 300000, 10, 5, NULL, 'https://pate.jpg', '2023-05-27 18:14:53.535902', '2023-08-06 07:51:47.000000', '2023-08-06 07:51:47.000000', NULL, NULL);
INSERT INTO `products` VALUES (13, 'Pate', 'foods', 300000, 10, 5, NULL, 'path to images', '2023-06-04 09:10:51.813873', '2023-08-06 07:51:50.000000', '2023-08-06 07:51:50.000000', NULL, NULL);
INSERT INTO `products` VALUES (14, 'san pham 1111111', 'cat', 100010, 1010, NULL, NULL, 'https://preview.jpg', '2023-06-25 16:10:55.838397', '2023-06-28 15:39:28.000000', '2023-06-28 04:25:12.000000', NULL, NULL);
INSERT INTO `products` VALUES (15, 'san pham 1111111', 'cat', 100010, 1010, NULL, NULL, 'https://preview.jpg', '2023-06-25 16:53:13.357074', '2023-07-30 14:47:26.000000', '2023-07-30 14:47:26.000000', NULL, NULL);
INSERT INTO `products` VALUES (16, 'san pham 10 test', 'dog', 1000, 10, NULL, NULL, 'https://preview.jpg', '2023-06-26 13:45:38.147055', '2023-07-30 14:56:35.000000', '2023-07-30 14:56:35.000000', NULL, NULL);
INSERT INTO `products` VALUES (17, 'san pham 10 test OK PROMAX 11', 'dog', 1000, 10, NULL, NULL, 'https://preview.jpg', '2023-06-26 13:46:15.391214', '2023-07-30 15:22:31.000000', '2023-07-30 15:22:31.000000', NULL, NULL);
INSERT INTO `products` VALUES (18, 'san pham 10 test', 'dog', 1000, 10, NULL, NULL, 'https://preview.jpg', '2023-06-26 13:46:52.751039', '2023-08-06 07:51:52.000000', '2023-08-06 07:51:52.000000', NULL, NULL);
INSERT INTO `products` VALUES (19, 'san pham 10 test OK', 'dog', 1000, 10, NULL, NULL, 'https://preview.jpg', '2023-06-26 13:59:36.965791', '2023-08-06 07:51:56.000000', '2023-08-06 07:51:56.000000', NULL, NULL);
INSERT INTO `products` VALUES (20, 'san pham 10 test OOOOOO', 'dog', 1000, 10, NULL, NULL, 'https://preview.jpg', '2023-06-26 14:06:34.721337', '2023-07-30 14:46:58.000000', '2023-07-30 14:46:58.000000', NULL, NULL);
INSERT INTO `products` VALUES (21, 'san pham 10 test OOOOOO', 'dog', 1000, 10, NULL, NULL, 'https://preview.jpg', '2023-06-26 14:32:05.715860', '2023-07-30 14:47:07.000000', '2023-07-30 14:47:07.000000', NULL, NULL);
INSERT INTO `products` VALUES (22, 'san pham 10 test', 'dog', 1000, 10, NULL, NULL, 'https://preview.jpg', '2023-06-28 04:19:37.234280', '2023-07-30 14:56:27.000000', '2023-07-30 14:56:27.000000', NULL, NULL);
INSERT INTO `products` VALUES (23, 'san pham 10 test', 'dog', 1000, 10, NULL, NULL, 'https://preview.jpg', '2023-06-28 04:21:43.449682', '2023-07-30 14:53:13.000000', '2023-07-30 14:53:13.000000', NULL, NULL);
INSERT INTO `products` VALUES (24, 'san pham 10 test', 'dog', 1000, 10, NULL, NULL, 'https://preview.jpg', '2023-06-28 04:25:12.540040', '2023-07-30 14:52:33.000000', '2023-07-30 14:52:33.000000', NULL, NULL);
INSERT INTO `products` VALUES (25, 'san pham 10 test OOOOOO', 'dog', 1000, 10, NULL, NULL, 'https://preview.jpg', '2023-06-28 04:31:48.470468', '2023-07-30 14:46:06.000000', '2023-07-30 14:46:06.000000', NULL, NULL);
INSERT INTO `products` VALUES (26, 'san pham 10 test OOOOOO', 'dog', 1000, 10, NULL, NULL, 'https://preview.jpg', '2023-06-28 04:34:16.088805', '2023-06-28 12:34:58.000000', '2023-06-28 12:34:58.000000', NULL, NULL);
INSERT INTO `products` VALUES (27, 'san pham new', 'cat', 1000000, 1, NULL, 'gold', 'https://images.jpg', '2023-07-25 15:47:24.334004', '2023-07-30 14:44:48.000000', '2023-07-30 14:44:48.000000', NULL, NULL);
INSERT INTO `products` VALUES (28, 'san pham promax', 'dog', 100000000, 1, NULL, 'white', 'https://promax.jpg', '2023-07-25 15:53:35.132788', '2023-07-30 14:48:39.000000', '2023-07-30 14:48:39.000000', NULL, NULL);
INSERT INTO `products` VALUES (29, 'test', 'cat', 1, 1, NULL, 'blue', 'https://test.jpg', '2023-07-25 15:55:10.795450', '2023-07-25 16:29:09.000000', '2023-07-25 16:29:09.000000', NULL, NULL);
INSERT INTO `products` VALUES (30, 'test', 'cat', 1, 1, NULL, 'green', 'https://test.jpg', '2023-07-26 04:03:16.555221', '2023-07-26 04:04:40.000000', '2023-07-26 04:04:40.000000', NULL, NULL);
INSERT INTO `products` VALUES (31, 'test', 'cat', 1, 1, NULL, 'green', 'https://test.jpg', '2023-07-26 04:05:43.241787', '2023-07-30 14:44:34.000000', '2023-07-30 14:44:34.000000', NULL, NULL);
INSERT INTO `products` VALUES (32, 'ok add san pham', 'dog', 10, 10, NULL, 'Gold', 'https://images.png', '2023-07-30 15:11:15.523822', '2023-07-30 15:26:56.000000', '2023-07-30 15:26:56.000000', NULL, NULL);
INSERT INTO `products` VALUES (33, 'tesst', 'dog', 1, 1, NULL, 'white', 'https://ok.jpg', '2023-07-30 15:12:31.301752', '2023-07-30 15:21:01.000000', '2023-07-30 15:21:01.000000', NULL, NULL);
INSERT INTO `products` VALUES (34, 'success', 'dog', 1, 1, NULL, 'Gold', 'https://success.png', '2023-07-30 15:13:54.169334', '2023-07-30 15:22:19.000000', '2023-07-30 15:22:19.000000', NULL, NULL);
INSERT INTO `products` VALUES (35, 'test add product', 'dog', 1000, 1, NULL, 'White', 'https://ok.jpg', '2023-07-30 15:33:15.529416', '2023-08-06 07:51:40.000000', '2023-08-06 07:51:40.000000', NULL, NULL);
INSERT INTO `products` VALUES (36, 'Chó American Eskimo', 'dog', 14289000, 10, NULL, 'White', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/1-1-300x300.jpg', '2023-08-06 07:45:03.884000', '2023-08-25 02:04:24.068742', NULL, 'Chó American Eskimo (Eskimo) là một giống chó vô cùng xinh đẹp với bộ lông trắng muốt và đôi mắt đen nhánh. Chó Eskimo từng là cún cưng của Nữ hoàng Anh Charlotte và là giống chó được nuôi phổ biến bởi giới quý tộc Anh quốc. Hiện chó Eskimo vẫn còn chưa phổ biến ở Việt Nam và hầu như chưa có trại chó nào nhân giống dòng chó này. Bài viết dưới đây Thú Kiểng sẽ tập trung chia sẻ về nguồn gốc, ', '<p><strong>Chó American Eskimo</strong>&nbsp;(Eskimo) là một giống chó vô cùng xinh đẹp với bộ lông trắng muốt và đôi mắt đen nhánh. Chó Eskimo từng là cún cưng của Nữ hoàng Anh Charlotte và là giống chó được nuôi phổ biến bởi giới quý tộc Anh quốc. Hiện chó Eskimo vẫn còn chưa phổ biến ở Việt Nam và hầu như chưa có trại chó nào nhân giống dòng chó này. Bài viết dưới đây Thú Kiểng sẽ tập trung chia sẻ về nguồn gốc,&nbsp;<em>đặc điểm tính cách chó Eskimo thuần chủng, bên cạnh đó là giá chó Eskimo ở Việt Nam hiện nay.</em></p>\r\n   <p>Như đã đề cập ở trên, chó Eskimo hiện vẫn đang rất hiếm ở Việt Nam và vẫn chưa có trại chó nào tập trung nhân giống dòng chó xinh đẹp này. Hầu hết chó Eskimo ở VN hiện nay đều được nhập về từ Thái Lan hoặc từ các nước phương Tây (Nga, Anh, Mỹ). Do đó giá chó American Eskimo hiện vẫn đang rất cao.</p>\r\n   <p>Có một số ít chó Eskimo sinh sản tại Việt Nam thường được rao bán với giá khoảng 7 – 10 triệu. Tuy nhiên, các bé này rất khó có gen thuần chủng, đa phần chỉ có một nửa là Eskimo, nửa còn lại thường được lai với các giống chó lông trắng khác do số lượng con giống Eskimo ở Việt Nam là rất ít nên khó kết đôi.</p>\r\n   <p>Đặc điểm ngoại hình</p>\r\n   <p>Điểm ấn tượng nhất về ngoại hình chó Eskimo là bộ lông dày 2 lớp bao phủ toàn bộ cơ thể như một chiếc áo khoác lớn. Màu sắc của chúng chủ yếu là màu trắng tinh khiết hoặc màu kem. Lông chó Eskimo có thể thẳng hoặc hơi xoăn nhẹ. Bộ lông của chúng có khả năng chống nước và giúp chúng thích nghi được với điều kiện sống lạnh giá khắc nghiệt.</p>\r\n   <p>Chó Eskimo có thân hình chắc khỏe, thon gọn, độ dài của chân cân đối với chiều dài cơ thể. Giống chó này khi trưởng thành có chiều cao từ 38 – 48cm và nặng 8- 16kg. Chúng có dáng đi nhanh nhẹn, mạnh mẽ và rất cảnh giác.</p>\r\n   <p>Đặc điểm tính cách</p>\r\n   <p>Chó Eskimo là một thành viên vui vẻ, đôi khi nhút nhát trong gia đình. Chúng rất thông minh và được xếp vào một trong những giống chó thông minh nhất thế giới. Chúng trở nên nổi bật trong những hoạt động đòi hỏi phải dùng bộ não của mình như huấn luyện thủ thuật, các môn thể thao chó, làm xiếc,…</p>\r\n   <p>&nbsp;</p>\r\n   <p>Eskie là giống chó có khả năng giám sát rất tốt, chúng tỏ ra cảnh giác cao độ với người lạ mặt và khi thấy dấu hiệu đáng nghi, chúng có thể sủa báo hiệu cho chủ nhà. Tuy nhiên chúng lại vô cùng thân thiện, gần gũi với các loài vật nuôi khác và trẻ con.</p>\r\n   <p>Chó Eskimo rất thích hoạt động, chơi đùa. Bạn nên cho chúng đi bộ thường xuyên và tạo cơ hội cho chúng vui chơi để chúng không bị buồn chán và giữ cho cơ thể Eskie luôn săn chắc, khỏe mạnh.</p>');
INSERT INTO `products` VALUES (37, 'chó Doberman Pinscher', 'dog', 8875000, 10, NULL, 'Black', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/8-300x300.jpg', '2023-08-06 07:45:59.166260', '2023-08-25 01:51:13.421514', NULL, 'Giống chó Doberman Pinscher  hoặc Dobie, là một giống chó bảo vệ có nguồn gốc Đức, được tạo ra bởi Louis Dobermann vào cuối thế kỷ 19. Doberman có thân hình mạnh mẽ, cơ bắp phát triển nhưng dáng cao rất thanh thoát, chúng là giống chó rất cảnh giác, hung dữ nhưng đặc biệt trung thành nên thường được dùng làm chó bảo vệ, canh gác, cảnh sát hoặc trong quân đội.', '<p><strong>Giống chó Doberman Pinscher</strong>, hay&nbsp;<strong>chó&nbsp;Doberman</strong>&nbsp;hoặc Dobie, là một giống chó bảo vệ có nguồn gốc Đức, được tạo ra bởi Louis&nbsp;Dobermann vào cuối thế kỷ 19. Doberman có thân hình&nbsp;mạnh mẽ, cơ bắp phát triển nhưng dáng cao rất thanh thoát, chúng là giống chó rất cảnh giác, hung dữ nhưng đặc biệt trung thành nên thường được dùng làm chó bảo vệ, canh gác, cảnh sát hoặc trong quân đội.</p>\r\n      <p>Doberman Pinscher là giống chó rất cao, chiều cao phổ biến từ 65 – 75cm và nặng từ 32 – 45kg. Chúng có thân hình mạnh mẽ và thanh thoát, bộ ngực cơ bắp nở nang, lưng thẳng bụng thắt. Chân dài và các cơ bắp ở hông, đùi và chất rất phát triển, giúp chúng trở thành một trong những giống chó có tốc độ nhanh nhất trên thế giới. Doberman có đầu nhỏ so với thân hình, mõm thuôn dài, miệng vuông vức, răng sắc nhọn và hàm cực kỳ chắc khỏe, chúng cũng là một trong những giống chó có lực cắn mạnh nhất trong thế giới chó.</p>\r\n      <h3><strong>Tai</strong></h3>\r\n      <p>Doberman thường được thấy với đôi tai dựng, đó cũng là vẻ đẹp tiêu chuẩn của giống chó Doberman Pinscher.&nbsp;Tuy nhiên không phải chú chó Doberman nào cũng có đôi tai dựng tự nhiên mà đa phần được chủ cắt và nẹp tai từ khi còn bé. Có nhiều ý kiến trái chiều về việc cắt tai, các chuyên gia thú y thì cho rằng việc cắt tai nếu được làm từ nhỏ và làm đúng cách sẽ không gây nhiều đau đớn cũng như vấn để sức khỏe đáng kể với chú chó.</p>\r\n      <h3><strong>Đuôi</strong></h3>\r\n      <div class=\"code-block code-block-6\"></div>\r\n      <p>Doberman cũng thường được thấy với cái đuôi cộc, gần như cụt. Trên thực tế, đuôi doberman khá dài và dài hơn nhiều giống chó khác. Tuy nhiên, chúng thường được chủ cắt đuôi từ khi mới được vài ngày tuổi. Đuôi cộc gần như trở thành một tiêu chuẩn về cái đẹp của giống chó này, đó cũng là hình ảnh mà người cha đẻ Louis Doberman mô tả về giống chó hoàn hảo mà ông muốn tạo ra. Doberman đuôi cộc trông sẽ ngầu và dữ dằn hơn, hầu hết người nuôi đều thích Dob đuôi cộc.</p>\r\n      <figure class=\"wp-caption aligncenter\">\r\n         <img src=\"https://lh3.googleusercontent.com/-l7KNv2YsBm4/VsvWArcB15I/AAAAAAAAWm8/VJGCsXy-0-4/s720-Ic42/c%2525C3%2525A1ch-nu%2525C3%2525B4i-gi%2525E1%2525BB%252591ng-ch%2525C3%2525B3-doberman-pinscher-thu%2525E1%2525BA%2525A7n-ch%2525E1%2525BB%2525A7ng-1.jpg\" alt=\"Giống chó Doberman Pinscher thuần chủng. Cách nuôi chó Doberman ở Việt Nam\" width=\"720\" height=\"480\">\r\n         <figcaption class=\"wp-caption-text\"><strong>Một em Doberman “nguyên bản” với đuôi dài và tai cụp</strong></figcaption>\r\n      </figure>\r\n      <p>Tuy nhiên việc cắt đuôi phải làm từ khi chó doberman còn rất nhỏ, khi vừa mới sinh được vài ngày tuổi. Nếu bạn mua chó Doberman của người khác và muốn cắt đuôi thì phải thỏa thuận để chúng được cắt đuôi sẵn khi mới được sinh ra. Việc cắt đuôi khi Dob đã lớn sẽ rất đau đớn và có thể gây ra nhiều vấn đề sức khỏe sau này.</p>\r\n      <h2><strong>Tính cách chó Doberman Pinscher</strong></h2>\r\n      <p>Doberman Pinscher là giống hung dữ và rất hiếu chiến, sẵn sàng tấn công, đeo bám và hạ gục mục tiêu nhanh gọn. Doberman gan dạ và gần như không có bản năng sợ hãi, chúng sẵn sàng tấn công những đối thủ lớn và mạnh mẽ để bảo vệ chủ và tài sản. Tuy hung dữ và hiếu chiến nhưng chúng không hoang dại, rất trung thành với người nuôi dưỡng từ nhỏ và rất hiếm khi tự ý tấn công người, trừ khi chúng cảm thấy chủ hay bản thân mình bị đe dọa. Đây là một giống chó có thể tự kiểm soát tốt, số vụ doberman tự ý tấn công người ít hơn rất nhiều các giống chó dữ khác như Rottweiler hay Pitbull.</p>\r\n      <p><img class=\"aligncenter\" src=\"https://lh3.googleusercontent.com/-_AV7bxNOsVM/VsvWBbjM_nI/AAAAAAAAWnQ/bhupQEW2JWo/s720-Ic42/c%2525C3%2525A1ch-nu%2525C3%2525B4i-gi%2525E1%2525BB%252591ng-ch%2525C3%2525B3-doberman-pinscher-thu%2525E1%2525BA%2525A7n-ch%2525E1%2525BB%2525A7ng-4.jpg\" alt=\"Giống chó Doberman Pinscher thuần chủng. Cách nuôi chó Doberman ở Việt Nam\" width=\"720\" height=\"480\"></p>\r\n      <p>Doberman cũng được đánh giá là giống chó rất thông minh và vâng lời bậc nhất, có khả năng tiếp thu nhanh và thực hiện tốt các mệnh lệnh trong huấn luyện nên thường được dùng làm chó bảo vệ, canh gác, trong các lực lượng cảnh sát quân đội. Nếu được nuôi cùng những chú chó khác, Doberman thường sẽ cố nắm lấy vị trí alpha&nbsp;– vị trí đầu đàn. Bạn cần huấn luyện Doberman&nbsp;từ sớm để chúng hiểu&nbsp;và&nbsp;xác định&nbsp;vai trò alpha của chính bạn đối với cả đàn</p>');
INSERT INTO `products` VALUES (38, 'Chó boston Terrier thuần chủng', 'dog', 10650000, 10, NULL, 'White - Black', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/5-1-300x300.jpg', '2023-08-06 07:46:55.782217', '2023-08-25 01:55:59.467192', NULL, 'Chó sục Boston hay  Boston Terrier là giống chó cỡ nhỏ có nguồn gốc từ Mỹ. Giống chó này là kết quả của việc lai tạo 2 giống chó Bulldog Anh và chó sục Trắng Anh Quốc', '<p><strong>Chó sục Boston&nbsp;</strong>hay<strong>&nbsp;Boston Terrier&nbsp;</strong>là giống chó cỡ nhỏ có nguồn gốc từ Mỹ. Giống chó này là kết quả của việc lai tạo 2 giống chó&nbsp;Bulldog Anh&nbsp;và chó sục Trắng Anh Quốc. Boston Terrier rất dễ thích nghi, dễ nuôi dưỡng và dễ dạy bảo. Chó Boston Terrier hiện đang dần được phổ biến ở Việt Nam, tuy nhiên số lượng chưa có nhiều nên giá chó Boston vẫn còn khá cao.&nbsp;<em>Bài viết dưới đây sẽ chia sẻ các mức giá chi tiết, các địa chỉ mua bán chó Boston uy tín. Cũng như đặc điểm và tính cách của chó Boston Terrier thuần chủng.&nbsp;&nbsp;</em></p>\r\n   <p>Giá chó Boston ở Việt Nam được chia làm 2 loại là chó không giấy, chó Boston có giấy (VKA, FCI, AKC,…) và Boston nhập khẩu trực tiếp.</p>\r\n   <ul>\r\n      <li><strong>Chó Boston không giấy</strong>&nbsp;chiếm đa số ở Việt Nam, với&nbsp;<strong>giá phổ biến chỉ từ 6 – 10 triệu</strong>&nbsp;tùy chất lượng chó bố mẹ cũng như ngoại hình của chính chú chó đó.</li>\r\n      <li><strong>Chó Boston có giấy tờ đầy đủ</strong>&nbsp;có giá rất đa dạng, từ 10 – 20 triệu. Giá chính xác thường được định dựa vào chất lượng gia phả.</li>\r\n      <li><strong>Chó Boston nhập khẩu&nbsp;</strong>cũng chiếm tỉ lệ khá lớn ở Việt Nam do giống chó này đang ở trong giai đoạn thâm nhập thị trường trong nước, các trại chó đang bắt đầu nhập chó Boston từ các nước phát triển về để nhân giống. Giá của một bé Boston nhập khẩu khá cao,&nbsp;<strong>khoảng 15 – 25 triệu với các bé nhập từ Thái Lan</strong>.&nbsp;<strong>Và khoảng 25 – 40 triệu với các nhập từ các nước phương Tây.&nbsp;</strong></li>\r\n   </ul>');
INSERT INTO `products` VALUES (39, 'Chó  American Bully', 'dog', 9025800, 10, NULL, 'Brown', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/07-300x300.jpg', '2023-08-06 07:47:57.925808', '2023-08-25 01:54:21.130224', NULL, 'Chó Bully, hay  American Bully (Bully Mỹ),  giống chó đang lên cơn sốt tại Mỹ, châu Âu, Thái Lan và hiện đã lan tới Việt Nam. Đây là một giống chó mới xuất hiện từ năm 1995, là hậu duệ trực tiếp của chó Pitbull nhưng có dáng vẻ hầm hố và cơ bắp hơn, tuy nhiên, Bully lại có tính khí hiền lành hơn nhiều so với pitbull. Hiện Bully đang rất được ưa chuộng tại Việt Nam và được bán ở nhiều mức giá khác nhau.', '<p><strong>Chó Bully,&nbsp;</strong>hay<strong>&nbsp;American Bully (Bully Mỹ),</strong>&nbsp;giống chó đang lên cơn sốt tại Mỹ, châu Âu, Thái Lan và hiện đã lan tới Việt Nam. Đây là một giống chó mới xuất hiện từ năm 1995, là hậu duệ trực tiếp của&nbsp;chó Pitbull&nbsp;nhưng có dáng vẻ hầm hố và cơ bắp hơn, tuy nhiên, Bully lại có tính khí hiền lành hơn nhiều so với pitbull. Hiện Bully đang rất được ưa chuộng tại Việt Nam và được bán ở nhiều mức giá khác nhau.</p>\r\n   <p>So với năm 2012 – 2013, hiện giá chó Bully ở Việt Nam đã bắt đầu&nbsp;hạ nhiệt và trở dần trở về với giá trị thật của chúng, những chú chó đẻ tại nhà, không giấy tờ đã có giá từ&nbsp;<strong>7.5&nbsp;– 9&nbsp;triệu.</strong>&nbsp;Những em nào đẹp từ bé, ngực sát đất, chân ngắn, cơ bắp giá sẽ cao hơn nhiều, tùy đặc điểm từng em mà định giá. Những chú chó Bully có nguồn gốc rõ ràng, giấy tờ đầy đủ, bố mẹ được nhập trực tiếp từ Thái Lan thì giá sẽ cao hơn, thường trên 15&nbsp;triệu / em. Những bé&nbsp;có bố mẹ được nhập từ Mỹ giá sẽ còn cao nữa, phải tới 20 – 25&nbsp;triệu / em.</p>\r\n   <p>Giá trên là những em Bully con tầm 2.5 – 4 tháng tuổi, còn những chú chó Bully trưởng thành để làm giống nhập từ Thái thường có giá trên 30 triệu, còn nhập từ Mỹ thì thường không dưới 2500$. Những em này thì có giấy tờ và gia phả đầy đủ, tuy nhiên với chó Bully thì giấy tờ không hoàn toàn phản ánh chất lượng&nbsp;do Bully hiện chỉ được công nhận bởi các hiệp hội chó không chính thống, các tiêu chuẩn về chó Bully thuần chủng cũng chưa rõ ràng.</p>');
INSERT INTO `products` VALUES (40, 'Chó Becgie', 'dog', 3089000, 10, NULL, 'Gold', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/011-300x300.jpg', '2023-08-06 07:49:16.309856', '2023-08-25 01:53:01.666381', NULL, 'Becgie Đức, do có các phẩm chất rất ưu tú nên hiện phổ biến trên toàn thế giới, được cùng phổ biến trong các lực lượng nghiệp vụ như cảnh sát, quân đội, cứu hộ.', '<p><strong>Chó Becgie</strong>, hay&nbsp;<strong>chó German Shepherd (chó GSD)</strong>,<strong>&nbsp;</strong>là giống chó nổi tiếng có gốc Đức, xuất hiện từ cuối thế kỷ 19. Ban đầu giống chó này được cùng để chăn cừu, sau đó&nbsp;được sử dụng phổ biến&nbsp;trong các lực lượng cảnh sát, quân đội và cứu hộ trên toàn thế giới do thân hình mạnh mẽ, trí thông minh tuyệt vời và khả năng chấp hành mệnh lệnh một cách tuyệt đối. Trải qua hơn 1 thế kỷ phát triển, chó Becgie đã phân hóa thành nhiều dòng khác nhau, trong đó&nbsp;<strong>các loại chó Becgie nổi tiếng nhất</strong>&nbsp;là&nbsp;dòng&nbsp;<strong>Becgie Đức</strong>,&nbsp;<strong>Becgie Bỉ (</strong>hay<strong>&nbsp;chó Malinois)</strong>&nbsp;và&nbsp;<strong>Becgie Nga.</strong></p>\r\n   <p>Becgie Đức, do có các phẩm chất rất ưu tú nên hiện phổ biến trên toàn thế giới, được cùng phổ biến trong các lực lượng nghiệp vụ như cảnh sát, quân đội, cứu hộ. Do có khả năng nhạy mùi cực cao cùng thính giác nhạy bén, chó Becgie thường có nhiệp vụ tìm kiếm cứu hộ, đánh hơi ma túy và chất nổ. Chúng cũng có thân hình mạnh mẽ, cơ bắp và sự dẻo dai, nên cũng thường được huấn luyện trong chiến đấu, cảnh vệ và trấn áp tội phạm. Hiện chó Becgie Đức cũng rất phổ biến ở Việt Nam, bán với giá phổ biến từ 3.5 – 7 triệu, được nuôi làm thú cưng hoặc phục vụ các lực lượng bảo vệ, cảnh sát, quân đội</p>');
INSERT INTO `products` VALUES (41, 'Đàn bulldog anh 4 tháng', 'dog', 8562000, 10, NULL, 'Be', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/08-300x300.jpg', '2023-08-06 07:50:03.957588', '2023-08-25 01:49:28.318759', NULL, 'Sang tháng 4 sẽ cho xuất chuồng đàn Golden siêu cute cả nhà nhé. Đàn này được cái mặt bé nào cũng ngộ nghĩnh đáng yêu lắm, mọi người cứ nhìn ảnh là sẽ biết ạ', '<p>Sang tháng 4 sẽ cho xuất chuồng đàn Golden siêu cute cả nhà nhé. Đàn này được cái mặt bé nào cũng ngộ nghĩnh đáng yêu lắm, mọi người cứ nhìn ảnh là sẽ biết ạ. Các bé đều rất khỏe mạnh và háu ăn. Bé nào cũng đẹp, từ màu lông đến hình thể. Thú Kiểng mới up lên facebook mà đã rất nhiều người hỏi rồi, dự là các bé sẽ được cho đi rất nhanh nên bố mẹ nào thích bé rồi thì đừng chần chừ gì nữa nha!!!!</p>\r\n      <ol>\r\n         <li>TẶNG 1 NĂM BẢO HIỂM THÚ CƯNG và CHỨNG NHẬN SỞ HỮU HỢP PHÁP VỚI THÚ CƯNG</li>\r\n         <li>Bảo hành 15 ngày với mọi thú cưng bán ra</li>\r\n         <li>Miễn phí vận chuyển toàn quốc chặng đầu tiên.</li>\r\n         <li>Hỗ trợ thú y khám chữa bệnh tại nhà với khách hàng ở Hà Nội và Tp.HCM</li>\r\n         <li>Hỗ trợ chi phí khám chữa bệnh trọn đời cho thú cưng ở Hà Nội, Tp.HCM và vùng lân cận.</li>\r\n         <li>Tư vấn chăm sóc trọn đời về dinh dưỡng và sức khỏe</li>\r\n      </ol>');
INSERT INTO `products` VALUES (42, 'chó Alaska', 'dog', 11000000, 10, NULL, 'White - Black', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/10-300x300.jpg', '2023-08-06 07:50:46.000525', '2023-08-25 01:47:40.839858', NULL, 'Alaska  là giống chó tuyết đang rất được ưa chuộng ở Việt Nam. Bộ lông mượt và dày quyến rũ, thân hình giống loài chó sói hùng mạnh đã khiến không ít người săn tìm và sẵn sàng bỏ ra hàng chục triệu đồng để rước một em Alaska về nhà. Tuy nhiên cũng không ít người mua phải chó Alaska bị lai tạp, tưởng rằng đã mua được chó Alaska đẹp, chuẩn nhưng thực chất lại là con lai rất “hoàn hảo” của Alaska', '<p><strong>&nbsp;Alaska</strong>&nbsp;là&nbsp;giống chó tuyết&nbsp;đang rất được ưa chuộng ở Việt Nam. Bộ lông mượt và dày quyến rũ, thân hình giống loài chó sói hùng mạnh đã khiến không ít người săn tìm và sẵn sàng bỏ ra hàng chục triệu đồng để rước một em Alaska về nhà. Tuy nhiên cũng không ít người mua phải chó Alaska bị lai tạp, tưởng rằng đã mua được chó Alaska đẹp, chuẩn nhưng thực chất lại là con lai rất “hoàn hảo” của Alaska</p>\r\n   <h4><strong>Thân hình</strong></h4>\r\n   <p>Một chú chó Alaska thuần chủng, theo tiêu chuẩn của Hiệp hội chó Hoa Kỳ (AKC) phải có&nbsp;<strong>chiều cao trung bình</strong>&nbsp;58.5cm (cái)&nbsp;hoặc&nbsp;68.5cm (đực),&nbsp;<strong>cân nặng trung bình&nbsp;</strong>34 – 45kg với giống cái, và 38 – 55kg với giống đực. Những em Alaska nuôi tại Việt Nam kích thước có thể nhỏ hơn đôi chút, do thời tiết ấm áp, chó Alaska khó đạt được đến kích thước cực đại. Cơ thể nhìn cân đối hài hòa về chiều cao, cân nặng, tuy nhiên nhìn hơi thô và không được quý phái tinh tế như chó Husky.</p>\r\n   <div class=\"code-block code-block-2\"></div>\r\n   <p>Alaska chuẩn là giống chó rất cơ bắp, ẩn sâu dưới lớp lông nên khó nhìn, tuy nhiên có thể cảm nhận được cơ thể rắn chắc bằng cách xờ nắn. Xương chấn rất lớn, chân to và gân guốc (để phục vụ việc kéo xeo nặng). Giữa chân có gấp khuỷu (phải xờ nắn mới thấy), trong khi đó chân chó Husky, họ hàng gần nhất của Alaska, lại nhỏ hơn và thẳng tuột. Đuôi chó Alaska to, lông xù xì thường để cong đuôi trên lưng khi đứng hoặc di chuyển, rất đặc trưng.</p>\r\n   <h4><strong>Bộ Lông</strong></h4>\r\n   <p>Bộ lông là điểm quyến rũ nhất của giống chó này. Lông Alaska dày, thô nhưng mềm và bóng. Lông có 2 lớp, ngoài dài và thô, lớp trong mềm và mượt hơn.&nbsp;Với những chú chó Alaska lông 2 màu, thường màu sắc sẽ nhạt dần theo chiều từ cao xuống thấp và trắng toát ở phần bụng và ngực.&nbsp;Màu lông của chó Alaska rất đa dạng, có thể có các màu sau:</p>\r\n   <p><strong>Đen – trắng.</strong>&nbsp;Đây là màu phổ biến nhất của giống chó Alaska</p>\r\n   <p><strong>Nâu đỏ – trắng.</strong>&nbsp;Đây là màu đang được giới yêu chó Alaska ở Việt Nam ưa chuộng nhất. Một em Alaska nâu đỏ – trắng đẹp, thuần chủng thường có giá đắt hơn vài triệu so với đen hoặc xám trắng.</p>\r\n   <p><strong>Màu Sable – trắng.</strong>&nbsp;Là những em Husky có màu đen hoặc xám – trắng chủ đạo, nhưng điểm thêm những mảng màu nâu đỏ.&nbsp;Màu này ở Việt Nam khá hiếm</p>\r\n   <p>Ngoài ra còn có màu cực hiếm gọi là Agouti, màu lông xen kẽ rất đều giữa đen, xám, hoặc nâu đỏ – trắng.&nbsp;Những cá thể Alaska có màu này rất hiếm trên toàn thế giới.</p>\r\n   <h4><strong>Đầu và mặt</strong></h4>\r\n   <p>Mặt chó Husky bành to, lông rậm và xù xì. Tai to vừa phải, cân đối so với mặt và có nhiều lông tơ bên trong. Mặt chó Alaska bị “gãy”, điểm gãy (điểm trán giao với mũi) được thấy rất rõ. Đây là một đặc điểm quan trọng để&nbsp;phân biệt chó Alaska vs Husky.</p>\r\n   <h4><strong>Mắt</strong></h4>\r\n   <p>Mắt chó Alaska chỉ được công nhận là có màu nâu hoặc nâu đen. Tất cả chó Alaska các màu mắt khác, phổ biến là màu xanh dao trời, đều bị cho là chó bị lai tạp với các giống khác, thường là kết quả của “cuộc tình ngang trái” giữa Alaska và Husky.</p>');
INSERT INTO `products` VALUES (43, 'chó Phú Quốc thuần chủng', 'dog', 5000000, 10, NULL, 'Black', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/01-300x300.jpg', '2023-08-06 07:51:15.988608', '2023-08-25 01:57:04.771106', NULL, 'Phú Quốc là một trong số rất hiếm hoi những giống chó thuần Việt nổi tiếng thế giới. Chó Phú Quốc cũng được coi là một trong tứ đại quốc khuyển của Việt Nam, vốn rất được giới yêu chó yêu thích, bao gồm: Phú Quốc, Dingo Đông Dương, H’Mông Cộc và Bắc Hà. Có những chú chó Phú Quốc đã được đưa sang châu Âu và bán với giá vài chục tới vài trăm triệu. Ở Việt Nam, giá chó Phú Quốc cũng rất đa dạng tùy theo màu sắc và các đặc điểm cơ thể.', '<p><strong>Phú Quốc</strong>&nbsp;là một trong số rất hiếm hoi những giống chó thuần Việt nổi tiếng thế giới. Chó Phú Quốc cũng được coi là một trong tứ đại quốc khuyển của Việt Nam, vốn rất được giới yêu chó yêu thích, bao gồm: Phú Quốc,&nbsp;Dingo Đông Dương, H’Mông Cộc và Bắc Hà. Có những chú chó Phú Quốc đã được đưa sang châu Âu và bán với giá vài chục tới vài trăm triệu. Ở Việt Nam, giá chó Phú Quốc cũng rất đa dạng tùy theo&nbsp;màu sắc và các đặc điểm cơ thể.</p>\r\n   <ul>\r\n      <li><strong>Độ tuổi.</strong>&nbsp;Các mức giá nêu ở trên được áp dụng đối với những chú chó khoảng 2 tháng tuổi, tức vừa đủ tuổi xuất chuồng. Những chú chó lớn hơn sẽ có giá cao hơn. Đặc biệt, những chú chó tinh khôn, đã qua huấn luyện nâng cao có thể sẽ có giá đắt gấp đôi, gấp 3 bình thường.</li>\r\n      <li><strong>Giới tính.</strong>&nbsp;Ở các giống chó cảnh, giá chó cái thường đắt hơn đực vài trăm nghìn tới vài triệu. Tuy nhiên, riêng với giống chó Phú Quốc thì đực thường có giá hơn cái. Nguyên nhân là vì, Phú Quốc không phải dòng chó nuôi làm cảnh thông thường, người nuôi yêu Phú Quốc bởi sự mạnh mẽ, nhanh nhẹn, thân hình vạm vỡ chắc khỏe, vốn là các đặc điểm thường thấy ở chó đực.<br>\r\n         Những chú chó thường cái chỉ đắt hơn khi có các tố chất vượt trội, như thông minh, nhanh nhẹn và phải sở hữu các đặc điểm tốt để làm giống.\r\n      </li>\r\n      <li><strong>Chó bố mẹ.</strong>&nbsp;Một yếu tố quyết định rất lớn tới giá chó Phú Quốc, cũng như bất kỳ giống chó nào, là gen giống, tức chó bố mẹ. Những chú chó con có bố mẹ nổi tiếng thường sẽ có giá cao hơn vài trăm nghìn tới 1 triệu so với các bé bình thường.</li>\r\n      <li><strong>Gia phả.</strong>&nbsp;Hiện ở Việt Nam không có nhiều chú chó Phú Quốc có gia phả đầy đủ để chứng minh nguồn gốc. Những chú chó có giấy tờ như vậy thường có giá cao gấp 2&nbsp;– 4&nbsp;lần những chú chó thông thường. Tuy nhiên, giá cao như vậy là hoàn toàn xứng đáng bởi những những chú chó có giấy tờ đầy đủ sẽ có thể xuất ngoại đi Âu – Mỹ – Nga, nơi giá trị của chúng có thể cao hơn gấp hàng chục lần trong nước.</li>\r\n   </ul>\r\n   <p>Đặc điểm&nbsp;thuần chủng của chó Phú Quốc</p>\r\n   <div class=\"code-block code-block-6\">&nbsp;Bất kỳ ai yêu chó Phú Quốc cũng muốn có được chú chó thuần chủng. Tuy nhiên với giống chó này, khái niệm thuần chủng hiện đang gây rất nhiều tranh cãi. Có nhiều ý kiến trong giới yêu chó cho rằng, chó Phú Quốc thuần chủng phải có thân hình thanh thoát, rắn chắc, có màng chân, trí óc tinh khôn và đặc biệt là nhất định phải có xoáy lưng.&nbsp;Theo đó, tùy vào từng “đặc điểm thuần chủng”&nbsp;mà những chú Phú Quốc cũng có giá khác nhau.</div>\r\n   <p><img class=\"aligncenter\" src=\"https://lh3.googleusercontent.com/BHoiMqYwUjy9d29H4x1nQFdlRaoEUibW940KF5HIHGZrmNq4P6DGfvT-ZUOgk0qgQGs_Jv0aIjsDAtBqj8Fc8pk6ck-s9yKXY222scPlxfz7YeUYRgW0cdhmK7SaR2m46sdvoIFVpwqNgJ4_IooMNOuIVego5hKNWj8A24uHeMTvXYtbYsmrcGL-buO9fEr37BZ3t9dFE0pQCGyXlaK79qIlsgfRigg_8jVxR1DZ8N5EIZS6YpMms_uaoaJw3fHrNC0099xddLTU-5dUVsgmnA0MGystV5_FikRy0zGzCJRrz4MUlUGdBCrzxuGDVkJAxinREYHfXNvi-DfkXOWwS9_6oEEcmx9y0KTLAPrEu8stpkvQYEfUYWMiGb7iQ8xUAw2jVg76aVsGr2ahC2nFrUOiWDXy7HvsQMi5jcafOBEiDulHr4BbbKKhbLuYRyQv7FBD5lnz6ZtvvykH2S4yySRnTwhW-NCDxZ8X6P8XGSbkzvVBTaENFrKEg-27WD7r_jq93qHT6Sd8u_ExSruOE9n7AaTSGA-obOaQzbtMl2fTnOqN5PLubEN5BNhG5kcOu_Hq9xVmFB-b9P7LLzLV1ODkgIqFMCSGeEfJ-bfn6l5zV9qnaedsfQ=w800-h532-no\" alt=\"Giá chó Phú Quốc thuần chủng. Mua chó Phú Quốc giá bao nhiêu?\" width=\"800\" height=\"532\"></p>\r\n   <p>Các đặc điểm chính xác về độ thuần chủng của chó Phú Quốc&nbsp;vẫn còn nhiều tranh cãi, và cũng chưa có nghiên cứu chính thức nào. Do vậy, bài viết này TK sẽ không bàn sâu về vấn đề này, mà chỉ đưa ra bảng giá đối với những chú chó Phú Quốc mang các đặc điểm được đa số cộng đồng yêu chó công nhận, bao gồm:&nbsp;<strong>thân hình thanh thoát, ngực nở, bụng thắt, đuôi cong trên lưng, chân nhỏ và cao, trí óc tinh khôn và có xoáy lưng.&nbsp;</strong></p>\r\n   <p>&nbsp;</p>');
INSERT INTO `products` VALUES (44, 'Mèo nhân sư không lông – Sphynx', 'cat', 8900000, 10, NULL, 'White - Brown', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/0010-300x300.jpg', '2023-08-06 07:53:07.724183', '2023-08-25 01:58:53.945857', NULL, 'Mèo Sphynx là một giống mèo đột biến tự nhiên, không qua cấy ghép. Nguồn gốc của chúng từ một chú mèo sinh ra bị đột biến xấu xí, không lông, da trắng bệch vào năm 1966. Sau đó nó được nhân giống với mèo mẹ và sinh ra thêm nhiều chú mèo không lông khác. Từ khi được công nhận là một giống mèo chính thức vào năm 2005, Sphynx đã đoạt danh hiệu giống mèo “Kinh dị nhất thế giới”', '<p>Mèo Sphynx là một giống mèo đột biến tự nhiên, không qua cấy ghép. Nguồn gốc của chúng từ một chú mèo sinh ra bị đột biến xấu xí, không lông, da trắng bệch vào năm 1966. Sau đó nó được nhân giống với mèo mẹ và sinh ra thêm nhiều chú mèo không lông khác. Từ khi được công nhận là một giống mèo chính thức vào năm 2005, Sphynx đã đoạt danh hiệu giống mèo “Kinh dị nhất thế giới”.</p>\r\n   <p>Điều đặc biệt là những chú Sphynx có khuôn mặt rất giống những bức tượng nhân sư trong các lăng mộ cổ ở Ai Cập nên được đặt tên là Sphynx – tên tượng nhân sư Ai Cập. Ngoài ra, chúng còn được mệnh danh là mèo xấu nhất thế giới bởi khuôn mặt nhăn nheo xấu xí có vẻ già nua, cau có và cơ thể “chảy xệ”, không lông.</p>\r\n   <p>&nbsp;</p>\r\n   <p><img class=\"aligncenter\" src=\"https://www.chophuquochanoi.vn/image_pq/meo-khong-long-sphynx-cpq.vn-1492763816944.jpg\" alt=\"mèo không lông sphynx\" width=\"500\" height=\"516\"></p>\r\n   <p>&nbsp;</p>\r\n   <p>Mèo nhân sư Sphynx lúc mới sinh da của chúng chưa giãn trông rất giống bộ não người. Khi lớn, các nếp nhăn giãn dần ra khiến Sphynx trông già nua và dữ tợn. Làn da mỏng manh, không có sự bảo vệ khiến cho những con mèo không lông rất dễ bị tổn thương nên mèo Sphynx rất khó chăm sóc mà giá của chúng cũng không hề rẻ chút nào. Vì không chịu được trời lạnh nên chúng thường xuyên phải được mặc áo để giữ ấm cơ thể. Chúng chỉ thích hợp ở những vùng khí hậu không có mùa đông.</p>\r\n   <p>&nbsp;</p>\r\n   <p><img class=\"aligncenter\" src=\"https://www.chophuquochanoi.vn/image_pq/meo-nhan-su-sphynx-cpq.vn-1492763860187.jpg\" alt=\"mèo nhân sư sphynx\" width=\"500\" height=\"479\"></p>\r\n   <p>&nbsp;</p>\r\n   <p>Mèo Sphynx xấu xí những rất thân thiện, thông minh, hòa nhã với các vật nuôi khác. Chúng cũng tỏ vẻ hiếu khách chứ không rụt rè như một số giống mèo khác.</p>');
INSERT INTO `products` VALUES (45, 'Mèo Mỹ tai xoắn – American Curl', 'cat', 4500000, 10, NULL, 'Orange - White', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/9-300x300.jpg', '2023-08-06 07:53:56.082148', '2023-08-24 16:36:42.922346', NULL, 'Đúng như tên gọi American Curl có đôi tai xoắn (tai xoăn) ngược về phía sau khiến chúng trở nên thật đặc biệt. Chúng là giống mèo rất khỏe mạnh, thông minh và hiếu động, đôi tai xoắn là do gen đột biến tai xoắn và chính thức được công nhận giống mèo mới American Curl bởi Hiệp hội Mèo quốc tế TICA vào năm 1985. Những con mèo con mới sinh ra có đôi tai thẳng sau đó 3-5 ngày tuổi tai của chúng bắt đầu cuộn tròn lại và phát triển hoàn thiện khi đủ 16 tuần tuổi.', '<p>Đúng như tên gọi American Curl có đôi tai xoắn (tai xoăn) ngược về phía sau khiến chúng trở nên thật đặc biệt. Chúng là giống mèo rất khỏe mạnh, thông minh và hiếu động, đôi tai xoắn là do gen đột biến tai xoắn và chính thức được công nhận giống mèo mới American Curl bởi Hiệp hội Mèo quốc tế TICA vào năm 1985. Những con mèo con mới sinh ra có đôi tai thẳng sau đó 3-5 ngày tuổi tai của chúng bắt đầu cuộn tròn lại và phát triển hoàn thiện khi đủ 16 tuần tuổi.</p>\r\n   <p>&nbsp;</p>\r\n   <p><img class=\"aligncenter\" src=\"https://www.chophuquochanoi.vn/image_pq/meo-m%E1%BB%B9-tai-xoan-cpq.vn-1492677191426.jpg\" alt=\"mèo mỹ tai xoắn\" width=\"500\" height=\"588\"></p>\r\n   <p>&nbsp;</p>\r\n   <p>Ngoài chiếc tai xoắn ngược chúng còn có bộ lông dài hoặc tương đối dài óng mượt, màu sắc khá đa dạng cùng chiếc đuôi dài, dày tạo hình rất đẹp và mềm mại khi di chuyển.</p>\r\n   <p>Giống mèo American Curl cũng rất thông minh, dễ dạy bảo và hiếu động. Ở chúng có bản tính gần giống với loài chó, đó là sự trung thành, tình cảm và tận tụy với chủ nhân</p>');
INSERT INTO `products` VALUES (46, 'Mèo Nga mắt xanh – Russian Blue', 'cat', 6800000, 10, NULL, 'Grey', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/8-1-300x300.jpg', '2023-08-06 07:54:41.312680', '2023-08-24 16:35:51.892067', NULL, 'Giống mèo này có nguồn gốc xuất xứ từ Nga. Thoạt nhìn bạn sẽ dễ nhầm lẫn giữa mèo Anh lông ngắn lông xám mắt đồng phổ biến và mèo Nga mắt xanh bởi chúng đều có bộ lông ngắn, dày và mượt. Điểm khác biệt dễ nhận thấy là mèo Nga có màu xanh lá cây còn mèo Anh lông ngắn có mắt màu đồng và mèo Anh lông ngắn có mũi ngắn, mặt to tròn hơn mèo Nga. Mèo Nga mắt xanh khá nhút nhát khi thấy người lạ nhưng rất quấn chủ. Chúng hiền lành, thích sự tĩnh lặng và không nghịch nghợm, phá phách lung tung.', '<p>Giống mèo này có nguồn gốc xuất xứ từ Nga. Thoạt nhìn bạn sẽ dễ nhầm lẫn giữa mèo Anh lông ngắn lông xám mắt đồng phổ biến và mèo Nga mắt xanh bởi chúng đều có bộ lông ngắn, dày và mượt. Điểm khác biệt dễ nhận thấy là mèo Nga có màu xanh lá cây còn mèo Anh lông ngắn có mắt màu đồng và mèo Anh lông ngắn có mũi ngắn, mặt to tròn hơn mèo Nga. Mèo Nga mắt xanh khá nhút nhát khi thấy người lạ nhưng rất quấn chủ. Chúng hiền lành, thích sự tĩnh lặng và không nghịch nghợm, phá phách lung tung.</p>\r\n   <p>Giống như một số loài mèo khác trên thế giới, mèo Nga mắt xanh có kích thước trung bình. Tuy kích thước không lớn nhưng Russian Blue sở hữu thân hình khá mạnh mẽ, cơ bắp săn chắc, các chân dài và linh hoạt. Khuôn mặt của chúng khá thuôn dài với 1 đôi tay dựng đứng. Điểm đặc biệt nhất của loài mèo này chính là chúng sở hữu một đôi mắt xanh rất đẹp và màu mắt của chúng sẽ càng ngày càng đạm hơn theo thời gian. Đôi mắt xanh lục đặc trưng cùng với một chiếc mũi ngắn, miệng hơi chiếc đuôi thuôn dài khiến trông khá xinh xắn và ưa nhìn.</p>\r\n   <p>Ngoài ra một nét đặc trưng khác của mèo Russian Blue là bộ lông ngắn nhưng khá dày và mượt mà. Lông của chúng có màu xanh xám và sợi lông có kết cấu óng ánh như bạc càng khiến chúng xứng đáng với sự yêu chiều và cái giá mà nhiều người bỏ ra để sở hữu nó.</p>\r\n   <p><strong>Đặc điểm tính cách của mèo Nga mắt xanh</strong></p>\r\n   <p>Giống mèo Nga mắt xanh luôn được đánh giá là những bé mèo siêu dịu dàng và đáng yêu. Loài mèo này vốn có bản tính trầm tĩnh, hòa nhã và khá tình cảm chứ không hề chảnh chọe, khó tính, khó gần như một số loài mèo cưng khác. Russian Blue không hề “đòi hỏi” sự cưng nựng từ chủ nhân như những chú mèo cảnh khác mà chỉ cần được ở bên cạnh chủ mà thôi. Ngoài ra mèo Russian Blue rất nhút nhát với người lạ và chỉ có thể thân thiết với những người thân quen, điểm này càng khiến mèo Nga mắt xanh sẽ trở thành những em mèo cưng tuyệt vời với một số người yêu chuộng sự trầm lặng.</p>\r\n   <p>Trung bình những em mèo Russian Blue có tuổi thọ khá lâu từ 10 – 15 năm. Đây cũng là giống mèo rất khỏe mạnh đặc biệt rất háu ăn nên dễ béo phì. Vì thế nếu nuôi 1 em Russian Blue như vậy lưu ý chỉ nên cho chúng ăn với khẩu phần vừa đủ không được cho ăn quá no trong một bữa. Bạn cũng cần chải chuốt bộ lông cho em nó thường xuyên để chúng luôn được suôn mượt và thực hiện vệ sinh tai, mắt, mũi hằng tuần để tránh các loại bệnh tật khác cho chúng</p>');
INSERT INTO `products` VALUES (47, 'Mèo Anh lông dài – British Longhair', 'cat', 5500000, 10, NULL, 'Grey - White', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/7-1-300x300.jpg', '2023-08-06 07:55:22.150077', '2023-08-25 02:27:39.081093', NULL, 'Mèo lông dài Anh (ALD) là phiên bản lông dài của giống mèo Anh lông ngắn có nguồn gốc từ Anh. Chúng có có bộ lông dài óng ánh cùng chiếc đuôi có lông khá xù và dài. Mèo ALD có nhiều điểm tương đồng với mèo Ba Tư. Những chú mèo ALD cũng rất đáng yêu và hiền lành phù hợp để nuôi làm cảnh', '<p>Mèo lông dài Anh (ALD)&nbsp;là phiên bản lông dài của giống mèo Anh lông ngắn có\r\n   nguồn gốc từ Anh. Chúng có có bộ lông dài óng ánh cùng chiếc đuôi có lông khá xù và\r\n   dài. Mèo ALD có nhiều điểm tương đồng với mèo Ba Tư. Những chú mèo ALD cũng rất đáng\r\n   yêu và hiền lành phù hợp để nuôi làm cảnh\r\n</p>\r\n<p>\r\n   Mèo Anh Lông Dài có kích thước trung bình, bộ lông dài quý phái. Giống mèo này có\r\n   rất nhiều loài nhưng được chấp nhận là lai với mèo Ba Tư. Sở hữu bộ lông dài óng\r\n   ánh, thân hình chắc nịch, dài. Đầu to tròn và mắt sáng, tai ngắn. Tuy chân ngắn\r\n   nhưng rất chắc khỏe, đuôi cong lông dài và dày. Khác với Mèo Anh Lông Ngắn, giống\r\n   Mèo Anh Lông Dài có bộ ngực sâu nên nhiều người đánh giá chúng là giống mèo có kích\r\n   thước trung bình. Đặc biệt, Mèo Anh Lông Dài có nhiều màu sắc khác với mèo Lông Ngắn\r\n   như: màu trắng, kem, xanh, đỏ, nâu socola và nâu vàng.\r\n</p>\r\n<p>\r\n   Mèo Anh Lông Dài có tính tình khá hiền lành, ôn hòa. Chúng khá hiếu động và thích\r\n   đùa giỡn, nhất là khi chúng còn nhỏ. Tuy nhiên, vì lông dài và dày nên việc chăm sóc\r\n   và chải chuốt yêu cầu nhiều hơn so với Mèo Anh Lông Ngắn. Tuy nhiên, khi lớn chúng\r\n   lại thích nằm lười. Với đặc điểm này khiến chúng trở nên dễ nuôi hơn, không cần\r\n   thường xuyên cho đi dạo.\r\n</p>');
INSERT INTO `products` VALUES (48, 'Mèo Anh lông ngắn – British Shorthair', 'cat', 8500000, 10, NULL, 'Grey', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/02-1-300x300.jpg', '2023-08-06 07:55:54.017080', '2023-08-24 16:12:45.512128', NULL, 'Mèo Anh lông ngắn (ALN) là một trong những giống mèo được nuôi làm cảnh rất phổ biến và được ưa chuộng có nguồn gốc từ nước Anh. Những chú mèo ALN rất cute, ngoan hiền nổi bật với chiếc mũi ngắn cùng với khuôn mặt tròn, má tròn và bộ lông màu xám xanh cổ điển với mắt màu đồng là màu phổ biến nhất, một số màu sắc khác như trắng, kem, bạc, vàng, nâu… tất cả đều được công nhận là màu của mèo Anh thuần chủng.', '<p>Mèo Anh lông ngắn (ALN) là một trong những giống mèo được nuôi làm cảnh rất phổ biến và được ưa chuộng có nguồn gốc từ nước Anh. Những chú mèo ALN rất cute, ngoan hiền nổi bật với chiếc mũi ngắn cùng với khuôn mặt tròn, má tròn và bộ lông màu xám xanh cổ điển với mắt màu đồng là màu phổ biến nhất, một số màu sắc khác như trắng, kem, bạc, vàng, nâu… tất cả đều được công nhận là màu của mèo Anh thuần chủng.</p>\r\n   <p>Đây là một trong những giống mèo cổ nhất được biết đến, có nguồn gốc từ mèo Châu Âu được mang tới Anh bởi những người La Mã xâm chiếm vào thế chiến Thứ Nhất. Trong thời hiện đại, nó vẫn là giống mèo phổ biến nhất ở Anh.</p>\r\n   <p>Đế quốc La Mã đã xâm chiếm vương quốc Anh sau khi làm chủ nhiều nước khác, trong đó có Ai cập. Những người lính La Mã được đưa từ các doanh trại ở Ai cập đến Anh tham chiến đã mang theo các những chú mèo Ai Cập. Từ đó, các con mèo Ai cập bắt đầu được lai tạo với nhiều giống khác, và cho ra đời giống mèo Anh lông ngắn. Sau 2 cuộc thế chiến, số lượng mèo lông ngắn Anh không còn nhiều, người ta đã để chúng giao phối với mèo Ba Tư và mèo Russian Blue. Sau đó số lượng mèo lông ngắn Anh đã phát triển trở lại.</p>\r\n   <p>Những chú mèo Anh lông ngắn nổi bật với chiếc mũi ngắn cùng với khuôn mặt tròn, má tròn (rõ nhất ở con đực), hai mắt to tròn, thân hình tròn trịa, bộ lông dày ngắn, mịn. Bộ lông của mèo Anh là đặc điểm để xác định giống, chúng khá đa dạng về sắc, trong đó bộ lông màu xám xanh cổ điển với mắt màu đồng là màu phổ biến nhất, một số màu sắc khác như trắng, kem, bạc, vàng, nâu… tất cả đều được công nhận là màu của mèo Anh thuần chủng.</p>\r\n   <p>&nbsp;</p>\r\n   <p><img src=\"https://www.chophuquochanoi.vn/image_pq/meo-anh-long-ngan-ha-noi-cpq.vn-1492390734596.jpg\" alt=\"meo-anh-long-ngan-ha-noi-cpq.vn-1492390734596.jpg\"></p>\r\n   <p>&nbsp;</p>\r\n   <div>Mèo Anh lông ngắn thường phát triển chậm hơn so với các giống mèo khác, chúng chỉ đạt được sự trưởng thành hoàn toàn về mặt thể chất từ 3 năm tuổi trở đi. Con đực thường nặng từ 9 đến 17 pounds tương đương 4,1 kg-7,7 kg, con cái từ 7 đến 12 pounds tương đương 3,2 kg đến 5,4 kg. Dựa vào cân nặng tiêu chuẩn này hãy giữ cho chú mèo của bạn một chế độ ăn hợp lý, tránh béo phì.</div>\r\n   <p>Những chú mèo Anh lông ngắn khi không nghịch ngợm, phá phách, chạy nhảy nhiều như những giống mèo khác, tiếng kêu của chúng rất nhỏ, nhẹ. Chúng không hay đòi hỏi, phiền hà tới chủ nhân. Chúng rất thích nằm gần người, được vuốt ve. Vì vậy rất phù hợp với những gia đình có trẻ nhỏ và những chú chó thân thiện.</p>\r\n   <p>&nbsp;</p>\r\n   <p><img src=\"https://www.chophuquochanoi.vn/image_pq/meo-anh-long-ngan-an-gi-cpq.vn-1492390849568.jpg\" alt=\"meo-anh-long-ngan-an-gi-cpq.vn-1492390849568.jpg\"></p>\r\n   <p>&nbsp;</p>\r\n   <p>Việc tắm rửa với mèo Anh lông ngắn là không cần thiết. Tuy nhiên bạn nên chú ý giữ vệ sinh chỗ ở cho mèo thật sạch sẽ. Bạn nên chải lông cho chúng bằng lược hàng tuần và thường xuyên hơn khi vào mùa thay lông (mùa xuân và mùa thu). Đôi khi chúng chảy nước mắt và có gỉ, hãy lấy giấy hoặc khăn mềm, ẩm riêng biệt nhẹ nhàng thấm hai bên mắt.</p>\r\n   <p>Hãy giữ chú mèo của bạn quanh quẩn trong nhà, không nên tiếp xúc với những con mèo, con vật khác để tránh lây nhiễm bệnh tật. Bạn phải thật chú ý nếu mèo Anh lông ngắn chạy ra ngoài đường chúng rất dễ bị bắt mất bởi những kẻ muốn nuôi mèo đẹp mà không phải trả tiền hay bị xe cộ vô tình va phải.</p>');
INSERT INTO `products` VALUES (49, 'Mèo Thổ Nhĩ Kỳ Turkish Angora', 'cat', 7500000, 10, NULL, 'White', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/5-2-300x300.jpg', '2023-08-06 07:56:25.574821', '2023-08-25 02:00:02.481530', NULL, 'Giống như tên gọi mèo Angora Thổ Nhĩ Kỳ hay mèo Ankara có nguồn gốc từ vùng Ankara Thổ Nhĩ Kỳ. Đây là loài mèo độc nhất trong số những loài mèo trên đây bởi chúng có nhiều đặc điểm chung với loài chó thay vì mèo. Mèo Angora Thổ Nhĩ Kỳ không biết sủa nhưng chúng rất thông minh, có trí nhớ tốt. Bạn có thể dạy cho nó một số bài học để nó ngoan ngoãn bắt chước theo. Không những thế đây còn là giống mèo rất xinh đẹp, thanh lịch và hiếu động sẽ là sự lựa chọn tuyệt vời cho những gia đình có trẻ con và những người yêu thích sự náo nhiệt.', '<p>Giống như tên gọi mèo Angora Thổ Nhĩ Kỳ hay mèo Ankara có nguồn gốc từ vùng Ankara Thổ Nhĩ Kỳ. Đây là loài mèo độc nhất trong số những loài mèo trên đây bởi chúng có nhiều đặc điểm chung với loài chó thay vì mèo. Mèo Angora Thổ Nhĩ Kỳ không biết sủa nhưng chúng rất thông minh, có trí nhớ tốt. Bạn có thể dạy cho nó một số bài học để nó ngoan ngoãn bắt chước&nbsp;theo. Không những thế đây còn là giống mèo rất xinh đẹp, thanh lịch và hiếu động sẽ là sự lựa chọn tuyệt vời cho những gia đình có trẻ con và những người yêu thích sự náo nhiệt.</p>\r\n   <p>Giống mèo&nbsp;Turkish Angora có bộ lông dài mượt và mịn màng, màu lông phổ biến của giống mèo này là màu trắng, ngoài ra lông của chúng còn có nhiều màu sắc khác nhau như màu cam, màu vằn, màu đen, xám trắng… Mèo Thổ Nhĩ Kỳ&nbsp;Angora đặc biệt rất thích nghịch nước và ngâm mình trong nước một cách thoải mái. Mèo Angora rất khỏe mạnh, không tốn nhiều công chăm sóc nên rất dễ nuôi trở thành vật cưng trong nhiều gia đình.</p>');
INSERT INTO `products` VALUES (50, 'Mèo Van Thổ – Turkish Van', 'cat', 6500000, 10, NULL, 'White - Orange', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/4-2-300x300.jpg', '2023-08-06 07:56:58.191939', '2023-08-25 02:00:50.546275', NULL, 'Thật may mắn khi bạn sở hữu một chú mèo Van Thổ Nhĩ Kỳ – một người bạn đồng hành tuyệt vời khi nuôi trong gia đình. Mèo Van thực sự đáng yêu, duyên dáng và quyến rũ với khuôn mặt thuôn nhọn, chiếc mũi dài cân đối cùng đôi mắt to tròn cuốn h', '<p>Thật may mắn khi bạn sở hữu một chú mèo Van Thổ Nhĩ Kỳ – một người bạn đồng hành tuyệt vời khi nuôi trong gia đình. Mèo Van thực sự đáng yêu, duyên dáng và quyến rũ với khuôn mặt thuôn nhọn, chiếc mũi dài cân đối cùng đôi mắt to tròn cuốn hút.</p>\r\n   <p>Đặc biệt hơn mèo Van cũng là một trong số những giống mèo hiếm, có 2 màu mắt khác nhau, tuy vậy không phải mèo Van nào cũng sở hữu đôi mắt hai màu đặc biệt này. Đây là một giống mèo hiếm có nguồn gốc&nbsp;từ vùng Trung Á và Tây Nam Á ngày nay là các nước Iran, với đặc tính khỏe mạnh, thông minh, thân thiện và hòa nhã với mọi người, giống mèo này khá được ưa thích.</p>\r\n   <p>Mèo Van có bộ lông dài vừa ít khi rụng (1 năm thay lông 1 lần vào khoảng tháng 4) màu trắng với những đốm màu khá cân đối phía trên đầu và chiếc đuôi thường là các khoang màu đan nhau.</p>\r\n   <p>Mèo Van có thân hình dài, săn chắc cân đối với chiều cao cùng những đôi chân thẳng dài. Chúng bước đi linh hoạt, nhanh nhẹn với những bước đi rất tự tin, uyển chuyển và duyên dáng. Những chú mèo Van luôn tươi vui, lịch thiệp. Chúng thích chạy nhảy, chơi đùa cùng trẻ nhỏ và tỏ ra thân thiện với các vật nuôi khác trong gia đình.</p>');
INSERT INTO `products` VALUES (51, 'Mèo Ba Tư lông ngắn – Exotic', 'cat', 5000000, 10, NULL, 'Orange', 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/002-300x300.jpg', '2023-08-06 07:57:30.684226', '2023-08-25 02:01:42.291980', NULL, 'Mèo Exotic là giống mèo “đẹp lạ”. Chúng có nhiều vẻ tương đồng gần giống mèo Ba Tư bởi hình dáng và tính cách tương đồng, với khuôn mặt tròn, mũi ngắn tịt dễ thương ngoại trừ lớp lông ngắn, dày nên còn gọi là mèo Ba Tư lông ngắn', '<p>Mèo Exotic là giống mèo “đẹp lạ”. Chúng có nhiều vẻ tương đồng gần giống mèo Ba Tư bởi hình dáng và tính cách tương đồng, với khuôn mặt tròn, mũi ngắn tịt dễ thương ngoại trừ lớp lông ngắn, dày nên còn gọi là mèo Ba Tư lông ngắn.</p>\r\n   <p>Mèo Exotic thoạt nhìn có vẻ cau có, khó gần nhưng khi gần gũi chúng rất hiền lành và cực kỳ đáng yêu. Đôi mắt biểu cảm, “biết nói” nên bạn sẽ khó lòng từ chối bất kỳ điều gì khi đứng trước nhưng chú mèo ngây ngô này.</p>');
INSERT INTO `products` VALUES (52, 'Royal Canin BabyCat 34 ( 1 – 4 tháng ) túi 4kg', 'food', 690000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/02-4-300x300.jpg', '2023-08-06 07:58:04.268146', '2023-08-25 02:05:38.493572', NULL, 'Thức ăn mèo Babycat 34 là thức ăn phù hợp được thiết kế riêng cho các bé mèo ở sau quá trình cai sữa và ở giai đoạn mới phát triển (0 – 4 tháng). Hạt Babycat 34 đặc biệt nhỏ giúp các bé dễ ăn hơn hỗ trợ thói quen nhai thức ăn của các bé. Ở giai đoạn này phát triển này, mèo con rất cần nguồn dưỡng chất đặc biệt dễ tiêu hóa và hấp thu. Babycat 34 là sự kết hợp độc đáo các chất dinh dưỡng hỗ trợ tăng miễn dịch cho mèo con.', '<p>Thức ăn mèo Babycat 34 là thức ăn phù hợp được thiết kế riêng cho các bé mèo ở sau quá trình cai sữa và ở giai đoạn mới phát triển (0 – 4 tháng). Hạt Babycat 34 đặc biệt nhỏ giúp các bé dễ ăn hơn hỗ trợ thói quen nhai thức ăn của các bé. Ở giai đoạn này phát triển này, mèo con rất cần nguồn dưỡng chất đặc biệt dễ tiêu hóa và hấp thu. Babycat 34 là sự kết hợp độc đáo các chất dinh dưỡng hỗ trợ tăng miễn dịch cho mèo con.</p>\r\n   <p><strong>Tác dụng chính :</strong></p>\r\n   <p>– Tăng cường sức đề kháng</p>\r\n   <p>– Hỗ trợ trong việc cai sữa</p>\r\n   <p>– Kích thích tiêu hóa</p>\r\n   <p><strong>Đối Tượng Sử Dụng:</strong>&nbsp;Mèo con dưới 4 tháng tuổi</p>');
INSERT INTO `products` VALUES (53, 'Whiskas tuna 1,2kg', 'food', 190000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/05-4-300x300.jpg', '2023-08-06 07:58:29.118622', '2023-08-25 02:07:25.142931', NULL, 'Thức ăn cho mèo lớn Whiskas vị cá ngừ 1,2kg được lựa chọn từ những thành phần thịt, cá tươi ngon nhất trong chế biến, giàu protein, các vitamin và khoáng chất thiết yếu và không có chất bảo quản, mang đến tác dụng cân bằng dinh dưỡng hàng ngày cho thú cưng của bạn.', '<p><strong>Thông tin sản phẩm</strong></p>\r\n   <p>Thức ăn cho mèo lớn Whiskas vị cá ngừ 1,2kg&nbsp;được lựa chọn từ những thành phần thịt, cá tươi ngon nhất trong chế biến, giàu protein, các vitamin và khoáng chất thiết yếu và không có chất bảo quản, mang đến tác dụng cân bằng dinh dưỡng hàng ngày cho thú cưng của bạn.</p>\r\n   <p>Thức ăn cho mèo Whiskas&nbsp;được phát triển bởi các chất dinh dưỡng tối ưu và được các chuyên gia vật nuôi trên khắp thế giới công nhận là sản phẩm dinh dưỡng tốt nhất và khuyên dùng.</p>\r\n   <p>Hàm lượng dinh dưỡng&nbsp;đảm bảo cung cấp đủ&nbsp;dưỡng chất cần thiết cho sự phát triển của những chú mèo, tùy vào cân nặng và tháng tuổi bạn có thể phân bổ khối lượng thức ăn sao cho phù hợp nhất.</p>\r\n   <p>Thức ăn cho mèo lớn Whiskas vị cá ngừ 1,2kg&nbsp;được thiết kế dành riêng cho đặc thù dinh dưỡng của mèo, các hạt giàu&nbsp;chất dinh dưỡng từ thịt, hải sản để đảm bảo cho sự phát triển toàn diện cho mèo của bạn mỗi ngày. Sản phẩm được bảo quản dưới dạng gói, đảm bảo vệ sinh và an toàn cho những chú mèo đáng yêu</p>');
INSERT INTO `products` VALUES (54, 'Thức ăn cho mèo Cat’s Eye túi 7kg (trên 3 tháng)', 'food', 700000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/01-3-300x300.jpg', '2023-08-06 07:58:56.606278', '2023-08-25 02:09:08.437067', NULL, 'Cat’s eye được phối trộn đặc biệt dành cho mèo mọi lứa tuổi để giảm chứng rụng lông, cải thiện bộ lông mèo và cải thiện tiêu hóa. Với những thành phần dễ tiêu hóa và cực kỳ ngon miệng sẽ giúp tăng cường hệ thống miễn dịch, cải thiện khả năng hấp thụ dinh dưỡng, tăng cường sức khỏe đại tràng và giảm lãng phí thức ăn ăn vào của mèo.', '<p>* Dành cho mèo trên 3 tháng tuổi</p>\r\n   <p>* Tiêu hóa tốt</p>\r\n   <p>* Hỗ trợ, tăng cường hệ miễn dịch</p>\r\n   <p>* Chất xơ tự nhiên, kiểm soát rụng lông</p>\r\n   <p>* Giúp da khỏe, lông bóng mượt và giảm chứng rụng lông</p>\r\n   <p>Cat’s eye được phối trộn đặc biệt dành cho mèo mọi lứa tuổi để giảm chứng rụng lông, cải thiện bộ lông mèo và cải thiện tiêu hóa. Với những thành phần dễ tiêu hóa và cực kỳ ngon miệng sẽ giúp tăng cường hệ thống miễn dịch, cải thiện khả năng hấp thụ dinh dưỡng, tăng cường sức khỏe đại tràng và giảm lãng phí thức ăn ăn vào của mèo.</p>\r\n   <p>* Công thức chứa chất xơ tự nhiên và bột củ cải đường giúp kiểm soát chứng rụng lông.</p>\r\n   <p>* Vitamin A và taurine cho đôi mắt tươi sáng, khỏe và thị lực tốt</p>\r\n   <p>* Dinh dưỡng hoàn chỉnh với chất chống oxy hóa quan trọng và giàu đạm chất lượng cao.</p>\r\n   <p>* Dễ tiêu hóa, giúp mèo hấp thụ tối đa dinh dưỡng từ các thực phẩm có ích, tránh lãng phí thức ăn.</p>\r\n   <p>* Thịt gà chất lượng cao giúp mèo ăn ngon miệng hơn. Không màu và hương liệu nhân tạo.</p>');
INSERT INTO `products` VALUES (55, 'Cỏ mèo tự trồng Hagen Catit', 'food', 300000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/09-3-300x300.jpg', '2023-08-06 07:59:21.896406', '2023-08-25 02:10:07.884704', NULL, 'Được thành lập từ năm 1997, với 20 năm kinh nghiệm, mục tiêu của AFP và Pawise là cung cấp các sản phẩm dành cho thú cưng với chất lượng tốt nhất, an toàn nhất với 95% sản phẩm đã được xuất khẩu sang thị trường Châu Âu và Châu Mỹ.', '<p>Được thành lập từ năm 1997, với 20 năm kinh nghiệm, mục tiêu của AFP và Pawise là cung cấp các sản phẩm dành cho thú cưng với chất lượng tốt nhất, an toàn nhất với 95% sản phẩm đã được xuất khẩu sang thị trường Châu Âu và Châu Mỹ.</p>\r\n   <p>AFP và Pawise luôn cố gắng hết sức để thiết kế những sản phẩm nhằm đáp ứng các nhu cầu của vật nuôi cũng như phù hợp với phong cách của chủ nhân.</p>\r\n   <p>Với các nhà thiết kế đầy tính sáng tạo giàu kinh nghiệm, nhân viên chuyên nghiệp và đội ngũ quản lý có năng lực, AFP và Pawise đang khẳng định vị thế của mình trong lĩnh vực chăm sóc thú cưng, mong muốn mang đến những sản phẩm an toàn, đáng tin cậy cùng dịch vụ hiệu quả.</p>\r\n   <p><strong>Thông tin sản phẩm</strong></p>\r\n   <p>Sản phẩm bao gồm hạt giống cỏ và chất nền (vermiculit) để trồng. Cỏ là nguồn cung cấp chất xơ tự nhiên giúp hỗ trợ tiêu hóa ở mèo và giúp giảm búi lông trong ruột của mèo. Nên sử dụng với khay trồng cỏ cho mèo của Catit.</p>');
INSERT INTO `products` VALUES (56, 'Snack Sleeky Chews Original các size', 'food', 35000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/6-4-300x300.jpg', '2023-08-06 07:59:47.258225', '2023-08-25 02:11:23.606878', NULL, 'Bánh thưởng snack Sleeky Rawhide cho pet làm sạch răng, bổ sung chất xơ, canxi, làm chắc răng, tăng cường sức khỏe răng miệng.', '<p>Bánh thưởng snack Sleeky Rawhide cho pet làm sạch răng, bổ sung chất xơ, canxi, làm chắc răng, tăng cường sức khỏe răng miệng.</p>\r\n   <p>Nguyên liệu: &nbsp; Da, bột sữa, thịt khô</p>');
INSERT INTO `products` VALUES (57, 'SY – Bánh thưởng Steamed bread', 'food', 55000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/9-4-300x300.jpg', '2023-08-06 08:00:13.407168', '2023-08-25 02:12:13.453916', NULL, 'Bánh thưởng cho chó vừa là thức ăn cho chó thơm ngon bổ dưỡng, vừa lại là một dụng cụ hết sức hữu hiệu thường có trong các quá trình đào tạo, huấn luyện chó hay đơn giản nếu muốn chó cưng vâng lời. Được làm từ các nguyên liệu đảm bảo an toàn, với các thành phần dinh dưỡng cân đối so với cơ thể chó cưng. Tránh tình trạng quá thừa hoặc thiếu chất dẫn đến mất cân bằng dinh dưỡng (không có lợi cho sự phát triển của cơ thể thú cưng).', '<p>Bánh thưởng cho chó vừa là thức ăn cho chó thơm ngon bổ dưỡng, vừa lại là một dụng cụ hết sức hữu hiệu thường có trong các quá trình đào tạo, huấn luyện chó hay đơn giản nếu muốn chó cưng vâng lời.</p>\r\n   <p>Được làm từ các nguyên liệu đảm bảo an toàn, với các thành phần dinh dưỡng cân đối so với cơ thể chó cưng. Tránh tình trạng quá thừa hoặc thiếu chất dẫn đến mất cân bằng dinh dưỡng (không có lợi cho sự phát triển của cơ thể thú cưng).</p>');
INSERT INTO `products` VALUES (58, 'Pate Monge cá hồi và lê 100g', 'food', 35000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/1-6-300x300.jpg', '2023-08-06 08:00:33.986727', '2023-08-25 02:13:16.716737', NULL, 'Thành phần dinh dưỡng:  Đạm thô 9%, dầu và chất béo 7%, chất tro 1,2%, chất xơ 0.5%, độ ẩm 82%, chất làm đặc,  vitamin A 3000U.I./Kg, vitamin D3 400U.I./Kg, vitamin E 15mg/Kg.', '<p><strong>Trọng lượng</strong>:100gr.</p>\r\n   <p><strong>Thành phần dinh dưỡng:</strong>&nbsp;Đạm thô 9%, dầu và chất béo 7%, chất tro 1,2%, chất xơ 0.5%, độ ẩm 82%, chất làm đặc, &nbsp;vitamin A 3000U.I./Kg, vitamin D3 400U.I./Kg, vitamin E 15mg/Kg.</p>\r\n   <p><strong>Công dụng&nbsp;</strong></p>\r\n   <p>– Đây là sản phẩm giàu đạm, cung cấp canxi và các vi khuẩn có lợi từ phô mai . Giúp bổ sung các dưỡng chất cần thiết cho cơ thể , hỗ trợ quá trình tạo máu, làm chú chó luôn cảm thấy thật khỏe mạnh và thư giãn</p>\r\n   <p>– Sản phẩm giàu dinh dưỡng, &nbsp;giúp thúc đẩy sự phát triển toàn diện cho chó con và bổ sung các dưỡng chất cần thiết cho chó</p>\r\n   <p>– Thức ăn đồng thời hỗ trợ quá trình tạo máu và tăng miễn dịch cho cơ thể.</p>\r\n   <p><strong>Bảo quản</strong>: trong phòng mát, luôn giữ tươi và sạch. Trường hợp chưa dùng hết khi mở nắp, nên cất vào tủ lạnh.</p>\r\n   <p><strong>Khẩu phần hàng ngày</strong>: 5-6 hộp/ngày.</p>\r\n   <p><img class=\"aligncenter\" src=\"http://www.petcity.vn/media/lib/2409_patemongecahoivalepetcity.jpg\" alt=\"\" width=\"453\" height=\"453\"></p>');
INSERT INTO `products` VALUES (59, 'Bánh thưởng hình bóng AFP Krazy Crunch Size S 4x4x2cm', 'food', 65000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/7-5-300x300.jpg', '2023-08-06 08:01:02.195614', '2023-08-25 02:14:09.393869', NULL, 'Được thành lập từ năm 1997, với 20 năm kinh nghiệm, mục tiêu của AFP và Pawise là cung cấp các sản phẩm dành cho thú cưng với chất lượng tốt nhất, an toàn nhất với 95% sản phẩm đã được xuất khẩu sang thị trường Châu Âu và Châu Mỹ. AFP và Pawise luôn cố gắng hết sức để thiết kế những sản phẩm nhằm đáp ứng các nhu cầu của vật nuôi cũng như phù hợp với phong cách của chủ nhân.', '<p>Được thành lập từ năm 1997, với 20 năm kinh nghiệm, mục tiêu của AFP và Pawise là cung cấp các sản phẩm dành cho thú cưng với chất lượng tốt nhất, an toàn nhất với 95% sản phẩm đã được xuất khẩu sang thị trường Châu Âu và Châu Mỹ.</p>\r\n   <p>AFP và Pawise luôn cố gắng hết sức để thiết kế những sản phẩm nhằm đáp ứng các nhu cầu của vật nuôi cũng như phù hợp với phong cách của chủ nhân.</p>\r\n   <p>Với các nhà thiết kế đầy tính sáng tạo giàu kinh nghiệm, nhân viên chuyên nghiệp và đội ngũ quản lý có năng lực, AFP và Pawise đang khẳng định vị thế của mình trong lĩnh vực chăm sóc thú cưng, mong muốn mang đến những sản phẩm an toàn, đáng tin cậy cùng dịch vụ hiệu quả.</p>');
INSERT INTO `products` VALUES (60, 'Dây dắt Ferplast Ergofluo 2.5cm/120cm (xanh biển)', 'accessory', 575000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/11-2.jpg', '2023-08-07 20:48:12.345348', '2023-08-25 02:15:10.373615', NULL, 'Ferplast, có trụ sở tại Castelgomberto (tỉnh Vicenza – Ý), được thành lập vào năm 1966 bởi Carlo Vaccari. Trong 50 năm, Ferplast đã tham gia nghiên cứu và tạo ra các sản phẩm sáng tạo, an toàn với chất lượng cao nhằm đảm bảo cho sự chăm sóc thoải mái của vật nuôi. Công ty dành nhiều khoản đầu tư đáng kể cho nghiên cứu những công nghệ tiên tiến cho việc sản xuất', '<p>Ferplast, có trụ sở tại Castelgomberto (tỉnh Vicenza – Ý), được thành lập vào năm 1966 bởi Carlo Vaccari. Trong 50 năm, Ferplast đã tham gia nghiên cứu và tạo ra các sản phẩm sáng tạo, an toàn với chất lượng cao nhằm đảm bảo cho sự chăm sóc thoải mái của vật nuôi. Công ty dành nhiều khoản đầu tư đáng kể cho nghiên cứu những công nghệ tiên tiến cho việc sản xuất.</p>\r\n   <p>Là một doanh nghiệp thương mại điển hình của vùng Đông Bắc nước Ý, ngày nay Ferplast sản xuất hơn 2000 loại sản phẩm, có khoảng 1.000 nhân viên, phân phối không dưới 80 quốc gia trên thế giới và có chi nhánh tại Ý, Pháp, Đức, Anh, Scandinavia, Ba Lan, Ukraina, Slovakia, Nga, Benelux và Brazil, có 3 nhà máy sản xuất ở Ý, Ukraina và Cộng hòa Slovak.</p>');
INSERT INTO `products` VALUES (61, 'Dây dắt tự động Flexi New Comfort dây tròn xanh lá (3m – cho chó dưới 8kg)', 'accessory', 45000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/12-2.jpg', '2023-08-07 20:59:50.953585', '2023-08-25 02:17:47.096541', NULL, 'Với 300 nhân viên tại Bargteheide, Đức, cùng với toàn bộ sự sáng tạo của mình với các chú chó, họ đã tạo ra sản phẩm dây dắt Flexi với thiết kế độc quyền. Dựa vào công nghệ tiên tiến, vật liệu cao cấp, Flexi mong muốn mang đến những sản phẩm phục vụ cuộc sống cho chú chó của bạn một cách tốt đẹp nhất.', '<p>Là nhà phát minh và sản xuất dây dắt tự động đến từ Đức. Đứng đầu trong lĩnh vực này tại hơn 90 quốc gia trên toàn thế giới, Flexi là công ty tiên phong về đổi mới trong lĩnh vực phụ kiện dành cho thú cưng.</p>\r\n   <div id=\"tab_content_product_introduction\" class=\"tab-content active\">\r\n      <p>Với 300 nhân viên tại Bargteheide, Đức, cùng với toàn bộ sự sáng tạo của mình với các chú chó, họ đã tạo ra sản phẩm dây dắt Flexi với thiết kế độc quyền. Dựa vào công nghệ tiên tiến, vật liệu cao cấp, Flexi mong muốn mang đến những sản phẩm phục vụ cuộc sống cho chú chó của bạn một cách tốt đẹp nhất.</p>\r\n      <p>Năm 2010, Flexi được trao giải thưởng “Thương hiệu thế kỷ”, đây là một giải thưởng lớn ở Đức. Ngoài ra, Flexi còn được nhận các giải thưởng khác: “Giải thưởng về thiết kế” – tạp chí Dog Fancy của Mỹ trao tặng, “Sản phẩm của năm” do DOGS – tạp chí về chó hàng đầu Châu Âu trao tặng.</p>\r\n      <p>Tuy nhiên, đối với Flexi, phần thưởng quý giá nhất vẫn là sự hài lòng của hàng triệu người nuôi chó trên toàn thế giới.</p>\r\n   </div>');
INSERT INTO `products` VALUES (62, 'Lồng vận chuyển Ferplast Atlas Professional 70 (101x69x76cm)', 'accessory', 2450000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/013-1.jpg', '2023-08-07 21:00:20.390445', '2023-08-25 02:19:02.784680', NULL, 'Có nắp cà tiện dụng, thiết kế hiện đại thoáng mát, giúp thú cưng nhà bạn cực kỳ thoải mái trong các chuyến đi xa. Chất liệu nhựa cao cấp, không chứa chất độc hại, không gây kích ứng. Vali đạt chuẩn qui định IATA giúp có thể vận chuyển dễ dàng thú cưng khi đi máy bay, tàu thủy hoặc tàu hỏa. Với thiết kế khóa an toàn, tay cầm tiện lợi cùng với loại nhựa tốt đến từ Ý sẽ tạo sự an toàn nhất cho thú cưng.', '<p class=\"clr\">Có nắp cà tiện dụng, thiết kế hiện đại thoáng mát, giúp thú cưng nhà bạn cực kỳ thoải mái trong các chuyến đi xa.<em><strong>Lồng vận chuyển</strong></em>&nbsp;cho chó mèo, chất liệu tốt, bền, đẹp, chắc chắn.</p>\r\n   <p class=\"clr\">Chất liệu nhựa cao cấp, không chứa chất độc hại, không gây kích ứng</p>\r\n   <p class=\"clr\">Vali đạt chuẩn qui định IATA giúp có thể vận chuyển dễ dàng thú cưng khi đi máy bay, tàu thủy hoặc tàu hỏa. Với thiết kế khóa an toàn, tay cầm tiện lợi cùng với loại nhựa tốt đến từ Ý sẽ tạo sự an toàn nhất cho thú cưng.</p>\r\n   <p class=\"clr\">&nbsp;Kích thước: 101x69x76cm</p>\r\n   <p class=\"clr\"><img class=\"aligncenter\" src=\"http://www.petcity.vn/media/lib/2740_longferplast13petcity.png\" alt=\"\" width=\"500\" height=\"270\"></p>\r\n   <p class=\"clr\"><img class=\"aligncenter\" src=\"http://www.petcity.vn/media/lib/2740_longferplast14petcity.png\" alt=\"\" width=\"745\" height=\"236\"></p>\r\n   <p class=\"clr\"><img class=\"aligncenter\" src=\"http://www.petcity.vn/media/lib/2740_longferplast15petcity.png\" alt=\"\" width=\"751\" height=\"238\"></p>');
INSERT INTO `products` VALUES (63, 'Túi Nylon Trung ( Ngựa vằn )', 'accessory', 500000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/14-1.jpg', '2023-08-07 21:00:46.659365', '2023-08-25 03:43:11.000000', NULL, 'Túi Nylon Trung  cho chó mèo, kiểu dáng và màu sắc đẹp, hấp dẫn thú cưng nhà bạn, chất liệu bền, chắc chắn, bán rẻ nhất. Có tay cầm, có khóa kéo, có lỗ thoáng gió. Giúp thú cưng thoải mái, không kích ứng da', '<p>+&nbsp;Túi Nylon Trung cho chó mèo, kiểu dáng và màu sắc đẹp, hấp dẫn thú cưng nhà bạn, chất liệu bền, chắc chắn, bán rẻ nhất</p>\r\n   <p>+ Có tay cầm, có khóa kéo, có lỗ thoáng gió.</p>\r\n   <p>+ Dễ sử dụng</p>\r\n   <p>+Giúp bạn đi đâu cũng có thể mang thú cưng đi bên cạnh mình một cách thoải mái nhất, tiện lợi nhất</p>\r\n   <p>Giúp thú cưng thoải mái, không kích ứng da</p>');
INSERT INTO `products` VALUES (64, 'Túi xách Pawise Voyage Travel 49x46x34cm', 'accessory', 550000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/13-1.jpg', '2023-08-07 21:01:15.239013', '2023-08-25 02:22:37.786114', NULL, 'Với các nhà thiết kế đầy tính sáng tạo giàu kinh nghiệm, nhân viên chuyên nghiệp và đội ngũ quản lý có năng lực, AFP và Pawise đang khẳng định vị thế của mình trong lĩnh vực chăm sóc thú cưng, mong muốn mang đến những sản phẩm an toàn, đáng tin cậy cùng dịch vụ hiệu quả.', '<p>Được thành lập từ năm 1997, với 20 năm kinh nghiệm, mục tiêu của AFP và Pawise là cung cấp các sản phẩm dành cho thú cưng với chất lượng tốt nhất, an toàn nhất với 95% sản phẩm đã được xuất khẩu sang thị trường Châu Âu và Châu Mỹ.</p>\r\n   <p>AFP và Pawise luôn cố gắng hết sức để thiết kế những sản phẩm nhằm đáp ứng các nhu cầu của vật nuôi cũng như phù hợp với phong cách của chủ nhân.</p>\r\n   <p>Với các nhà thiết kế đầy tính sáng tạo giàu kinh nghiệm, nhân viên chuyên nghiệp và đội ngũ quản lý có năng lực, AFP và Pawise đang khẳng định vị thế của mình trong lĩnh vực chăm sóc thú cưng, mong muốn mang đến những sản phẩm an toàn, đáng tin cậy cùng dịch vụ hiệu quả.</p>');
INSERT INTO `products` VALUES (65, 'Vòng cổ da Ferplast Natural 2.5/37-45cm (màu đen)', 'accessory', 420000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/010-2.jpg', '2023-08-07 21:01:41.283483', '2023-08-25 02:24:30.695181', NULL, 'Ferplast, có trụ sở tại Castelgomberto (tỉnh Vicenza – Ý), được thành lập vào năm 1966 bởi Carlo Vaccari. Trong 50 năm, Ferplast đã tham gia nghiên cứu và tạo ra các sản phẩm sáng tạo, an toàn với chất lượng cao nhằm đảm bảo cho sự chăm sóc thoải mái của vật nuôi. Công ty dành nhiều khoản đầu tư đáng kể cho nghiên cứu những công nghệ tiên tiến cho việc sản xuấ', '<p>Ferplast, có trụ sở tại Castelgomberto (tỉnh Vicenza – Ý), được thành lập vào năm 1966 bởi Carlo Vaccari. Trong 50 năm, Ferplast đã tham gia nghiên cứu và tạo ra các sản phẩm sáng tạo, an toàn với chất lượng cao nhằm đảm bảo cho sự chăm sóc thoải mái của vật nuôi. Công ty dành nhiều khoản đầu tư đáng kể cho nghiên cứu những công nghệ tiên tiến cho việc sản xuất.</p>\r\n   <p>Là một doanh nghiệp thương mại điển hình của vùng Đông Bắc nước Ý, ngày nay Ferplast sản xuất hơn 2000 loại sản phẩm, có khoảng 1.000 nhân viên, phân phối không dưới 80 quốc gia trên thế giới và có chi nhánh tại Ý, Pháp, Đức, Anh, Scandinavia, Ba Lan, Ukraina, Slovakia, Nga, Benelux và Brazil, có 3 nhà máy sản xuất ở Ý, Ukraina và Cộng hòa Slovak.</p>');
INSERT INTO `products` VALUES (66, 'Vòng cổ da Ferplast Natural 2.5/45-53cm (màu tự nhiên)', 'accessory', 350000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/012-2.jpg', '2023-08-07 21:02:15.084546', '2023-08-25 02:25:27.941328', NULL, 'Ferplast, có trụ sở tại Castelgomberto (tỉnh Vicenza – Ý), được thành lập vào năm 1966 bởi Carlo Vaccari. Trong 50 năm, Ferplast đã tham gia nghiên cứu và tạo ra các sản phẩm sáng tạo, an toàn với chất lượng cao nhằm đảm bảo cho sự chăm sóc thoải mái của vật nuôi. Công ty dành nhiều khoản đầu tư đáng kể cho nghiên cứu những công nghệ tiên tiến cho việc sản xuất', '<p>Ferplast, có trụ sở tại Castelgomberto (tỉnh Vicenza – Ý), được thành lập vào năm 1966 bởi Carlo Vaccari. Trong 50 năm, Ferplast đã tham gia nghiên cứu và tạo ra các sản phẩm sáng tạo, an toàn với chất lượng cao nhằm đảm bảo cho sự chăm sóc thoải mái của vật nuôi. Công ty dành nhiều khoản đầu tư đáng kể cho nghiên cứu những công nghệ tiên tiến cho việc sản xuất.</p>\r\n   <p>Là một doanh nghiệp thương mại điển hình của vùng Đông Bắc nước Ý, ngày nay Ferplast sản xuất hơn 2000 loại sản phẩm, có khoảng 1.000 nhân viên, phân phối không dưới 80 quốc gia trên thế giới và có chi nhánh tại Ý, Pháp, Đức, Anh, Scandinavia, Ba Lan, Ukraina, Slovakia, Nga, Benelux và Brazil, có 3 nhà máy sản xuất ở Ý, Ukraina và Cộng hòa Slovak.</p>');
INSERT INTO `products` VALUES (67, 'Vòng cổ Ferplast Ergoflex 1.5/21-25cm (xám)', 'accessory', 320000, 10, NULL, NULL, 'http://mauweb.monamedia.net/dogcatshop/wp-content/uploads/2018/04/10-4.jpg', '2023-08-07 21:02:39.886084', '2023-08-25 02:26:55.645784', NULL, 'Ferplast, có trụ sở tại Castelgomberto (tỉnh Vicenza – Ý), được thành lập vào năm 1966 bởi Carlo Vaccari. Trong 50 năm, Ferplast đã tham gia nghiên cứu và tạo ra các sản phẩm sáng tạo, an toàn với chất lượng cao nhằm đảm bảo cho sự chăm sóc thoải mái của vật nuôi. Công ty dành nhiều khoản đầu tư đáng kể cho nghiên cứu những công nghệ tiên tiến cho việc sản xuất.', '<p>Ferplast, có trụ sở tại Castelgomberto (tỉnh Vicenza – Ý), được thành lập vào năm 1966 bởi Carlo Vaccari. Trong 50 năm, Ferplast đã tham gia nghiên cứu và tạo ra các sản phẩm sáng tạo, an toàn với chất lượng cao nhằm đảm bảo cho sự chăm sóc thoải mái của vật nuôi. Công ty dành nhiều khoản đầu tư đáng kể cho nghiên cứu những công nghệ tiên tiến cho việc sản xuất.</p>\r\n   <p>Là một doanh nghiệp thương mại điển hình của vùng Đông Bắc nước Ý, ngày nay Ferplast sản xuất hơn 2000 loại sản phẩm, có khoảng 1.000 nhân viên, phân phối không dưới 80 quốc gia trên thế giới và có chi nhánh tại Ý, Pháp, Đức, Anh, Scandinavia, Ba Lan, Ukraina, Slovakia, Nga, Benelux và Brazil, có 3 nhà máy sản xuất ở Ý, Ukraina và Cộng hòa Slovak.</p>');

-- ----------------------------
-- Table structure for userConversations
-- ----------------------------
DROP TABLE IF EXISTS `userConversations`;
CREATE TABLE `userConversations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deleted_at` datetime(6) NULL DEFAULT NULL,
  `customer_id` int NULL DEFAULT NULL,
  `conversation_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_27439105a53889b19cba030384d`(`customer_id` ASC) USING BTREE,
  INDEX `FK_b4e4da43b27f46b3af20e566b17`(`conversation_id` ASC) USING BTREE,
  CONSTRAINT `FK_27439105a53889b19cba030384d` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_b4e4da43b27f46b3af20e566b17` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userConversations
-- ----------------------------
INSERT INTO `userConversations` VALUES (1, '2024-01-03 04:02:02.658132', '2024-01-05 10:29:27.878534', NULL, 1, 2);
INSERT INTO `userConversations` VALUES (2, '2024-01-03 08:31:34.213941', '2024-01-05 10:29:29.477078', NULL, 12, 3);
INSERT INTO `userConversations` VALUES (3, '2024-01-04 04:16:13.277544', '2024-01-05 10:29:31.363181', NULL, 8, 4);
INSERT INTO `userConversations` VALUES (5, '2024-01-11 02:55:00.330632', '2024-01-11 02:55:00.330632', NULL, 16, 6);

SET FOREIGN_KEY_CHECKS = 1;
