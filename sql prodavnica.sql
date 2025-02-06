-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: prodavnicadb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `kategorije`
--

DROP TABLE IF EXISTS `kategorije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategorije` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategorije`
--

LOCK TABLES `kategorije` WRITE;
/*!40000 ALTER TABLE `kategorije` DISABLE KEYS */;
INSERT INTO `kategorije` VALUES (1,'Elektronika'),(2,'Odeća'),(3,'Hrana'),(4,'Knjige'),(5,'Nameštaj');
/*!40000 ALTER TABLE `kategorije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `korisnici` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(100) DEFAULT NULL,
  `prezime` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `adresa` varchar(255) DEFAULT NULL,
  `telefon` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnici`
--

LOCK TABLES `korisnici` WRITE;
/*!40000 ALTER TABLE `korisnici` DISABLE KEYS */;
INSERT INTO `korisnici` VALUES (1,'Nikola','Dackovic','nikola@example.com','Ulica 1, Beograd','0612345678'),(2,'Marko','Petrovic','marko@example.com','Ulica 2, Novi Sad','0623456789'),(3,'Ana','Jovanovic','ana@example.com','Ulica 3, Nis','0634567890');
/*!40000 ALTER TABLE `korisnici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porudzbine`
--

DROP TABLE IF EXISTS `porudzbine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `porudzbine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `korisnik_id` int DEFAULT NULL,
  `datum_porudzbine` date DEFAULT NULL,
  `ukupna_cena` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `korisnik_id` (`korisnik_id`),
  CONSTRAINT `porudzbine_ibfk_1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `porudzbine`
--

LOCK TABLES `porudzbine` WRITE;
/*!40000 ALTER TABLE `porudzbine` DISABLE KEYS */;
INSERT INTO `porudzbine` VALUES (1,1,'2025-02-06',750.99),(2,2,'2025-02-06',17.99),(3,3,'2025-02-06',28.99);
/*!40000 ALTER TABLE `porudzbine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proizvodi`
--

DROP TABLE IF EXISTS `proizvodi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proizvodi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  `kolicina` int DEFAULT NULL,
  `kategorija_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kategorija_id` (`kategorija_id`),
  CONSTRAINT `proizvodi_ibfk_1` FOREIGN KEY (`kategorija_id`) REFERENCES `kategorije` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proizvodi`
--

LOCK TABLES `proizvodi` WRITE;
/*!40000 ALTER TABLE `proizvodi` DISABLE KEYS */;
INSERT INTO `proizvodi` VALUES (1,'Laptop Lenovo',750.99,10,1),(2,'Smartphone Samsung',599.49,20,1),(3,'Majica Crna',15.99,50,2),(4,'Čokolada Milka',2.49,100,3),(5,'Stolica Drvena',89.99,15,5),(6,'Knjiga - SQL za početnike',25.50,30,4);
/*!40000 ALTER TABLE `proizvodi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stavke_porudzbine`
--

DROP TABLE IF EXISTS `stavke_porudzbine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stavke_porudzbine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `porudzbina_id` int DEFAULT NULL,
  `proizvod_id` int DEFAULT NULL,
  `kolicina` int DEFAULT NULL,
  `cena` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `porudzbina_id` (`porudzbina_id`),
  KEY `proizvod_id` (`proizvod_id`),
  CONSTRAINT `stavke_porudzbine_ibfk_1` FOREIGN KEY (`porudzbina_id`) REFERENCES `porudzbine` (`id`),
  CONSTRAINT `stavke_porudzbine_ibfk_2` FOREIGN KEY (`proizvod_id`) REFERENCES `proizvodi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stavke_porudzbine`
--

LOCK TABLES `stavke_porudzbine` WRITE;
/*!40000 ALTER TABLE `stavke_porudzbine` DISABLE KEYS */;
INSERT INTO `stavke_porudzbine` VALUES (1,1,1,1,750.99),(2,2,3,1,15.99),(3,3,4,1,2.49),(4,3,6,1,25.50);
/*!40000 ALTER TABLE `stavke_porudzbine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-06 23:57:43
