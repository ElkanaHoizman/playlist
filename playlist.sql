-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 21, 2018 at 07:11 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `playlist`
--

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

DROP TABLE IF EXISTS `playlists`;
CREATE TABLE IF NOT EXISTS `playlists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET hp8 COLLATE hp8_bin NOT NULL,
  `image` varchar(1000) CHARACTER SET hp8 COLLATE hp8_bin NOT NULL,
  `songs` text CHARACTER SET hp8 COLLATE hp8_bin NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`id`, `name`, `image`, `songs`) VALUES
(8, 'Omer Adam', 'https://www.disi.co.il/songs/Yam/OmerAdam/PaamBahaim.jpg', '[{\"name\":\"Paam Bachaim\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/OmerAdam\\/077.mp3\"},{\"name\":\"Achrey Kol Hashanim\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/OmerAdam\\/059.mp3\"},{\"name\":\"Mabit Mehazad\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/OmerAdam\\/064.mp3\"},{\"name\":\"Biduk Camony\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/OmerAdam\\/065.mp3\"},{\"name\":\"Hen Bi Coach\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/OmerAdam\\/070.mp3\"},{\"name\":\"Elaich Shar\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/OmerAdam\\/073.mp3\"},{\"name\":\"Od Mechake\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/OmerAdam\\/074.mp3\"}]'),
(10, 'Shlomi Shabat', 'https://www.disi.co.il/songs/Yam/ShlomiShabat/EtsliHalaila.jpg', '[{\"name\":\"Rotze Lichyot\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/089.mp3\"},{\"name\":\"Mehoav Miday\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/087.mp3\"},{\"name\":\"Rafsoda\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/080.mp3\"},{\"name\":\"Romi\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/079.mp3\"},{\"name\":\"Lo Megale\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/078.mp3\"},{\"name\":\"Halev\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/077.mp3\"},{\"name\":\"Bereshit Olam\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/072.mp3\"},{\"name\":\"Hen Od Milvado\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/070.mp3\"}]'),
(11, 'Shlomi Shabat', 'https://www.disi.co.il/songs/Yam/ShlomiShabat/RotseLihiot.jpg', '[{\"name\":\"Rotze Lichyot\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/089.mp3\"},{\"name\":\"Mehoav Miday\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/087.mp3\"},{\"name\":\"Rafsoda\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/080.mp3\"},{\"name\":\"Romi\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/079.mp3\"},{\"name\":\"Lo Megale\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/078.mp3\"},{\"name\":\"Halev\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/077.mp3\"},{\"name\":\"Bereshit Olam\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/072.mp3\"},{\"name\":\"Hen Od Milvado\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/ShlomiShabat\\/070.mp3\"}]'),
(16, 'Idan Amedi', 'https://www.disi.co.il/songs/Yam/IdanAmedi/HelekMeazman.jpg', '[{\"name\":\"Basof\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/IdanAmedi\\/027.mp3\"},{\"name\":\"Helek Mehazman\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/IdanAmedi\\/024.mp3\"},{\"name\":\"Mirpeset\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/IdanAmedi\\/028.mp3\"},{\"name\":\"America\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/IdanAmedi\\/029.mp3\"},{\"name\":\"Osher\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/IdanAmedi\\/031.mp3\"},{\"name\":\"Hen Otach\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/IdanAmedi\\/030.mp3\"},{\"name\":\"Tmunot Nof\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/IdanAmedi\\/033.mp3\"}]'),
(17, 'Arkadi Duchin', 'https://www.disi.co.il/songs/Israeli/ArkadiDochin/Moledet.jpg', '[{\"name\":\"Moledet\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Israeli\\/ArkadiDochin\\/096.mp3\"},{\"name\":\"Afuchim\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Israeli\\/ArkadiDochin\\/001.mp3\"},{\"name\":\"Aftahot\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Israeli\\/ArkadiDochin\\/002.mp3\"},{\"name\":\"Taluy Bi\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Israeli\\/ArkadiDochin\\/004.mp3\"}]'),
(18, 'Harel Skat', 'https://www.disi.co.il/songs/Israeli/HarelSkat/ShovMeushar.jpg', '[{\"name\":\"Shuv Meushar\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Israeli\\/HarelSkat\\/018.mp3\"},{\"name\":\"Hameha\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Israeli\\/HarelSkat\\/015.mp3\"},{\"name\":\"Haceev Aze\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Israeli\\/HarelSkat\\/016.mp3\"},{\"name\":\"Lehan\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Israeli\\/HarelSkat\\/001.mp3\"},{\"name\":\"Helaich\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Israeli\\/HarelSkat\\/002.mp3\"},{\"name\":\"Milim\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Israeli\\/HarelSkat\\/003.mp3\"},{\"name\":\"Sof\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Israeli\\/HarelSkat\\/004.mp3\"}]'),
(22, 'Haim Israel', 'https://www.disi.co.il/songs/Yam/HaimIsrael/DerechHadash.jpg', '[{\"name\":\"Hani Chozer\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HaimIsrael\\/035.mp3\"},{\"name\":\"Hastara\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HaimIsrael\\/034.mp3\"},{\"name\":\"Sipur Chaiay\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HaimIsrael\\/052.mp3\"},{\"name\":\"Sameach\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HaimIsrael\\/053.mp3\"},{\"name\":\"Nedudim\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HaimIsrael\\/054.mp3\"},{\"name\":\"Ten Li\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HaimIsrael\\/055.mp3\"},{\"name\":\"Zichronot\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HaimIsrael\\/057.mp3\"}]'),
(23, 'Amir Benayun', 'https://www.disi.co.il/songs/Yam/AmirBenayoun/SofaA.jpg', '[{\"name\":\"Ahemet\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/AmirBenayoun\\/120.mp3\"},{\"name\":\"Ksheyavo Sheket\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/AmirBenayoun\\/122.mp3\"},{\"name\":\"Becol Horef\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/AmirBenayoun\\/121.mp3\"},{\"name\":\"Sufa\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/AmirBenayoun\\/117.mp3\"},{\"name\":\"Beyom Sagrir\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/AmirBenayoun\\/125.mp3\"},{\"name\":\"Aba\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/AmirBenayoun\\/118.mp3\"},{\"name\":\"Gan Eden\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/AmirBenayoun\\/126.mp3\"}]'),
(26, 'Harel Moyal', 'https://www.disi.co.il/songs/Yam/HarelMoyal/Levadi.jpg', '[{\"name\":\"Pariz\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HarelMoyal\\/047.mp3\"},{\"name\":\"Shetach Esh\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HarelMoyal\\/045.mp3\"},{\"name\":\"Yesh Li Otach\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HarelMoyal\\/042.mp3\"},{\"name\":\"Shabat Bachalon\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HarelMoyal\\/041.mp3\"},{\"name\":\"Ima\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HarelMoyal\\/013.mp3\"},{\"name\":\"Osher\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HarelMoyal\\/004.mp3\"},{\"name\":\"Sami\",\"url\":\"https:\\/\\/www.disi.co.il\\/songs\\/Yam\\/HarelMoyal\\/014.mp3\"}]');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
