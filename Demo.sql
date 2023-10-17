/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `descr` varchar(200) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `likes` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `res` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int NOT NULL,
  `food_id` int NOT NULL,
  `amount` int NOT NULL,
  `code_` varchar(200) DEFAULT NULL,
  `arr_sub` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`food_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `amount` int NOT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`res_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `res` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `res` (
  `id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(200) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `descr` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(200) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`id`, `food_name`, `image`, `price`, `descr`, `type_id`) VALUES
(1, 'gà', 'ga.img', 2, 'gà chuẩn vị', 1);
INSERT INTO `food` (`id`, `food_name`, `image`, `price`, `descr`, `type_id`) VALUES
(2, 'vịt', 'vit.img', 3, 'vịt hầm', 2);
INSERT INTO `food` (`id`, `food_name`, `image`, `price`, `descr`, `type_id`) VALUES
(3, 'cơm', 'com.img', 1, 'cơm chiên', 1);
INSERT INTO `food` (`id`, `food_name`, `image`, `price`, `descr`, `type_id`) VALUES
(4, 'phở', 'phobo.img', 2, 'phở bò', 2);

INSERT INTO `food_type` (`id`, `type_name`) VALUES
(1, 'mặn');
INSERT INTO `food_type` (`id`, `type_name`) VALUES
(2, 'ngọt');
INSERT INTO `food_type` (`id`, `type_name`) VALUES
(3, 'mặn');
INSERT INTO `food_type` (`id`, `type_name`) VALUES
(4, 'ngọt');

INSERT INTO `likes` (`user_id`, `res_id`, `date_like`) VALUES
(1, 1, '2022-07-08 00:00:00');
INSERT INTO `likes` (`user_id`, `res_id`, `date_like`) VALUES
(1, 4, '2022-07-08 00:00:00');
INSERT INTO `likes` (`user_id`, `res_id`, `date_like`) VALUES
(2, 1, '2022-07-08 00:00:00');
INSERT INTO `likes` (`user_id`, `res_id`, `date_like`) VALUES
(2, 3, '2022-07-08 00:00:00'),
(2, 4, '2023-10-09 17:00:00'),
(3, 1, '2022-07-08 00:00:00'),
(3, 2, '2022-07-08 00:00:00'),
(3, 3, '2022-07-08 00:00:00'),
(3, 4, '2022-07-08 00:00:00'),
(4, 4, '2022-07-08 00:00:00'),
(5, 4, '2022-07-08 00:00:00');

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code_`, `arr_sub`) VALUES
(1, 1, 1, 'a1', 'số 1 nha');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code_`, `arr_sub`) VALUES
(1, 3, 2, 'a2', 'số 3 nha');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code_`, `arr_sub`) VALUES
(2, 1, 3, 'a2', 'số 2 nha');
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code_`, `arr_sub`) VALUES
(3, 2, 3, 'a3', 'số 3 nha'),
(4, 1, 3, 'a4', 'số 4 nha'),
(4, 3, 3, 'a5', 'số 5 nha');

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 2, 3, '2022-07-08 00:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(1, 4, 5, '2023-10-17 08:35:59');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(2, 3, 4, '2022-07-08 00:00:00');
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`) VALUES
(3, 1, 5, '2022-07-08 00:00:00'),
(3, 2, 2, '2022-07-10 00:00:00'),
(4, 4, 4, '2022-07-08 00:00:00');

INSERT INTO `res` (`id`, `res_name`, `image`, `descr`) VALUES
(1, 'nhà hàng 1', 'hình ảnh 1', 'mô tả 1');
INSERT INTO `res` (`id`, `res_name`, `image`, `descr`) VALUES
(2, 'nhà hàng 2', 'hình ảnh 2', 'mô tả 2');
INSERT INTO `res` (`id`, `res_name`, `image`, `descr`) VALUES
(3, 'nhà hàng 3', 'hình ảnh 3', 'mô tả 3');
INSERT INTO `res` (`id`, `res_name`, `image`, `descr`) VALUES
(4, 'nhà hàng 4', 'hình ảnh 4', 'mô tả 4'),
(5, 'nhà hàng 1', 'hình ảnh 1', 'mô tả 1'),
(6, 'nhà hàng 2', 'hình ảnh 2', 'mô tả 2'),
(7, 'nhà hàng 3', 'hình ảnh 3', 'mô tả 3'),
(8, 'nhà hàng 4', 'hình ảnh 4', 'mô tả 4');

INSERT INTO `users` (`id`, `full_name`, `email`, `password`) VALUES
(1, 'Lê A', 'leA@gmail.com', '1234');
INSERT INTO `users` (`id`, `full_name`, `email`, `password`) VALUES
(2, 'Lê B', 'leB@gmail.com', '1234');
INSERT INTO `users` (`id`, `full_name`, `email`, `password`) VALUES
(3, 'Lê C', 'leC@gmail.com', '1234');
INSERT INTO `users` (`id`, `full_name`, `email`, `password`) VALUES
(4, 'Lê D', 'leD@gmail.com', '1234'),
(5, 'Lê E', 'leE@gmail.com', '123'),
(6, 'Lê F', 'leF@gmail.com', '1234');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;