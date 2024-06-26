-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: javawebproject
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `books_data`
--

DROP TABLE IF EXISTS `books_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_data` (
  `book_ID` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(45) DEFAULT NULL,
  `book_author` varchar(45) DEFAULT NULL,
  `book_PublishDate` date DEFAULT NULL,
  `book_type` varchar(45) DEFAULT NULL,
  `book_state` enum('上架中','待审核') DEFAULT '待审核',
  `book_describe` text,
  `book_publisher` varchar(45) DEFAULT NULL,
  `book_ImagePath` varchar(45) DEFAULT NULL,
  `book_Path` varchar(45) DEFAULT NULL,
  `book_recommend` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`book_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=200234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_data`
--

LOCK TABLES `books_data` WRITE;
/*!40000 ALTER TABLE `books_data` DISABLE KEYS */;
INSERT INTO `books_data` VALUES (200201,'红楼梦','曹雪芹','1797-05-09','中国文学','待审核','《红楼梦》也称《石头记》，中国古典长篇章回小说，是中国大陆定义的四大小说名著之一。《红楼梦》书内提及的别名，还有《情僧录》、《风月宝鉴》[1]、《金陵十二钗》。故事是从女娲补天时所剩下的一块石头讲起，因无才补天而随神瑛侍者（即后来的贾宝玉）入世，幻化为贾宝玉降世时口衔的美玉以游历世间，因此又名《石头记》。乾隆四十九年甲辰（1784年）梦觉主人序本题为《红楼梦》（甲辰梦序抄本）。1791年在第一次活字印刷（程甲本）后，《红楼梦》便取代《石头记》成为通行的书名。','中国人民出版社','BookImage/红楼梦.jpg',NULL,6),(200202,'西游记','吴承恩','1763-11-06','中国文学','上架中','《西游记》是中国古代第一部浪漫主义章回体长篇神魔小说。 [39] [41]今见最早的《西游记》版本是明代万历二十年金陵世德堂《新刻出像官板大字西游记》，未署作者姓名。 [63]鲁迅、董作宾等人根据《淮安府志》“吴承恩《西游记》”的记载予以最终论定“吴承恩原著”。 [63]','中国人民出版社','BookImage/西游记.jpg',NULL,4),(200203,'肖申克的救赎','斯蒂芬金','1996-12-06','外国文学','上架中','《肖申克的救赎》是美国作家斯蒂芬·埃德温·金的中篇小说，也是其代表作。收录于小说合集《四季奇谭》中，副标题为“春天的希望”。','机械出版社','BookImage/肖申克的救赎.jpg',NULL,1),(200204,'东方快车谋杀案','阿加莎克里斯蒂','1978-05-04','悬疑/推理','上架中','《东方快车谋杀案》（Murder on the Orient Express）是英国作家阿加莎·克里斯蒂创作的侦探小说，属于侦探赫尔克里·波洛系列，由英国柯林斯犯罪俱乐部于1934年1月1日首次出版。','伦敦出版社','BookImage/东方快车谋杀案.png',NULL,1),(200205,'白夜行','东野圭吾','2004-08-13','悬疑/推理','上架中','《白夜行》是日本作家东野圭吾创作的长篇小说，也是其代表作。该小说于1997年1月至1999年1月间连载于期刊，单行本1999年8月在日本发行。','华东出版社','BookImage/白夜行.jpg',NULL,2),(200206,'查理九世','雷欧幻象','2007-06-23','儿童文学','上架中','《查理九世》是一套大型原创冒险小说。该书的主人公——幻想成为冒险家侦探的蹩脚小学生墨多多，在生日时收到了一份来自爷爷的赠礼，这是一只有着悠久皇室血统证明的狗，它的名字是“查理九世”。但是这似乎不是一只简单的狗，想象之外的麻烦接踵而至，一个个巨大而善恶未知的秘密随之展开。破解密码，追踪足迹，分析推理，墨多多（本名墨小侠）、尧婷婷、虎鲨（本名胡沙）、扶幽，四个少年伙伴知难而进，无所畏惧，破解了一个又一个迷境和案件。','南京出版社','BookImage/查理九世.jpg',NULL,0),(200207,'红岩','罗广斌，杨益言','2017-09-01','中国文学','上架中','《红岩》描写人民解放军进军大西南的形势下，重庆的国民党当局疯狂镇压共产党领导的地下革命斗争。着重表现以齐晓轩、许云峰、江雪琴等共产党人在狱中所进行的英勇战斗，虽然最后惨遭屠杀，但却充分显示了共产党人视死如归的大无畏英雄气概。 [1]《红岩》结构错综复杂又富于变化，善于刻画人物心理活动和烘托气氛，语言朴实，笔调悲壮，作品一经面世，立即引起轰动。 [2]2019年9月23日，《红岩》入选“新中国70年70部长篇小说典藏”。 [3]','中国青年出版社','BookImage/红岩.jpg',NULL,2),(200208,'西方哲学史','罗素','2020-06-12','外国文学','上架中','西方哲学史是欧洲哲学的历史，从公元前6世纪的古希腊哲学到西方现代哲学的发展史。它可分为4个时期：①公元前6—公元5世纪，称为古希腊哲学；②公元 5—15世纪，称为中世纪哲学；③15世纪中—19世纪40年代，称为近代哲学；④19世纪40年代以来，称为现代哲学。对现代哲学时期的划分，学术界有不同看法，有的把上限划在19世纪末，有的划在第一次世界大战和俄国十月革命后，有的划在第二次世界大战后。','商务出版社','BookImage/西方哲学史.jpg',NULL,0),(200209,'十二生肖的故事','赖马，启发图书馆','2020-03-05','儿童文学','上架中','首届丰子恺奖得主 ◆台湾趣味绘本大师赖马创作20周年纪念版 ◆中华文化经典、浓浓的年味、十足的中国风 ◆赖式幽默为你呈现令人捧腹的十二生肖故事！','河北教育出版社','BookImage/十二生肖的故事.jpg',NULL,0),(200210,'查理和巧克力工厂','罗尔德达尔','2019-09-03','儿童文学','上架中','罗尔德•达尔作品典藏（彩图拼音版）是一套专门为小学低年级孩子奉献的拼音版读物，由世界插画大师昆汀·布莱克绘制插图，全彩印刷，大字注音，带给孩子优质的阅读体验。本系列已推出《了不起的狐狸爸爸》《蠢特夫妇》《小乔治的神奇魔药》《魔法手指》《小乌龟是怎样变大的》等。达尔的作品构思奇特，情节紧凑，打破现实与幻想之间的常规对应，给人一种或幽默、或荒诞、或机智的美感，其魔力穿越语言和国界，适合小学低年级孩子阅读。小查理生长的一个小镇里有一个巧克力工厂里，工厂由一个伟大的巧克力发明家、制造商威利・旺卡所拥有。工厂非常神秘，大门紧锁，全镇子的人从来没有看见有人从大门进去或出来过。有一天，威利・旺卡先生发出告示，将有五位幸运的孩子获得参观巧克力工厂的特权，同时还能得到足够吃一辈子的巧克力糖和其他糖果。全世界购买旺卡巧克力的孩子都有机会。前提是藏在包装纸里的五张金券，...','明天出版社','BookImage/查理和巧克力工厂.jpg',NULL,0),(200211,'侦探伽利略','东野圭吾','2019-04-23','悬疑/推理','上架中','即使看穿了谜团，你仍然会落入作者的诡计之中。汤川与草薙系列第一弹，新本格派推理理时代之作，福山雅治、柴崎幸、北村一辉、唐泽寿明倾情演绎，年度收视冠军日本富士台正在热播中，最耀眼的推理天王东野圭吾再登巅峰，日本通俗文学最高奖项——134届直木奖，《文艺春秋》评选的“十大杰出推理小说”第一名，“十大本格派推理小说”第一名。少年的头突然起火燃烧，是人体自燃？中学生在池边捡到人脸面具，是死者冤魂不散？心脏麻痹的死者，其实是感染怪异疾病？海上突然出现巨大杀人火柱，是超自然现象？目击命案现场的少年，竟是灵魂出壳？日本推理小说史上罕见的“三冠王”，炙手可热的美男子推理作家，凭借与生俱来的天赋破解令人瞠目结舌的疑案，福山雅治携手柴崎幸华丽登场，创意极致的《神探伽利略》席卷全球，看《侦探伽利略》，培养数理化兴趣。','南海出版公司','BookImage/侦探伽利略.jpg',NULL,1);
/*!40000 ALTER TABLE `books_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-27  1:17:10
