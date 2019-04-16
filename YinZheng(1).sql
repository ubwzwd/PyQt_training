CREATE DATABASE  IF NOT EXISTS `yinzheng` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `yinzheng`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: yinzheng
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arena`
--

DROP TABLE IF EXISTS `arena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `arena` (
  `arena_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arena_name` varchar(100) DEFAULT NULL,
  `team_name` varchar(50) DEFAULT NULL,
  `attend_number` int(11) DEFAULT NULL,
  `attend_per_game` int(11) DEFAULT NULL,
  PRIMARY KEY (`arena_id`),
  KEY `arena` (`team_name`),
  CONSTRAINT `arena` FOREIGN KEY (`team_name`) REFERENCES `team` (`name_initial`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arena`
--

LOCK TABLES `arena` WRITE;
/*!40000 ALTER TABLE `arena` DISABLE KEYS */;
INSERT INTO `arena` VALUES (1,'Fiserv Forum','MIL',703610,17590),(2,'Oracle Arena','GSW',803436,19596),(3,'Scotiabank Arena','TOR',812822,19825),(4,'Vivint Smart Home Arena','UTA',732240,18306),(5,'Toyota Center','HOS',740392,18058),(6,'Moda Center','POR',779531,19488),(7,'Pepsi Center','DEN',740125,18503),(8,'TD Garden','BOS',763584,18624),(9,'Chesapeake Energy Arena','OKC',728120,18203),(10,'Bankers Life Fieldhouse','IND',689310,16812),(11,'Wells Fargo Center','PHI',818145,20454),(12,'AT&T Center','SAS',731987,18300),(13,'STAPLES Center','LAC',692672,17317),(14,'Amway Center','ORL',720024,17431),(15,'AmericanAirlines Arena','MIA',785111,19628),(16,'Barclays Center','BRK',594865,14872),(17,'American Airlines Center','DAL',799528,19988),(18,'Golden 1 Center','SAC',700975,17097),(19,'Little Caesars Arena','DET',656161,16404),(20,'Target Center','MIN',611424,15286),(21,'Smoothie King Center','NOP',639093,15977),(22,'STAPLES Center','LAL',759880,18997),(23,'Spectrum Center','CHO',658851,16471),(24,'FedEx Forum','MEM',620538,15513),(25,'Capital One Arena','WAS',696587,17372),(26,'State Farm Arena','ATL',611297,15282),(27,'United Center','CHI',802125,20053),(28,'Talking Stick Resort Arena','PHO',627023,15293),(29,'Madison Square Garden (IV)','NYK',759275,18982),(30,'Quicken Loans Arena','CLE',773905,19348);
/*!40000 ALTER TABLE `arena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `coach` (
  `coach_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coach_name` varchar(50) NOT NULL,
  PRIMARY KEY (`coach_id`),
  UNIQUE KEY `coach_name` (`coach_name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (19,'Alvin Gentry'),(21,'Billy Donovan'),(2,'Brad Stevens'),(23,'Brett Brown'),(26,'Dave Joerger'),(20,'David Fizdale'),(13,'Doc Rivers'),(9,'Dwane Casey'),(16,'Erik Spoelstra'),(27,'Gregg Popovich'),(24,'Igor Kokoskov'),(15,'J.B. Bickerstaff'),(5,'James Borrego'),(4,'Jim Boylen'),(3,'Kenny Atkinson'),(6,'Larry Drew'),(1,'Lloyd Pierce'),(14,'Luke Walton'),(17,'Mike Budenholzer'),(11,'Mike D\'Antoni'),(8,'Mike Malone'),(12,'Nate McMillan'),(28,'Nick Nurse'),(29,'Quin Snyder'),(7,'Rick Carlisle'),(18,'Ryan Saunders'),(30,'Scott Brooks'),(22,'Steve Clifford'),(10,'Steve Kerr'),(25,'Terry Stotts');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_play_off`
--

DROP TABLE IF EXISTS `current_play_off`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `current_play_off` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coach_name` varchar(50) NOT NULL,
  `team` varchar(50) NOT NULL,
  `games` int(11) DEFAULT NULL,
  `win` int(11) DEFAULT NULL,
  `lose` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `play_off_coach_name` (`coach_name`),
  KEY `play_off_team` (`team`),
  CONSTRAINT `play_off_coach_name` FOREIGN KEY (`coach_name`) REFERENCES `coach` (`coach_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `play_off_team` FOREIGN KEY (`team`) REFERENCES `team` (`name_initial`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_play_off`
--

LOCK TABLES `current_play_off` WRITE;
/*!40000 ALTER TABLE `current_play_off` DISABLE KEYS */;
INSERT INTO `current_play_off` VALUES (1,'Lloyd Pierce','ATL',0,0,0),(2,'Brad Stevens','BOS',0,0,0),(3,'Kenny Atkinson','BRK',0,0,0),(4,'Jim Boylen','CHI',0,0,0),(5,'James Borrego','CHO',0,0,0),(6,'Larry Drew','CLE',0,0,0),(7,'Rick Carlisle','DAL',0,0,0),(8,'Mike Malone','DEN',0,0,0),(9,'Dwane Casey','DET',0,0,0),(10,'Steve Kerr','GSW',0,0,0),(12,'Nate McMillan','IND',0,0,0),(13,'Doc Rivers','LAC',0,0,0),(14,'Luke Walton','LAL',0,0,0),(15,'J.B. Bickerstaff','MEM',0,0,0),(16,'Erik Spoelstra','MIA',0,0,0),(17,'Mike Budenholzer','MIL',0,0,0),(18,'Ryan Saunders','MIN',0,0,0),(19,'Alvin Gentry','NOP',0,0,0),(20,'David Fizdale','NYK',0,0,0),(21,'Billy Donovan','OKC',0,0,0),(22,'Steve Clifford','ORL',0,0,0),(23,'Brett Brown','PHI',0,0,0),(24,'Igor Kokoskov','PHO',0,0,0),(25,'Terry Stotts','POR',0,0,0),(26,'Dave Joerger','SAC',0,0,0),(27,'Gregg Popovich','SAS',0,0,0),(28,'Nick Nurse','TOR',0,0,0),(29,'Quin Snyder','UTA',0,0,0),(30,'Scott Brooks','WAS',0,0,0);
/*!40000 ALTER TABLE `current_play_off` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `player` (
  `player_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_number` int(11) NOT NULL,
  `player_name` varchar(50) NOT NULL,
  `team_initial` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `game_played` int(11) DEFAULT '0',
  `game_start_up` int(11) DEFAULT '0',
  `minutes_played` int(11) DEFAULT '0',
  `FG` int(11) DEFAULT '0',
  PRIMARY KEY (`player_id`),
  KEY `team_initial` (`team_initial`),
  CONSTRAINT `team_initial` FOREIGN KEY (`team_initial`) REFERENCES `team` (`name_initial`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,1,'Alex Abrines','OKC',25,31,2,588,56),(2,2,'Quincy Acy','PHO',28,10,0,123,4),(3,3,'Jaylen Adams','ATL',22,33,1,419,38),(4,4,'Steven Adams','OKC',25,78,78,2621,477),(5,5,'Bam Adebayo','MIA',21,80,27,1872,268),(6,6,'Deng Adel','CLE',21,18,3,190,11),(7,7,'DeVaughn Akoon-Purcell','DEN',25,7,0,22,3),(8,8,'LaMarcus Aldridge','SAS',33,80,80,2651,669),(9,9,'Rawle Alkins','CHI',21,8,1,88,10),(10,10,'Grayson Allen','UTA',23,36,1,362,56),(11,11,'Jarrett Allen','BRK',20,79,79,2074,335),(12,12,'Kadeem Allen','NYK',26,18,1,387,62),(13,13,'Al-Farouq Aminu','POR',28,80,80,2273,257),(14,14,'Justin Anderson','ATL',25,47,4,451,62),(15,15,'Kyle Anderson','MEM',25,43,40,1281,150),(17,16,'Ryan Anderson','PHO',30,15,8,278,19),(18,16,'Ryan Anderson','MIA',30,9,0,43,2),(19,17,'Ike Anigbogu','IND',20,3,0,6,0),(20,18,'Giannis Antetokounmpo','MIL',24,72,72,2358,721),(21,19,'Kostas Antetokounmpo','DAL',21,2,0,11,0),(23,21,'OG Anunoby','TOR',21,66,6,1334,179),(24,22,'Ryan Arcidiacono','CHI',24,79,30,1899,179),(26,23,'Trevor Ariza','PHO',33,26,26,884,86),(27,23,'Trevor Ariza','WAS',33,43,43,1465,208),(28,24,'D.J. Augustin','ORL',31,80,80,2238,311),(29,25,'Deandre Ayton','PHO',20,71,70,2183,509),(30,26,'Dwayne Bacon','CHO',23,41,11,695,109),(31,27,'Marvin Bagley','SAC',19,61,4,1537,348),(33,28,'Ron Baker','NYK',25,11,0,107,4),(34,28,'Ron Baker','WAS',25,4,0,45,0),(35,29,'Wade Baldwin','POR',22,16,0,94,10),(36,30,'Lonzo Ball','LAL',21,47,45,1423,185),(37,31,'Mohamed Bamba','ORL',20,47,1,766,117),(38,32,'J.J. Barea','DAL',34,38,0,752,161),(40,33,'Harrison Barnes','DAL',26,49,49,1584,290),(41,33,'Harrison Barnes','SAC',26,27,27,933,139),(42,34,'Will Barton','DEN',28,41,36,1135,181),(43,35,'Keita Bates-Diop','MIN',23,28,3,461,56),(44,36,'Nicolas Batum','CHO',30,73,70,2310,252),(45,37,'Jerryd Bayless','MIN',30,34,6,657,82),(46,38,'Aron Baynes','BOS',32,51,18,821,105),(47,39,'Kent Bazemore','ATL',29,66,35,1626,276),(48,40,'Bradley Beal','WAS',25,81,81,3011,758),(49,41,'Malik Beasley','DEN',22,79,18,1831,337),(50,42,'Michael Beasley','LAL',30,26,2,277,75),(51,43,'Marco Belinelli','SAS',32,78,1,1798,284),(52,44,'Jordan Bell','GSW',24,66,2,745,88),(53,45,'DeAndre\' Bembry','ATL',24,81,15,1911,271),(54,46,'Dragan Bender','PHO',21,45,26,790,84),(55,47,'Dairis Bertans','NOP',29,11,0,141,12),(56,48,'Davis Bertans','SAS',26,75,12,1612,201),(57,49,'Patrick Beverley','LAC',30,77,48,2115,189),(58,50,'Khem Birch','ORL',26,49,0,620,89),(59,51,'Bismack Biyombo','CHO',26,52,30,735,85),(60,52,'Nemanja Bjelica','SAC',30,76,69,1776,281),(61,53,'Antonio Blakeney','CHI',22,56,3,815,163),(62,54,'Eric Bledsoe','MIL',29,78,78,2272,470),(63,55,'Jaron Blossomgame','CLE',25,27,4,439,47),(64,56,'Bogdan Bogdanovic','SAC',26,69,17,1920,356),(65,57,'Bojan Bogdanovic','IND',29,81,81,2573,522),(66,58,'Andrew Bogut','GSW',34,10,4,117,18),(67,59,'Jonah Bolden','PHI',23,43,9,626,80),(68,60,'Isaac Bonga','LAL',19,21,0,111,5),(69,61,'Devin Booker','PHO',22,64,64,2242,586),(70,62,'Chris Boucher','TOR',26,27,0,139,27),(72,63,'Avery Bradley','LAC',28,49,49,1463,161),(73,63,'Avery Bradley','MEM',28,14,14,442,87),(74,64,'Tony Bradley','UTA',21,2,0,12,1),(76,65,'Corey Brewer','PHI',32,7,3,140,20),(77,65,'Corey Brewer','SAC',32,23,0,328,33),(78,66,'Mikal Bridges','PHO',22,81,55,2380,238),(79,67,'Miles Bridges','CHO',20,78,23,1627,223),(80,68,'Isaiah Briscoe','ORL',22,39,0,559,55),(81,69,'Ryan Broekhoff','DAL',28,40,0,425,56),(82,70,'Malcolm Brogdon','MIL',26,64,64,1832,378),(83,71,'Dillon Brooks','MEM',23,18,0,330,49),(84,72,'MarShon Brooks','MEM',30,29,0,387,76),(85,73,'Bruce Brown','DET',22,72,54,1406,120),(86,74,'Jaylen Brown','BOS',22,73,24,1895,362),(87,75,'Lorenzo Brown','TOR',28,26,0,212,23),(88,76,'Sterling Brown','MIL',23,57,7,1012,143),(89,77,'Troy Brown','WAS',19,51,9,711,95),(90,78,'Jalen Brunson','DAL',22,71,37,1532,256),(91,79,'Thomas Bryant','WAS',21,71,52,1479,303),(93,80,'Reggie Bullock','DET',27,44,44,1355,182),(94,80,'Reggie Bullock','LAL',27,19,16,524,63),(96,81,'Trey Burke','NYK',26,33,7,689,148),(97,81,'Trey Burke','DAL',26,23,1,411,84),(99,82,'Alec Burks','UTA',27,17,0,269,47),(100,82,'Alec Burks','CLE',27,34,24,979,136),(101,82,'Alec Burks','SAC',27,13,0,127,9),(102,83,'Deonte Burton','OKC',25,31,0,239,33),(104,84,'Jimmy Butler','MIN',29,10,10,361,74),(105,84,'Jimmy Butler','PHI',29,54,54,1808,342),(106,85,'Bruno Caboclo','MEM',23,32,17,743,82),(107,86,'Jose Calderon','DET',37,48,0,628,45),(108,87,'Kentavious Caldwell-Pope','LAL',25,81,22,1991,314),(110,88,'Isaiah Canaan','PHO',27,19,15,503,51),(111,88,'Isaiah Canaan','MIN',27,7,1,95,11),(112,88,'Isaiah Canaan','MIL',27,4,0,31,2),(114,90,'DeMarre Carroll','BRK',32,67,8,1703,227),(115,91,'Jevon Carter','MEM',23,37,3,532,43),(116,92,'Vince Carter','ATL',42,75,9,1318,196),(117,93,'Wendell Carter','CHI',19,44,44,1110,180),(120,94,'Michael Carter-Williams','ORL',27,11,0,205,18),(121,95,'Alex Caruso','LAL',24,24,3,491,72),(122,96,'Omri Casspi','MEM',30,36,0,520,86),(123,97,'Willie Cauley-Stein','SAC',25,80,80,2195,409),(124,98,'Troy Caupain','ORL',23,4,0,16,4),(125,99,'Tyler Cavanaugh','UTA',24,9,0,22,3),(127,100,'Tyson Chandler','PHO',36,7,0,89,8),(128,100,'Tyson Chandler','LAL',36,48,6,786,53),(130,101,'Wilson Chandler','PHI',31,36,32,951,91),(131,101,'Wilson Chandler','LAC',31,14,1,214,22),(132,102,'Joe Chealey','CHO',23,1,0,8,1),(136,104,'Marquese Chriss','CLE',21,26,2,380,52),(138,106,'Ian Clark','NOP',27,59,5,934,143),(139,107,'Jordan Clarkson','CLE',26,80,0,2191,522),(140,108,'John Collins','ATL',21,60,58,1793,457),(141,109,'Zach Collins','POR',21,75,0,1330,184),(142,110,'Darren Collison','IND',31,75,75,2127,307),(143,111,'Bonzie Colson','MIL',23,7,1,54,6),(144,112,'Mike Conley','MEM',31,70,70,2342,490),(145,113,'Pat Connaughton','MIL',26,60,2,1243,158),(146,114,'Quinn Cook','GSW',25,72,9,1007,193),(147,115,'DeMarcus Cousins','GSW',28,29,29,736,171),(149,116,'Robert Covington','PHI',28,13,13,440,50),(150,116,'Robert Covington','MIN',28,22,22,763,106),(151,117,'Allen Crabbe','BRK',26,43,20,1133,137),(152,118,'Torrey Craig','DEN',28,73,37,1469,158),(153,119,'Jamal Crawford','PHO',38,63,0,1173,156),(154,120,'Mitch Creek','BRK',26,4,0,36,5),(155,121,'Jae Crowder','UTA',28,78,10,2125,311),(156,122,'Dante Cunningham','SAS',31,64,21,928,75),(157,123,'Seth Curry','POR',28,73,2,1372,205),(158,124,'Stephen Curry','GSW',30,68,68,2322,630),(159,125,'Troy Daniels','PHO',27,50,1,750,113),(160,126,'Anthony Davis','NOP',25,56,56,1850,530),(161,127,'Deyonta Davis','ATL',22,8,0,115,15),(162,128,'Ed Davis','BRK',29,80,1,1431,183),(163,129,'Tyler Davis','OKC',21,1,0,1,0),(164,130,'Dewayne Dedmon','ATL',29,64,52,1609,259),(166,131,'Sam Dekker','CLE',24,9,5,169,22),(167,131,'Sam Dekker','WAS',24,37,0,588,96),(168,132,'Angel Delgado','LAC',24,2,0,15,1),(170,133,'Matthew Dellavedova','MIL',28,12,0,97,6),(171,133,'Matthew Dellavedova','CLE',28,36,0,715,92),(172,134,'Luol Deng','MIN',33,22,2,392,59),(173,135,'DeMar DeRozan','SAS',29,76,76,2654,624),(174,136,'Marcus Derrickson','GSW',22,9,0,54,10),(175,137,'Cheick Diallo','NOP',22,63,1,871,163),(176,138,'Hamidou Diallo','OKC',20,51,3,526,75),(177,139,'Gorgui Dieng','MIN',29,74,0,968,176),(178,140,'Spencer Dinwiddie','BRK',25,67,4,1889,363),(179,141,'Donte DiVincenzo','MIL',22,27,0,411,50),(180,142,'Luka Doncic','DAL',19,71,71,2286,500),(182,143,'Tyler Dorsey','ATL',22,27,0,251,32),(183,143,'Tyler Dorsey','MEM',22,19,9,387,63),(184,144,'Damyean Dotson','NYK',24,71,38,1934,283),(185,145,'PJ Dozier','BOS',22,5,0,14,3),(186,146,'Goran Dragic','MIA',32,34,20,950,177),(187,147,'Andre Drummond','DET',25,77,77,2581,545),(188,148,'Jared Dudley','BRK',33,59,25,1220,101),(189,149,'Kris Dunn','CHI',24,46,44,1389,215),(190,150,'Kevin Durant','GSW',30,77,77,2683,714),(191,151,'Trevon Duval','MIL',20,3,0,6,2),(194,153,'Henry Ellenson','DET',22,2,0,25,4),(195,153,'Henry Ellenson','NYK',22,15,0,199,29),(197,154,'Wayne Ellington','MIA',31,25,12,533,69),(198,154,'Wayne Ellington','DET',31,26,24,708,110),(199,155,'Joel Embiid','PHI',24,64,64,2154,580),(202,156,'James Ennis','PHI',28,18,2,281,34),(203,157,'Drew Eubanks','SAS',21,22,0,111,15),(204,158,'Jacob Evans','GSW',21,28,0,142,10),(205,159,'Jawun Evans','PHO',22,7,0,64,3),(206,160,'Tyreke Evans','IND',29,68,17,1376,248),(207,161,'Dante Exum','UTA',23,42,1,664,101),(209,162,'Kenneth Faried','BRK',29,12,0,118,25),(211,163,'Derrick Favors','UTA',27,75,69,1744,356),(212,164,'Cristiano Felicio','CHI',26,58,0,707,93),(213,165,'Raymond Felton','OKC',34,31,0,345,50),(214,166,'Terrance Ferguson','OKC',20,72,72,1872,175),(215,167,'Yogi Ferrell','SAC',25,70,3,1038,146),(216,168,'Dorian Finney-Smith','DAL',25,79,26,1941,219),(217,169,'Bryn Forbes','SAS',25,81,80,2266,358),(218,170,'Evan Fournier','ORL',26,80,80,2522,462),(219,171,'De\'Aaron Fox','SAC',21,80,80,2529,497),(220,172,'Melvin Frazier','ORL',22,10,0,44,7),(222,173,'Tim Frazier','NOP',28,47,17,909,88),(223,173,'Tim Frazier','MIL',28,11,1,163,18),(224,174,'Jimmer Fredette','PHO',29,5,0,51,8),(225,175,'Channing Frye','CLE',35,35,6,334,40),(226,176,'Markelle Fultz','PHI',20,19,15,427,65),(227,177,'Danilo Gallinari','LAC',30,67,67,2035,404),(228,178,'Langston Galloway','DET',27,78,4,1700,223),(229,179,'Billy Garrett','NYK',24,2,0,37,5),(231,180,'Marc Gasol','MEM',34,53,53,1788,303),(232,180,'Marc Gasol','TOR',34,25,18,624,84),(234,181,'Pau Gasol','SAS',38,27,6,330,41),(235,181,'Pau Gasol','MIL',38,3,0,30,1),(236,182,'Rudy Gay','SAS',32,68,51,1814,374),(237,183,'Paul George','OKC',28,76,76,2799,698),(238,184,'Taj Gibson','MIN',33,70,57,1686,304),(239,185,'Harry Giles','SAC',20,58,0,820,175),(240,186,'Shai Gilgeous-Alexander','LAC',20,81,72,2150,338),(241,187,'Rudy Gobert','UTA',26,80,79,2542,469),(242,188,'Brandon Goodwin','DEN',23,16,0,57,6),(243,189,'Aaron Gordon','ORL',23,77,77,2600,459),(245,191,'Marcin Gortat','LAC',34,47,43,751,99),(246,192,'Devonte\' Graham','CHO',23,44,3,638,70),(247,193,'Treveon Graham','BRK',25,34,20,689,60),(248,194,'Jerami Grant','OKC',24,78,75,2533,395),(249,195,'Jerian Grant','ORL',26,60,1,939,92),(250,196,'Donte Grantham','OKC',23,3,0,2,0),(251,197,'Danny Green','TOR',31,79,79,2192,291),(252,198,'Draymond Green','GSW',28,65,65,2047,188),(255,200,'JaMychal Green','MEM',28,41,4,900,151),(256,200,'JaMychal Green','LAC',28,23,2,445,75),(257,201,'Jeff Green','WAS',32,76,44,2073,324),(258,202,'Blake Griffin','DET',29,74,74,2604,617),(259,203,'Daniel Hamilton','ATL',23,19,3,204,23),(260,204,'Dusty Hannahs','MEM',25,2,0,26,3),(262,205,'Tim Hardaway','NYK',26,46,46,1499,282),(263,205,'Tim Hardaway','DAL',26,19,17,558,108),(265,207,'Maurice Harkless','POR',25,59,52,1381,180),(266,208,'Montrezl Harrell','LAC',25,81,5,2137,536),(267,209,'Devin Harris','DAL',35,66,0,1015,123),(268,210,'Gary Harris','DEN',24,55,46,1579,258),(269,211,'Joe Harris','BRK',27,76,76,2293,374),(271,212,'Tobias Harris','LAC',26,55,55,1903,424),(272,212,'Tobias Harris','PHI',26,26,26,924,184),(274,213,'Andrew Harrison','MEM',24,1,0,5,1),(275,213,'Andrew Harrison','CLE',24,10,0,144,12),(276,213,'Andrew Harrison','NOP',24,6,0,38,3),(277,214,'Shaquille Harrison','CHI',25,71,9,1382,174),(278,215,'Josh Hart\\hartjo01','LAL',23,67,22,1715,189),(280,217,'Udonis Haslem','MIA',38,8,0,35,3),(281,218,'Gordon Hayward','BOS',28,72,18,1863,296),(282,219,'John Henson','MIL',28,14,0,188,31),(283,220,'Juan Hernangomez','DEN',23,69,25,1348,138),(284,221,'Willy Hernangomez','CHO',24,57,3,809,153),(285,222,'Mario Hezonja','NYK',23,57,23,1185,191),(286,223,'Isaiah Hicks','NYK',24,1,0,4,0),(287,224,'Buddy Hield','SAC',26,81,81,2599,620),(288,225,'Haywood Highsmith','PHI',22,3,0,15,2),(291,227,'George Hill','CLE',32,13,13,344,55),(292,227,'George Hill','MIL',32,46,0,939,114),(293,228,'Solomon Hill','NOP',27,43,15,857,66),(294,229,'Aaron Holiday','IND',22,49,0,623,100),(295,230,'Jrue Holiday','NOP',28,67,67,2402,547),(297,231,'Justin Holiday','CHI',29,38,38,1325,151),(298,231,'Justin Holiday','MEM',29,42,37,1218,138),(299,232,'John Holland','CLE',30,1,0,1,0),(300,233,'Rondae Hollis-Jefferson','BRK',24,58,21,1208,195),(301,234,'Richaun Holmes','PHO',25,70,4,1184,222),(303,235,'Rodney Hood','CLE',26,45,45,1234,194),(304,235,'Rodney Hood','POR',26,26,4,638,98),(305,236,'Al Horford','BOS',32,68,68,1973,387),(307,238,'Dwight Howard','WAS',33,9,9,230,43),(308,239,'Kevin Huerter','ATL',20,74,58,2018,269),(309,240,'Isaac Humphries','ATL',21,4,1,55,5),(310,241,'Chandler Hutchison','CHI',22,44,14,895,96),(311,242,'Serge Ibaka','TOR',29,74,51,2010,464),(312,243,'Andre Iguodala','GSW',35,67,13,1556,149),(313,244,'Ersan Ilyasova','MIL',31,66,6,1208,166),(314,245,'Joe Ingles','UTA',31,80,80,2519,354),(315,246,'Andre Ingram','LAL',33,4,0,15,0),(316,247,'Brandon Ingram','LAL',21,52,52,1760,362),(317,248,'Kyrie Irving','BOS',26,67,67,2214,604),(318,249,'Jonathan Isaac','ORL',21,75,64,1996,262),(319,250,'Wesley Iwundu','ORL',24,67,12,1209,110),(320,251,'Demetrius Jackson','PHI',24,6,0,39,8),(321,252,'Frank Jackson','NOP',20,61,16,1169,194),(322,253,'Jaren Jackson','MEM',19,58,56,1515,298),(323,254,'Josh Jackson','PHO',21,78,28,1947,341),(325,255,'Justin Jackson','SAC',23,52,3,1083,125),(326,255,'Justin Jackson','DAL',23,27,9,475,82),(327,256,'Reggie Jackson','DET',28,80,80,2241,430),(328,257,'LeBron James','LAL',34,55,55,1937,558),(329,258,'Amile Jefferson','ORL',25,11,0,44,7),(331,259,'John Jenkins','WAS',27,4,0,14,2),(332,259,'John Jenkins','NYK',27,20,0,271,31),(333,260,'Jonas Jerebko','GSW',31,71,6,1186,157),(334,261,'Alize Johnson','IND',22,13,0,39,2),(335,262,'Amir Johnson','PHI',31,49,6,487,73),(336,263,'B.J. Johnson','ATL',23,6,0,43,8),(337,264,'James Johnson','MIA',31,53,33,1133,163),(339,265,'Stanley Johnson','DET',22,48,7,961,133),(340,265,'Stanley Johnson','NOP',22,18,0,247,38),(342,266,'Tyler Johnson','MIA',26,44,10,1123,171),(343,266,'Tyler Johnson','PHO',26,13,12,406,46),(345,267,'Wesley Johnson','NOP',31,26,13,377,35),(346,267,'Wesley Johnson','WAS',31,12,0,157,10),(347,268,'Nikola Jokic','DEN',23,78,78,2451,602),(348,269,'Damian Jones','GSW',23,24,22,410,53),(349,270,'Derrick Jones','MIA',21,58,14,1092,153),(350,271,'Jalen Jones','CLE',25,16,0,214,26),(351,272,'Jemerrio Jones','LAL',23,5,1,97,7),(353,274,'Tyus Jones','MIN',22,66,21,1498,176),(355,275,'DeAndre Jordan','DAL',30,50,50,1554,208),(356,275,'DeAndre Jordan','NYK',30,19,19,493,78),(357,276,'Cory Joseph','IND',27,81,9,2043,224),(358,277,'Frank Kaminsky','CHO',25,45,0,713,133),(360,278,'Enes Kanter','NYK',26,44,23,1128,251),(361,278,'Enes Kanter','POR',26,22,7,475,116),(362,279,'Luke Kennard','DET',22,61,10,1383,214),(363,280,'Michael Kidd-Gilchrist','CHO',25,63,3,1178,158),(364,281,'George King','PHO',25,1,0,6,0),(365,282,'Maxi Kleber','DAL',27,70,18,1482,174),(368,283,'Brandon Knight','CLE',27,26,25,587,85),(369,284,'Kevin Knox','NYK',19,73,55,2095,330),(370,285,'Furkan Korkmaz','PHI',21,46,6,654,94),(371,286,'Luke Kornet','NYK',23,44,16,717,100),(373,287,'Kyle Korver','CLE',37,16,0,251,35),(374,287,'Kyle Korver','UTA',37,54,0,1083,166),(375,288,'Kosta Koufos','SAC',29,42,1,502,73),(376,289,'Rodions Kurucs','BRK',20,62,45,1266,197),(377,290,'Kyle Kuzma','LAL',23,70,68,2314,496),(379,291,'Skal Labissiere','SAC',22,13,0,113,13),(380,291,'Skal Labissiere','POR',22,8,0,23,1),(381,292,'Jeremy Lamb','CHO',26,77,55,2191,416),(382,293,'Zach LaVine','CHI',23,63,62,2171,530),(383,294,'Jake Layman','POR',24,69,32,1270,209),(384,295,'T.J. Leaf','IND',21,57,0,487,87),(386,296,'Courtney Lee','NYK',33,12,2,160,21),(387,296,'Courtney Lee','DAL',33,21,4,248,26),(388,297,'Damion Lee','GSW',26,30,0,325,45),(389,298,'Walt Lemon','CHI',26,4,3,121,26),(390,299,'Alex Len','ATL',25,76,30,1513,314),(391,300,'Kawhi Leonard','TOR',27,59,59,2016,552),(392,301,'Meyers Leonard','POR',26,60,1,836,124),(393,302,'Jon Leuer','DET',29,40,1,398,65),(394,303,'Caris LeVert','BRK',24,39,24,1043,203),(395,304,'Damian Lillard','POR',28,79,79,2802,675),(397,305,'Jeremy Lin','ATL',30,51,1,1003,180),(398,305,'Jeremy Lin','TOR',30,22,3,414,56),(399,306,'Shaun Livingston','GSW',33,63,0,951,109),(400,307,'Zach Lofton','DET',26,1,0,4,0),(401,308,'Kevon Looney','GSW',22,78,24,1452,212),(402,309,'Brook Lopez','MIL',30,81,81,2322,355),(403,310,'Robin Lopez','CHI',30,72,34,1549,293),(404,311,'Kevin Love','CLE',30,22,21,598,109),(405,312,'Kyle Lowry','TOR',32,65,65,2213,304),(406,313,'Jordan Loyd','TOR',25,11,0,47,6),(407,314,'Kalin Lucas','DET',29,1,0,6,0),(409,315,'Timothe Luwawu-Cabarrot','OKC',23,21,1,123,13),(410,315,'Timothe Luwawu-Cabarrot','CHI',23,27,4,492,61),(411,316,'Tyler Lydon','DEN',22,25,0,94,9),(412,317,'Trey Lyles','DEN',23,64,2,1120,207),(413,318,'Scott Machado','LAL',28,4,0,19,4),(415,319,'Shelvin Mack','MEM',28,53,3,1204,161),(416,319,'Shelvin Mack','CHO',28,4,0,42,2),(417,320,'Daryl Macon','DAL',23,8,0,90,10),(418,321,'J.P. Macura','CHO',23,1,0,14,2),(419,322,'Ian Mahinmi','WAS',32,33,6,473,43),(421,323,'Thon Maker','MIL',21,35,0,409,59),(422,323,'Thon Maker','DET',21,27,4,535,50),(424,324,'Boban Marjanovic','LAC',30,36,9,376,85),(425,324,'Boban Marjanovic','PHI',30,20,2,261,61),(426,325,'Lauri Markkanen','CHI',21,52,51,1682,342),(427,326,'Jarell Martin','ORL',24,41,1,308,42),(428,327,'Frank Mason','SAC',24,37,0,418,65),(430,328,'Wesley Matthews','DAL',32,44,44,1312,194),(431,328,'Wesley Matthews','NYK',32,2,1,54,4),(432,328,'Wesley Matthews','IND',32,23,23,725,81),(433,329,'Luc Mbah a Moute','LAC',32,4,0,61,8),(434,330,'Tahjere McCall','BRK',24,1,0,8,2),(436,331,'Patrick McCaw','CLE',23,3,0,53,2),(437,331,'Patrick McCaw','TOR',23,26,1,344,24),(438,332,'CJ McCollum','POR',27,69,69,2346,566),(439,333,'T.J. McConnell','PHI',26,74,2,1424,210),(440,334,'Doug McDermott','IND',27,76,0,1308,203),(441,335,'JaVale McGee','LAL',31,74,61,1651,395),(442,336,'Rodney McGruder','MIA',27,66,45,1550,186),(443,337,'Alfonzo McKinnie','GSW',26,70,4,956,129),(444,338,'Ben McLemore','SAC',25,19,0,158,25),(445,339,'Jordan McRae','WAS',27,27,0,333,61),(446,340,'Jodie Meeks','TOR',31,7,0,86,18),(447,341,'Salah Mejri','DAL',32,35,4,384,54),(448,342,'De\'Anthony Melton','PHO',20,49,31,965,98),(449,343,'Chimezie Metu','SAS',21,29,0,145,19),(450,344,'Khris Middleton','MIL',27,76,76,2377,497),(452,345,'C.J. Miles','TOR',31,40,1,562,70),(453,345,'C.J. Miles','MEM',31,13,0,294,42),(454,346,'Darius Miller','NOP',28,69,15,1757,189),(455,347,'Malcolm Miller','TOR',25,9,0,58,10),(456,348,'Patty Mills','SAS',30,81,1,1889,281),(457,349,'Paul Millsap','DEN',33,68,63,1841,318),(458,350,'Shake Milton','PHI',22,18,0,224,28),(460,351,'Nikola Mirotic','NOP',27,32,22,925,182),(461,351,'Nikola Mirotic','MIL',27,14,3,320,56),(462,352,'Donovan Mitchell','UTA',22,76,76,2562,647),(463,353,'Naz Mitrou-Long','UTA',25,12,0,49,3),(464,354,'Malik Monk','CHO',20,71,0,1217,223),(466,355,'Greg Monroe','TOR',28,38,2,423,74),(467,355,'Greg Monroe','BOS',28,2,0,5,3),(468,355,'Greg Monroe','PHI',28,1,0,10,4),(469,356,'E\'Twaun Moore','NOP',29,53,36,1463,256),(471,357,'Eric Moreland','PHO',27,1,0,5,0),(472,357,'Eric Moreland','TOR',27,3,0,31,3),(473,358,'Jaylen Morris','MIL',23,4,0,29,4),(474,359,'Marcus Morris','BOS',29,75,53,2091,377),(476,360,'Markieff Morris','WAS',29,34,15,883,143),(477,360,'Markieff Morris','OKC',29,22,1,350,54),(478,361,'Monte Morris','DEN',23,80,6,1919,335),(479,362,'Donatas Motiejunas','SAS',28,2,0,10,2),(480,363,'Johnathan Motley','LAC',23,22,0,156,39),(481,364,'Emmanuel Mudiay','NYK',22,59,42,1607,330),(482,365,'Jamal Murray','DEN',21,73,72,2382,498),(483,366,'Dzanan Musa','BRK',19,8,0,34,8),(485,367,'Mike Muscala','PHI',27,47,6,1041,109),(486,367,'Mike Muscala','LAL',27,16,3,229,30),(488,368,'Sviatoslav Mykhailiuk','LAL',21,39,0,420,44),(489,368,'Sviatoslav Mykhailiuk','DET',21,3,0,20,2),(490,369,'Abdel Nader','OKC',25,60,1,679,86),(491,370,'Larry Nance','CLE',26,66,29,1759,245),(492,371,'Shabazz Napier','BRK',27,55,2,953,162),(493,372,'Raul Neto','UTA',26,37,1,474,74),(494,373,'Georges Niang','UTA',25,57,0,455,74),(495,374,'Joakim Noah','MEM',33,42,1,693,110),(496,375,'Nerlens Noel','OKC',24,75,2,1034,159),(497,376,'Dirk Nowitzki','DAL',40,49,18,731,116),(498,377,'Frank Ntilikina','NYK',20,43,16,904,95),(500,378,'James Nunnally','MIN',28,13,0,64,9),(502,379,'Jusuf Nurkic','POR',24,72,72,1974,420),(503,380,'David Nwaba','CLE',26,50,14,969,126),(504,381,'Royce O\'Neale','UTA',25,80,14,1610,157),(505,382,'Kyle O\'Quinn','IND',28,44,2,360,67),(506,383,'Semi Ojeleye','BOS',24,55,2,556,60),(507,384,'Jahlil Okafor','NOP',23,58,23,897,197),(508,385,'Elie Okobo','PHO',21,52,15,932,111),(509,386,'Josh Okogie','MIN',20,72,50,1722,195),(510,387,'Victor Oladipo','IND',26,36,36,1147,249),(511,388,'Kelly Olynyk','MIA',27,77,34,1769,254),(512,389,'Cedi Osman','CLE',23,75,74,2407,353),(514,390,'Kelly Oubre','WAS',23,29,7,755,132),(515,390,'Kelly Oubre','PHO',23,40,12,1180,243),(516,391,'Zaza Pachulia','DET',34,66,3,856,82),(518,392,'Jabari Parker','CHI',23,39,17,1042,220),(519,392,'Jabari Parker','WAS',23,25,0,682,149),(520,393,'Tony Parker','CHO',36,56,0,1003,213),(521,394,'Chandler Parsons','MEM',30,24,3,466,65),(522,395,'Patrick Patterson','OKC',29,63,5,861,82),(523,396,'Justin Patton','PHI',21,3,0,21,2),(526,398,'Cameron Payne','CHI',24,31,12,536,69),(527,398,'Cameron Payne','CLE',24,9,1,176,27),(528,399,'Elfrid Payton','NOP',24,41,41,1225,178),(529,400,'Gary Payton','WAS',26,3,0,16,5),(530,401,'Theo Pinson','BRK',23,17,0,192,23),(531,402,'Mason Plumlee','DEN',28,80,17,1682,257),(532,403,'Miles Plumlee','ATL',30,18,0,173,32),(533,404,'Jakob Poeltl','SAS',23,76,23,1253,185),(534,405,'Quincy Pondexter','SAS',30,52,0,289,29),(536,406,'Otto Porter','WAS',25,41,28,1191,202),(537,406,'Otto Porter','CHI',25,15,15,492,97),(539,407,'Bobby Portis','CHI',23,22,6,531,122),(540,407,'Bobby Portis','WAS',23,27,21,745,153),(541,408,'Dwight Powell','DAL',27,75,20,1602,286),(542,409,'Norman Powell','TOR',25,59,3,1106,189),(543,410,'Alex Poythress','ATL',25,21,1,305,40),(545,412,'Ivan Rabb','MEM',21,47,12,663,109),(546,413,'Chasson Randle','WAS',25,48,2,716,89),(547,414,'Julius Randle','NOP',24,73,49,2232,571),(548,415,'J.J. Redick','PHI',34,76,63,2379,452),(549,416,'Davon Reed','IND',23,9,0,24,2),(550,417,'Cameron Reynolds','MIN',23,17,0,214,23),(551,418,'Josh Richardson','MIA',25,73,73,2539,423),(552,419,'Malachi Richardson','TOR',23,22,0,103,9),(554,420,'Austin Rivers','WAS',26,29,2,683,76),(556,421,'Devin Robinson','WAS',23,6,0,64,12),(557,422,'Duncan Robinson','MIA',24,13,1,114,11),(558,423,'Glenn Robinson','DET',25,45,18,568,70),(559,424,'Jerome Robinson','LAC',21,32,0,304,41),(560,425,'Mitchell Robinson','NYK',20,64,17,1302,194),(561,426,'Rajon Rondo','LAL',32,46,29,1369,175),(562,427,'Derrick Rose','MIN',30,51,13,1392,363),(563,428,'Terrence Ross','ORL',27,80,0,2120,428),(564,429,'Terry Rozier','BOS',24,78,13,1767,250),(565,430,'Ricky Rubio','UTA',28,68,67,1899,295),(566,431,'D\'Angelo Russell','BRK',22,80,80,2428,652),(567,432,'Domantas Sabonis','IND',22,74,5,1838,413),(568,433,'Brandon Sampson','CHI',21,12,2,169,20),(569,434,'JaKarr Sampson','CHI',25,3,0,94,25),(571,435,'Dario Saric','PHI',24,13,13,396,48),(572,435,'Dario Saric','MIN',24,66,26,1573,247),(573,436,'Tomas Satoransky','WAS',27,79,53,2136,251),(574,437,'Dennis Schroder','OKC',25,77,13,2245,444),(576,438,'Mike Scott','LAC',30,52,0,748,92),(577,438,'Mike Scott','PHI',30,26,2,626,73),(578,439,'Thabo Sefolosha','UTA',34,48,2,570,67),(580,440,'Wayne Selden','MEM',24,32,0,455,65),(581,440,'Wayne Selden','CHI',24,41,11,936,125),(582,441,'Collin Sexton','CLE',20,81,71,2567,511),(584,442,'Landry Shamet','PHI',21,54,4,1108,153),(585,442,'Landry Shamet','LAC',21,24,22,664,82),(587,443,'Iman Shumpert','SAC',28,42,40,1099,133),(589,444,'Pascal Siakam','TOR',24,79,78,2530,515),(590,445,'Jordan Sibert','ATL',26,1,0,4,1),(591,446,'Ben Simmons','PHI',22,78,78,2679,533),(593,447,'Jonathon Simmons','ORL',29,41,9,845,104),(594,447,'Jonathon Simmons','PHI',29,13,0,163,16),(595,448,'Kobi Simmons','CLE',21,1,0,2,0),(596,449,'Anfernee Simons','POR',19,19,0,93,15),(597,450,'Marcus Smart','BOS',24,80,60,2200,239),(599,451,'Dennis Smith','DAL',21,32,32,908,157),(600,451,'Dennis Smith','NYK',21,20,17,565,111),(601,452,'Ish Smith','DET',30,54,0,1207,195),(602,453,'J.R. Smith','CLE',33,11,4,222,27),(604,454,'Jason Smith','WAS',32,12,1,130,15),(605,454,'Jason Smith','MIL',32,6,0,40,4),(606,454,'Jason Smith','NOP',32,2,0,20,2),(607,455,'Zhaire Smith','PHI',19,4,0,49,3),(608,456,'Tony Snell','MIL',27,74,12,1304,163),(610,457,'Ray Spalding','DAL',21,1,0,1,0),(611,457,'Ray Spalding','PHO',21,12,2,128,24),(612,458,'Omari Spellman','ATL',21,46,11,805,98),(614,459,'Nik Stauskas','POR',25,44,0,673,96),(615,459,'Nik Stauskas','CLE',25,23,0,330,39),(616,460,'D.J. Stephens','MEM',28,1,0,7,1),(617,461,'Lance Stephenson','LAL',28,68,3,1123,184),(618,462,'Edmond Sumner','IND',23,22,2,180,17),(620,463,'Caleb Swanigan','POR',21,18,0,145,14),(621,463,'Caleb Swanigan','SAC',21,2,0,15,2),(622,464,'Jayson Tatum','BOS',20,79,79,2455,466),(623,465,'Jeff Teague','MIN',30,42,41,1264,176),(625,466,'Garrett Temple','MEM',32,49,49,1530,166),(626,466,'Garrett Temple','LAC',32,25,6,489,41),(627,467,'Milos Teodosic','LAC',31,15,0,150,17),(628,468,'Jared Terrell','MIN',23,12,0,89,10),(630,469,'Emanuel Terry','PHO',22,2,0,20,4),(631,469,'Emanuel Terry','MIA',22,1,0,3,0),(632,470,'Daniel Theis','BOS',26,65,2,895,145),(633,471,'Isaiah Thomas','DEN',29,12,0,181,34),(634,472,'Khyri Thomas','DET',22,25,0,190,22),(635,473,'Lance Thomas','NYK',30,46,17,783,78),(636,474,'Klay Thompson','GSW',28,77,77,2635,647),(637,475,'Tristan Thompson','CLE',27,43,40,1198,201),(638,476,'Sindarius Thornwell','LAC',24,63,1,305,17),(639,477,'Anthony Tolliver','MIN',33,63,0,1036,96),(640,478,'Karl-Anthony Towns','MIN',23,77,77,2545,681),(641,479,'Gary Trent','POR',20,14,0,63,8),(642,480,'Allonzo Trier','NYK',23,64,3,1459,232),(644,482,'Evan Turner','POR',30,72,2,1589,202),(645,483,'Myles Turner','IND',22,74,74,2119,380),(646,484,'Ekpe Udoh','UTA',31,49,0,290,45),(647,485,'Tyler Ulis','CHI',23,1,0,1,0),(649,486,'Jonas Valanciunas','TOR',26,30,10,564,149),(650,486,'Jonas Valanciunas','MEM',26,19,17,527,152),(651,487,'Jarred Vanderbilt','DEN',19,16,0,66,8),(652,488,'Fred VanVleet','TOR',24,63,27,1733,240),(653,489,'Noah Vonleh','NYK',23,68,57,1722,207),(654,490,'Nikola Vucevic','ORL',28,80,80,2510,701),(655,491,'Dwyane Wade','MIA',37,70,0,1814,396),(656,492,'Moritz Wagner','LAL',21,42,5,430,68),(657,493,'Dion Waiters','MIA',27,42,28,1112,195),(658,494,'Kemba Walker','CHO',28,80,80,2795,706),(659,495,'Lonnie Walker','SAS',20,16,0,114,16),(660,496,'John Wall','WAS',28,32,32,1104,245),(661,497,'Tyrone Wallace','LAC',24,61,0,619,90),(662,498,'Taurean Waller-Prince','ATL',24,54,46,1519,254),(663,499,'Brad Wanamaker','BOS',29,35,0,314,44),(664,500,'T.J. Warren','PHO',25,43,36,1360,297),(665,501,'Julian Washburn','MEM',27,16,3,218,11),(666,502,'Yuta Watanabe','MEM',24,14,0,155,13),(667,503,'Thomas Welsh','DEN',22,11,0,36,7),(668,504,'Russell Westbrook','OKC',30,71,71,2556,612),(669,505,'Derrick White','SAS',24,66,54,1700,254),(670,506,'Okaro White','WAS',26,3,0,6,0),(671,507,'Hassan Whiteside','MIA',29,71,53,1661,381),(672,508,'Andrew Wiggins','MIN',23,71,71,2478,480),(673,509,'Alan Williams','BRK',26,4,0,22,6),(674,510,'C.J. Williams','MIN',28,13,0,92,12),(675,511,'Johnathan Williams','LAL',23,23,0,343,60),(676,512,'Kenrich Williams','NOP',24,45,28,1045,104),(677,513,'Lou Williams','LAC',32,74,1,1970,479),(678,514,'Marvin Williams','CHO',32,75,75,2133,275),(679,515,'Robert Williams','BOS',21,31,1,254,35),(680,516,'Troy Williams','SAC',24,20,0,301,42),(681,517,'D.J. Wilson','MIL',22,47,2,835,96),(682,518,'Justise Winslow','MIA',22,64,50,1908,315),(684,519,'Christian Wood','MIL',23,13,0,62,12),(685,519,'Christian Wood','NOP',23,7,1,155,39),(687,520,'Delon Wright','TOR',26,49,2,897,127),(688,520,'Delon Wright','MEM',26,24,9,728,108),(689,521,'Guerschon Yabusele','BOS',23,40,0,226,30),(690,522,'Nick Young','DEN',33,4,0,37,3),(691,523,'Thaddeus Young','IND',30,81,81,2489,443),(692,524,'Trae Young','ATL',20,80,80,2470,519),(693,525,'Cody Zeller','CHO',26,49,47,1243,190),(695,526,'Tyler Zeller','ATL',29,2,0,11,0),(696,526,'Tyler Zeller','MEM',29,2,0,44,9),(697,527,'Ante Zizic','CLE',22,58,24,1061,180),(699,528,'Ivica Zubac','LAL',21,33,12,516,112),(700,528,'Ivica Zubac','LAC',21,25,24,494,90);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regular_season_current_state`
--

DROP TABLE IF EXISTS `regular_season_current_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `regular_season_current_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coach_name` varchar(50) NOT NULL,
  `team` varchar(50) NOT NULL,
  `games` int(11) DEFAULT NULL,
  `win` int(11) DEFAULT NULL,
  `lose` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coach_name_fk` (`coach_name`),
  KEY `team_fk` (`team`),
  CONSTRAINT `coach_name_fk` FOREIGN KEY (`coach_name`) REFERENCES `coach` (`coach_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `team_fk` FOREIGN KEY (`team`) REFERENCES `team` (`name_initial`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regular_season_current_state`
--

LOCK TABLES `regular_season_current_state` WRITE;
/*!40000 ALTER TABLE `regular_season_current_state` DISABLE KEYS */;
INSERT INTO `regular_season_current_state` VALUES (1,'Lloyd Pierce','ATL',60,20,40),(2,'Brad Stevens','BOS',60,37,23),(3,'Kenny Atkinson','BRK',61,31,30),(4,'Jim Boylen','CHI',36,11,25),(5,'James Borrego','CHO',59,28,31),(6,'Larry Drew','CLE',54,14,40),(7,'Rick Carlisle','DAL',59,26,33),(8,'Mike Malone','DEN',59,41,18),(9,'Dwane Casey','DET',58,28,30),(10,'Steve Kerr','GSW',59,42,17),(12,'Nate McMillan','IND',60,40,20),(13,'Doc Rivers','LAC',61,33,28),(14,'Luke Walton','LAL',59,29,30),(15,'J.B. Bickerstaff','MEM',61,23,38),(16,'Erik Spoelstra','MIA',58,26,32),(17,'Mike Budenholzer','MIL',59,45,14),(18,'Ryan Saunders','MIN',19,9,10),(19,'Alvin Gentry','NOP',61,27,34),(20,'David Fizdale','NYK',60,12,48),(21,'Billy Donovan','OKC',59,38,21),(22,'Steve Clifford','ORL',61,28,33),(23,'Brett Brown','PHI',60,38,22),(24,'Igor Kokoskov','PHO',61,11,50),(25,'Terry Stotts','POR',59,36,23),(26,'Dave Joerger','SAC',59,31,28),(27,'Gregg Popovich','SAS',61,33,28),(28,'Nick Nurse','TOR',61,44,17),(29,'Quin Snyder','UTA',59,33,26),(30,'Scott Brooks','WAS',60,24,36);
/*!40000 ALTER TABLE `regular_season_current_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team` (
  `current_name` varchar(50) NOT NULL,
  `name_initial` varchar(3) DEFAULT NULL,
  `win` int(11) DEFAULT NULL,
  `lose` int(11) DEFAULT NULL,
  `conference` varchar(50) NOT NULL,
  PRIMARY KEY (`current_name`),
  UNIQUE KEY `current_name` (`current_name`),
  UNIQUE KEY `name_initial` (`name_initial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('Atlanta Hawks','ATL',29,52,'Eastern'),('Boston Celtics','BOS',48,33,'Eastern'),('Brooklyn Nets','BRK',41,40,'Eastern'),('Charlotte Hornets','CHO',38,42,'Eastern'),('Chicago Bulls','CHI',22,58,'Eastern'),('Cleveland Cavaliers','CLE',19,62,'Eastern'),('Dallas Mavericks','DAL',32,48,'Western'),('Denver Nuggets','DEN',53,27,'Western'),('Detroit Pistons','DET',39,41,'Eastern'),('Golden State Warriors','GSW',56,24,'Western'),('Houston Rockets','HOS',53,28,'Western'),('Indiana Pacers','IND',47,34,'Eastern'),('Los Angeles Clippers','LAC',47,34,'Western'),('Los Angeles Lakers','LAL',37,44,'Western'),('Memphis Grizzlies','MEM',32,48,'Western'),('Miami Heat','MIA',38,42,'Eastern'),('Milwaukee Bucks','MIL',60,21,'Eastern'),('Minnesota Timberwolves','MIN',36,44,'Western'),('New Orleans Pelicans','NOP',33,48,'Western'),('New York Knicks','NYK',16,64,'Eastern'),('Oklahoma City Thunder','OKC',47,33,'Western'),('Orlando Magic','ORL',41,40,'Eastern'),('Philadelphia 76ers','PHI',50,30,'Eastern'),('Phoenix Suns','PHO',19,62,'Western'),('Portland Trail Blazers','POR',51,29,'Western'),('Sacramento Kings','SAC',39,42,'Western'),('San Antonio Spurs','SAS',47,34,'Western'),('Toronto Raptors','TOR',57,24,'Eastern'),('Utah Jazz','UTA',49,31,'Western'),('Washington Wizards','WAS',32,49,'Eastern');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'yinzheng'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14 14:50:18
