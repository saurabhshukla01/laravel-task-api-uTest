-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: task_database
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `due_date` date NOT NULL,
  `status` enum('Pending','In Progress','Completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_user_id_foreign` (`user_id`),
  CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,1,'Facilis in enim.','Accusamus laboriosam qui alias et ipsa eos. Ex dolor ratione nostrum voluptatem qui reprehenderit rerum consequatur. Tempora sunt repudiandae quas.','2025-11-04','Completed','2025-05-21 01:12:34','2025-05-21 01:12:34'),(2,1,'Omnis et et est.','Ut earum nesciunt praesentium velit omnis molestias. Quasi aut veritatis iste. Sit enim corrupti ut et accusantium. In sed occaecati provident non sit et modi. Ea sunt magni aut consequatur est.','2025-10-29','Completed','2025-05-21 01:12:34','2025-05-21 01:12:34'),(3,1,'Laborum aspernatur ullam velit quia odit.','Natus vero velit rerum ad. Voluptatem non tempora sed quia. Pariatur sint unde porro aut magni vitae. Occaecati aut soluta reiciendis.','2025-06-29','Completed','2025-05-21 01:12:34','2025-05-21 01:12:34'),(4,1,'Aliquam ipsam quod doloremque libero.','Rerum quis sit et velit molestias hic amet vero. Magnam sint ipsam quia deleniti. Perspiciatis consectetur rem inventore aperiam quibusdam.','2025-11-27','In Progress','2025-05-21 01:12:34','2025-05-21 01:12:34'),(5,1,'Qui cupiditate iure.','Fugiat dolorem qui tempora sed eos exercitationem fugiat et. Placeat esse molestiae laboriosam consequatur consectetur quidem. Exercitationem fuga ut explicabo dolores aperiam.','2026-01-07','Completed','2025-05-21 01:12:34','2025-05-21 01:12:34'),(6,1,'Molestiae aut amet nihil aut.','Omnis nihil et tenetur qui nemo at omnis. Dolore tenetur cupiditate eligendi dolor dignissimos voluptatum aliquid. Aliquam explicabo quia et possimus qui. Dolores tenetur facilis incidunt deleniti laudantium ut.','2026-03-04','Completed','2025-05-21 01:12:34','2025-05-21 01:12:34'),(7,1,'Nihil perspiciatis qui impedit beatae.','Libero consequatur aliquid dolorem dicta cumque dolores. Debitis quae qui ipsum nostrum autem sit. Soluta amet ea voluptas quis officiis. Eum provident molestias pariatur quas voluptas.','2025-07-26','In Progress','2025-05-21 01:12:34','2025-05-21 01:12:34'),(8,2,'Quia illum eaque in id.','Ratione magnam cumque dolorem fugit. Accusantium dolorem quisquam qui veritatis officiis architecto recusandae in. Recusandae sapiente modi aut sunt. Ab sunt in magni sed. Minima non non possimus aliquam.','2026-02-01','In Progress','2025-05-21 01:12:34','2025-05-21 01:12:34'),(9,2,'Qui officia deleniti illo nesciunt omnis.','Magni voluptates neque alias qui deserunt dolorem. Qui est enim omnis nobis molestiae animi deserunt placeat. Rerum dignissimos sit amet minus sunt provident deleniti.','2025-11-14','Completed','2025-05-21 01:12:34','2025-05-21 01:12:34'),(10,2,'Eaque in expedita.','Esse quis laboriosam rerum quisquam reprehenderit sapiente. Quo reprehenderit ab dolorum omnis consequatur voluptatem. Maiores quam delectus accusamus magnam. Veritatis repellendus repudiandae itaque autem sunt iste maxime. Inventore adipisci repellat voluptas qui corrupti.','2025-05-22','Pending','2025-05-21 01:12:34','2025-05-21 01:12:34'),(11,2,'Ea eligendi sit voluptatum dolores corporis.','Expedita vero illo et recusandae et omnis. Neque id aliquam nostrum cum et exercitationem. Ut sit neque nulla assumenda aliquid repudiandae aut illo. Consequatur laboriosam sunt alias voluptas. Ipsa blanditiis libero eum aut repellat facilis.','2025-10-20','In Progress','2025-05-21 01:12:34','2025-05-21 01:12:34'),(12,2,'Nisi molestias architecto voluptas.','Impedit odit non quo laborum. Aut voluptate ut nam tempora dolores doloribus. Atque impedit voluptates aut rerum est. Minus inventore est aut consectetur amet ducimus vel et.','2025-10-18','In Progress','2025-05-21 01:12:34','2025-05-21 01:12:34'),(13,2,'Ullam beatae sint ullam cum illum.','Eum neque vero qui molestiae quo vel quo. Rem adipisci ratione repudiandae deserunt est. Exercitationem natus aliquam aut. Exercitationem nesciunt ex molestiae voluptatem iure sint culpa expedita.','2026-05-03','Pending','2025-05-21 01:12:34','2025-05-21 01:12:34'),(14,2,'Qui ratione officiis ut quam.','Dolores fugiat ut praesentium minus dolor dolorem quos. Molestias occaecati facere qui voluptas facere aut. Magnam omnis et quia possimus.','2025-09-22','In Progress','2025-05-21 01:12:34','2025-05-21 01:12:34'),(15,3,'Nesciunt nihil quaerat esse.','Voluptas dolores necessitatibus vero doloribus non et vel culpa. Et dolorum sunt placeat ut. Ab consectetur qui praesentium voluptatum eius debitis.','2025-06-28','Completed','2025-05-21 01:12:34','2025-05-21 01:12:34'),(16,3,'Qui impedit sequi voluptate explicabo sit.','Itaque possimus necessitatibus architecto id occaecati. Velit commodi et labore ullam quod est maxime inventore. Consequatur est placeat tempore dignissimos similique dolorem sequi. Dolorem id autem vel labore consequatur sunt quam.','2025-07-17','Completed','2025-05-21 01:12:34','2025-05-21 01:12:34'),(17,3,'Eius sequi ex.','Amet in totam eos vitae. Officia et ut dolore. Illo id doloribus aspernatur sint totam. Et consequuntur consequuntur amet.','2025-12-24','Pending','2025-05-21 01:12:34','2025-05-21 01:12:34'),(18,3,'Ut non aut deserunt eos.','Voluptas voluptates voluptate ut qui. Fugiat cumque quo minus dolore. Libero pariatur est maiores et necessitatibus amet aut exercitationem. Sed nulla nihil alias.','2026-01-02','Pending','2025-05-21 01:12:34','2025-05-21 01:12:34'),(19,3,'Aut alias et aut.','Dolorem aspernatur omnis minima minima eum necessitatibus. Est nesciunt impedit aut explicabo sed sequi. Dolorem eaque soluta quibusdam illo tempora autem. Sed et error vitae est pariatur autem laudantium.','2025-10-09','Completed','2025-05-21 01:12:34','2025-05-21 01:12:34'),(20,3,'Deserunt in esse.','Voluptatem provident dolor magnam consequatur harum totam vel. Est quisquam accusantium sit at suscipit. Cupiditate et atque quidem ea tenetur.','2025-12-27','Pending','2025-05-21 01:12:34','2025-05-21 01:12:34'),(21,3,'Excepturi facilis ad enim.','Qui reprehenderit maiores debitis tenetur ab. Atque et odit tenetur ipsa temporibus. Explicabo commodi facilis ullam repellat omnis sit laborum. Et aliquam ut est fugiat officia maiores commodi.','2026-02-13','Pending','2025-05-21 01:12:34','2025-05-21 01:12:34');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-21 12:29:51
