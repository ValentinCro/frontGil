-- phpMyAdmin SQL Dump
-- version 4.4.15.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 18, 2016 at 04:14 PM
-- Server version: 5.5.46-0+deb7u1-log
-- PHP Version: 5.4.45-0+deb7u2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `valentinCro`
--

-- --------------------------------------------------------

--
-- Table structure for table `centreinteret`
--

CREATE TABLE IF NOT EXISTS `centreinteret` (
  `id` int(11) NOT NULL,
  `intitule` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `centreinteret`
--

INSERT INTO `centreinteret` (`id`, `intitule`) VALUES
(1, 'Natation'),
(2, 'Cinéma'),
(3, 'Séries TV');

-- --------------------------------------------------------

--
-- Table structure for table `champions`
--

CREATE TABLE IF NOT EXISTS `champions` (
  `id` int(11) NOT NULL,
  `idRiot` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `image` text NOT NULL,
  `imageLoader` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `champions`
--

INSERT INTO `champions` (`id`, `idRiot`, `name`, `image`, `imageLoader`) VALUES
(1, 266, 'Aatrox', 'Aatrox.png', 'Aatrox_0.jpg'),
(2, 103, 'Ahri', 'Ahri.png', 'Ahri_0.jpg'),
(3, 84, 'Akali', 'Akali.png', 'Akali_0.jpg'),
(4, 12, 'Alistar', 'Alistar.png', 'Alistar_0.jpg'),
(5, 32, 'Amumu', 'Amumu.png', 'Amumu_0.jpg'),
(6, 34, 'Anivia', 'Anivia.png', 'Anivia_0.jpg'),
(7, 1, 'Annie', 'Annie.png', 'Annie_0.jpg'),
(8, 22, 'Ashe', 'Ashe.png', 'Ashe_0.jpg'),
(9, 268, 'Azir', 'Azir.png', 'Azir_0.jpg'),
(10, 432, 'Bard', 'Bard.png', 'Bard_0.jpg'),
(11, 53, 'Blitzcrank', 'Blitzcrank.png', 'Blitzcrank_0.jpg'),
(12, 63, 'Brand', 'Brand.png', 'Brand_0.jpg'),
(13, 201, 'Braum', 'Braum.png', 'Braum_0.jpg'),
(14, 51, 'Caitlyn', 'Caitlyn.png', 'Caitlyn_0.jpg'),
(15, 69, 'Cassiopeia', 'Cassiopeia.png', 'Cassiopeia_0.jpg'),
(16, 42, 'Corki', 'Corki.png', 'Corki_0.jpg'),
(17, 122, 'Darius', 'Darius.png', 'Darius_0.jpg'),
(18, 131, 'Diana', 'Diana.png', 'Diana_0.jpg'),
(19, 119, 'Draven', 'Draven.png', 'Draven_0.jpg'),
(20, 36, 'Dr. Mundo', 'DrMundo.png', 'Dr. Mundo_0.jpg'),
(21, 245, 'Ekko', 'Ekko.png', 'Ekko_0.jpg'),
(22, 60, 'Elise', 'Elise.png', 'Elise_0.jpg'),
(23, 28, 'Evelynn', 'Evelynn.png', 'Evelynn_0.jpg'),
(24, 81, 'Ezreal', 'Ezreal.png', 'Ezreal_0.jpg'),
(25, 9, 'Fiddlesticks', 'FiddleSticks.png', 'Fiddlesticks_0.jpg'),
(26, 114, 'Fiora', 'Fiora.png', 'Fiora_0.jpg'),
(27, 105, 'Fizz', 'Fizz.png', 'Fizz_0.jpg'),
(28, 3, 'Galio', 'Galio.png', 'Galio_0.jpg'),
(29, 41, 'Gangplank', 'Gangplank.png', 'Gangplank_0.jpg'),
(30, 86, 'Garen', 'Garen.png', 'Garen_0.jpg'),
(31, 150, 'Gnar', 'Gnar.png', 'Gnar_0.jpg'),
(32, 79, 'Gragas', 'Gragas.png', 'Gragas_0.jpg'),
(33, 104, 'Graves', 'Graves.png', 'Graves_0.jpg'),
(34, 120, 'Hecarim', 'Hecarim.png', 'Hecarim_0.jpg'),
(35, 74, 'Heimerdinger', 'Heimerdinger.png', 'Heimerdinger_0.jpg'),
(36, 39, 'Irelia', 'Irelia.png', 'Irelia_0.jpg'),
(37, 40, 'Janna', 'Janna.png', 'Janna_0.jpg'),
(38, 59, 'Jarvan IV', 'JarvanIV.png', 'Jarvan IV_0.jpg'),
(39, 24, 'Jax', 'Jax.png', 'Jax_0.jpg'),
(40, 126, 'Jayce', 'Jayce.png', 'Jayce_0.jpg'),
(41, 222, 'Jinx', 'Jinx.png', 'Jinx_0.jpg'),
(42, 429, 'Kalista', 'Kalista.png', 'Kalista_0.jpg'),
(43, 43, 'Karma', 'Karma.png', 'Karma_0.jpg'),
(44, 30, 'Karthus', 'Karthus.png', 'Karthus_0.jpg'),
(45, 38, 'Kassadin', 'Kassadin.png', 'Kassadin_0.jpg'),
(46, 55, 'Katarina', 'Katarina.png', 'Katarina_0.jpg'),
(47, 10, 'Kayle', 'Kayle.png', 'Kayle_0.jpg'),
(48, 85, 'Kennen', 'Kennen.png', 'Kennen_0.jpg'),
(49, 203, 'Kindred', 'Kindred.png', 'Kindred_0.jpg'),
(50, 7, 'LeBlanc', 'Leblanc.png', 'LeBlanc_0.jpg'),
(51, 64, 'Lee Sin', 'LeeSin.png', 'Lee Sin_0.jpg'),
(52, 89, 'Leona', 'Leona.png', 'Leona_0.jpg'),
(53, 127, 'Lissandra', 'Lissandra.png', 'Lissandra_0.jpg'),
(54, 236, 'Lucian', 'Lucian.png', 'Lucian_0.jpg'),
(55, 117, 'Lulu', 'Lulu.png', 'Lulu_0.jpg'),
(56, 99, 'Lux', 'Lux.png', 'Lux_0.jpg'),
(57, 54, 'Malphite', 'Malphite.png', 'Malphite_0.jpg'),
(58, 90, 'Malzahar', 'Malzahar.png', 'Malzahar_0.jpg'),
(59, 57, 'Maokai', 'Maokai.png', 'Maokai_0.jpg'),
(60, 11, 'Master Yi', 'MasterYi.png', 'Master Yi_0.jpg'),
(61, 21, 'Miss Fortune', 'MissFortune.png', 'Miss Fortune_0.jpg'),
(62, 62, 'Wukong', 'MonkeyKing.png', 'Wukong_0.jpg'),
(63, 82, 'Mordekaiser', 'Mordekaiser.png', 'Mordekaiser_0.jpg'),
(64, 25, 'Morgana', 'Morgana.png', 'Morgana_0.jpg'),
(65, 267, 'Nami', 'Nami.png', 'Nami_0.jpg'),
(66, 75, 'Nasus', 'Nasus.png', 'Nasus_0.jpg'),
(67, 111, 'Nautilus', 'Nautilus.png', 'Nautilus_0.jpg'),
(68, 76, 'Nidalee', 'Nidalee.png', 'Nidalee_0.jpg'),
(69, 56, 'Nocturne', 'Nocturne.png', 'Nocturne_0.jpg'),
(70, 20, 'Nunu', 'Nunu.png', 'Nunu_0.jpg'),
(71, 2, 'Olaf', 'Olaf.png', 'Olaf_0.jpg'),
(72, 61, 'Orianna', 'Orianna.png', 'Orianna_0.jpg'),
(73, 80, 'Pantheon', 'Pantheon.png', 'Pantheon_0.jpg'),
(74, 78, 'Poppy', 'Poppy.png', 'Poppy_0.jpg'),
(75, 133, 'Quinn', 'Quinn.png', 'Quinn_0.jpg'),
(76, 33, 'Rammus', 'Rammus.png', 'Rammus_0.jpg'),
(77, 58, 'Renekton', 'Renekton.png', 'Renekton_0.jpg'),
(78, 107, 'Rengar', 'Rengar.png', 'Rengar_0.jpg'),
(79, 92, 'Riven', 'Riven.png', 'Riven_0.jpg'),
(80, 68, 'Rumble', 'Rumble.png', 'Rumble_0.jpg'),
(81, 13, 'Ryze', 'Ryze.png', 'Ryze_0.jpg'),
(82, 113, 'Sejuani', 'Sejuani.png', 'Sejuani_0.jpg'),
(83, 35, 'Shaco', 'Shaco.png', 'Shaco_0.jpg'),
(84, 98, 'Shen', 'Shen.png', 'Shen_0.jpg'),
(85, 102, 'Shyvana', 'Shyvana.png', 'Shyvana_0.jpg'),
(86, 27, 'Singed', 'Singed.png', 'Singed_0.jpg'),
(87, 14, 'Sion', 'Sion.png', 'Sion_0.jpg'),
(88, 15, 'Sivir', 'Sivir.png', 'Sivir_0.jpg'),
(89, 72, 'Skarner', 'Skarner.png', 'Skarner_0.jpg'),
(90, 37, 'Sona', 'Sona.png', 'Sona_0.jpg'),
(91, 16, 'Soraka', 'Soraka.png', 'Soraka_0.jpg'),
(92, 50, 'Swain', 'Swain.png', 'Swain_0.jpg'),
(93, 134, 'Syndra', 'Syndra.png', 'Syndra_0.jpg'),
(94, 223, 'Tahm Kench', 'TahmKench.png', 'Tahm Kench_0.jpg'),
(95, 91, 'Talon', 'Talon.png', 'Talon_0.jpg'),
(96, 44, 'Taric', 'Taric.png', 'Taric_0.jpg'),
(97, 17, 'Teemo', 'Teemo.png', 'Teemo_0.jpg'),
(98, 412, 'Thresh', 'Thresh.png', 'Thresh_0.jpg'),
(99, 18, 'Tristana', 'Tristana.png', 'Tristana_0.jpg'),
(100, 48, 'Trundle', 'Trundle.png', 'Trundle_0.jpg'),
(101, 23, 'Tryndamere', 'Tryndamere.png', 'Tryndamere_0.jpg'),
(102, 4, 'Twisted Fate', 'TwistedFate.png', 'Twisted Fate_0.jpg'),
(103, 29, 'Twitch', 'Twitch.png', 'Twitch_0.jpg'),
(104, 77, 'Udyr', 'Udyr.png', 'Udyr_0.jpg'),
(105, 6, 'Urgot', 'Urgot.png', 'Urgot_0.jpg'),
(106, 110, 'Varus', 'Varus.png', 'Varus_0.jpg'),
(107, 67, 'Vayne', 'Vayne.png', 'Vayne_0.jpg'),
(108, 45, 'Veigar', 'Veigar.png', 'Veigar_0.jpg'),
(109, 254, 'Vi', 'Vi.png', 'Vi_0.jpg'),
(110, 112, 'Viktor', 'Viktor.png', 'Viktor_0.jpg'),
(111, 8, 'Vladimir', 'Vladimir.png', 'Vladimir_0.jpg'),
(112, 106, 'Volibear', 'Volibear.png', 'Volibear_0.jpg'),
(113, 19, 'Warwick', 'Warwick.png', 'Warwick_0.jpg'),
(114, 101, 'Xerath', 'Xerath.png', 'Xerath_0.jpg'),
(115, 5, 'Xin Zhao', 'XinZhao.png', 'Xin Zhao_0.jpg'),
(116, 157, 'Yasuo', 'Yasuo.png', 'Yasuo_0.jpg'),
(117, 83, 'Yorick', 'Yorick.png', 'Yorick_0.jpg'),
(118, 154, 'Zac', 'Zac.png', 'Zac_0.jpg'),
(119, 238, 'Zed', 'Zed.png', 'Zed_0.jpg'),
(120, 115, 'Ziggs', 'Ziggs.png', 'Ziggs_0.jpg'),
(121, 26, 'Zilean', 'Zilean.png', 'Zilean_0.jpg'),
(122, 143, 'Zyra', 'Zyra.png', 'Zyra_0.jpg'),
(123, 31, 'Cho''Gath', 'Chogath.png', 'Cho''Gath_0.jpg'),
(124, 121, 'Kha''Zix', 'Khazix.png', 'Kha''Zix_0.jpg'),
(125, 96, 'Kog''Maw', 'KogMaw.png', 'Kog''Maw_0.jpg'),
(126, 421, 'Rek''Sai', 'RekSai.png', 'Rek''Sai_0.jpg'),
(127, 161, 'Vel''Koz', 'Velkoz.png', 'Vel''Koz_0.jpg'),
(128, 420, 'Illaoi', 'Illaoi.png', 'Illaoi_0.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `commentaires`
--

CREATE TABLE IF NOT EXISTS `commentaires` (
  `id` int(11) NOT NULL,
  `idNews` int(11) NOT NULL,
  `author` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commentaires`
--

INSERT INTO `commentaires` (`id`, `idNews`, `author`, `date`, `content`) VALUES
(25, 6, 'Anonyme', '2015-11-02', 'Salut. Vivement les nouveaux jeux. \n:-) '),
(28, 8, 'RammfanTheOne', '2015-11-30', 'Yoooo !! Belle mise à jour ! '),
(29, 8, 'nephi', '2016-01-18', 'Merci :)');

-- --------------------------------------------------------

--
-- Table structure for table `competences`
--

CREATE TABLE IF NOT EXISTS `competences` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `intitule` varchar(40) CHARACTER SET utf8 NOT NULL,
  `pourcentage` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `competences`
--

INSERT INTO `competences` (`id`, `type`, `intitule`, `pourcentage`) VALUES
(1, 0, 'PHP', 60),
(2, 0, 'JAVA', 80),
(3, 0, 'HTML', 60),
(4, 0, 'C', 70),
(5, 0, 'SHELL', 40),
(6, 0, 'VBA', 60),
(7, 0, 'CSS', 60),
(8, 0, 'Javascript', 70),
(9, 0, 'JEE', 80),
(10, 0, 'PSQL', 50),
(11, 1, 'Linux', 80),
(12, 1, 'Windows', 60),
(13, 1, 'Photoshop', 60),
(14, 1, 'Eclipse', 80),
(15, 1, 'IntellIJ', 80),
(16, 1, 'phpStorm', 80),
(17, 1, 'Geany', 60),
(18, 1, 'Access', 90),
(19, 1, 'PHPmyAdmin', 80);

-- --------------------------------------------------------

--
-- Table structure for table `experiencepro`
--

CREATE TABLE IF NOT EXISTS `experiencepro` (
  `id` int(11) NOT NULL,
  `intitule` text NOT NULL,
  `legend` text NOT NULL,
  `detail` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `experiencepro`
--

INSERT INTO `experiencepro` (`id`, `intitule`, `legend`, `detail`) VALUES
(1, 'Avril 2015-Juillet 2015 : Chez ADESTI Mont Saint-Aignan (3 mois, stage)', 'Développement & conception d''un logiciel comptabilité, Développement & conception d''une procédure d''envoi de mail automatique', 'Pendant ce stage j''ai été amené à réaliser deux projets différents.\r\nLe premier, le principal, était à destination du service comptabilité qui utilise deux logiciels possédant une base de données propre au logiciel. Ces deux bases de données sont indépendantes l''une de l''autres.\r\nLes informations contenues dans ces deux base de données représentaient des factures d''un coté et de l''autre des règlements de ces factures.\r\nLe logiciel avait pour principal but de récupérer les informations concernant un client préalablement renseigné, de calculer le solde de son compte et d''afficher le tout dans un navigateur. C''est pour cela que ce logiciel à été développer en J2EE.\r\nLa deuxième fonctionnalité principal était d''afficher un indicateur. cet indicateur est composé d''au minimum deux courbe, avec pour repère un montant sur une date (sur une année). La première courbe est la courbe de facturation et la deuxième courbe est la courbe de règlements. Ce qui permet de voir l''écart entre les deux courbes et donc le montant que les clients nous doivent. On peut superposer plusieurs années afin de pouvoir comparer les années.'),
(2, 'Avril 2014-Juin 2014 : Chez ADF Normandie (10 semaines, stage)', 'Développement & Conception d''un progiciel d''assistance à la création de deux documents internes à l''entreprise', ''),
(3, '2012-2014 : Emploi saisonnier à la Chambre des Commerces et de l''Industrie du Havre', 'Agent de péage au pont de Normandie', ''),
(4, '2011-2012 : Manutentionnaire chez Multimodal', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `experiencepro_tag`
--

CREATE TABLE IF NOT EXISTS `experiencepro_tag` (
  `id` int(11) NOT NULL,
  `id_exp` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `experiencepro_tag`
--

INSERT INTO `experiencepro_tag` (`id`, `id_exp`, `id_tag`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `freeChamp`
--

CREATE TABLE IF NOT EXISTS `freeChamp` (
  `id` int(11) NOT NULL,
  `idRiot` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `image` varchar(40) NOT NULL,
  `imageLoader` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3494 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `freeChamp`
--

INSERT INTO `freeChamp` (`id`, `idRiot`, `name`, `image`, `imageLoader`) VALUES
(3484, 32, 'Amumu', 'Amumu.png', 'Amumu_0.jpg'),
(3485, 432, 'Bard', 'Bard.png', 'Bard_0.jpg'),
(3486, 201, 'Braum', 'Braum.png', 'Braum_0.jpg'),
(3487, 69, 'Cassiopeia', 'Cassiopeia.png', 'Cassiopeia_0.jpg'),
(3488, 28, 'Evelynn', 'Evelynn.png', 'Evelynn_0.jpg'),
(3489, 41, 'Gangplank', 'Gangplank.png', 'Gangplank_0.jpg'),
(3490, 15, 'Sivir', 'Sivir.png', 'Sivir_0.jpg'),
(3491, 67, 'Vayne', 'Vayne.png', 'Vayne_0.jpg'),
(3492, 161, 'Vel\\''Koz', 'Velkoz.png', 'Vel\\''Koz_0.jpg'),
(3493, 8, 'Vladimir', 'Vladimir.png', 'Vladimir_0.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `haveChamp`
--

CREATE TABLE IF NOT EXISTS `haveChamp` (
  `idUser` int(11) NOT NULL,
  `idChamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `haveChamp`
--

INSERT INTO `haveChamp` (`idUser`, `idChamp`) VALUES
(1, 70),
(1, 95),
(1, 97),
(1, 108),
(1, 52),
(1, 87),
(1, 46),
(1, 47),
(1, 128),
(1, 129),
(1, 123),
(1, 124),
(5, 123),
(5, 47),
(5, 66),
(5, 70),
(5, 71),
(5, 73),
(5, 87),
(5, 88),
(5, 97),
(5, 108),
(1, 12),
(1, 1),
(1, 22),
(1, 53),
(1, 122),
(1, 119),
(1, 28),
(1, 9),
(1, 105),
(1, 86),
(1, 39),
(1, 24),
(1, 126),
(1, 55),
(1, 121),
(1, 89),
(1, 127),
(1, 99),
(1, 54),
(1, 11),
(1, 25),
(1, 20),
(1, 58),
(1, 13),
(1, 35),
(1, 14),
(1, 16),
(1, 91),
(1, 17),
(1, 18),
(1, 23),
(1, 45),
(1, 8),
(1, 62),
(1, 5),
(1, 31),
(1, 10),
(1, 32),
(5, 103),
(5, 12),
(5, 32),
(5, 1),
(5, 22),
(5, 53),
(5, 31),
(5, 245),
(5, 28),
(5, 81),
(5, 9),
(5, 86),
(5, 39),
(5, 40),
(5, 43),
(5, 30),
(5, 38),
(5, 10),
(5, 7),
(5, 99),
(5, 54),
(5, 11),
(5, 25),
(5, 75),
(5, 111),
(5, 20),
(5, 2),
(5, 80),
(5, 78),
(5, 13),
(5, 14),
(5, 15),
(5, 16),
(5, 17),
(5, 18),
(5, 23),
(5, 4),
(5, 29),
(5, 110),
(5, 45),
(5, 19),
(5, 62),
(5, 26),
(5, 27),
(1, 15),
(5, 36),
(1, 26),
(1, 78),
(1, 98),
(5, 41);

-- --------------------------------------------------------

--
-- Table structure for table `idcard`
--

CREATE TABLE IF NOT EXISTS `idcard` (
  `id` int(11) NOT NULL,
  `intitule` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `idcard`
--

INSERT INTO `idcard` (`id`, `intitule`) VALUES
(1, 'Valentin CROCHEMORE<br /> \r\nRouen <br /> \r\ncrochemore point valentin at live point fr <br /> \r\n22 ans <br /> \r\nPermis B (Véhicule personnel)<br /> ');

-- --------------------------------------------------------

--
-- Table structure for table `langue`
--

CREATE TABLE IF NOT EXISTS `langue` (
  `id` int(11) NOT NULL,
  `intitule` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `langue`
--

INSERT INTO `langue` (`id`, `intitule`) VALUES
(1, 'Anglais : Niveau européen B2');

-- --------------------------------------------------------

--
-- Table structure for table `lolversion`
--

CREATE TABLE IF NOT EXISTS `lolversion` (
  `id` int(11) NOT NULL,
  `version` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lolversion`
--

INSERT INTO `lolversion` (`id`, `version`) VALUES
(0, '6.1.1');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `title` text NOT NULL,
  `contenu` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `date`, `title`, `contenu`) VALUES
(1, '2015-09-16', 'Lancement du site, version 1.0-Beta', 'Bienvenue sur l''accueil du site,<br /><br />\nSur cet accueil seront présentes sous forme de news/changeLog les nouveautés apportées au site ansi que les développements en cours, voir l''avancement de certain projet.<br />Je vais aussi y mettre des rapports, des avis, bref un peu de tout.<br />\nOn attaque avec la liste des nouveautés :<br />\n<ul>\n<li>Ajout de l''accueil en version final</li>\n<li><a href="http://cv.valentincrochemore.fr/">Ajout du CV en version quasi final</a></li>\n<li><a href="http://reversi.valentincrochemore.fr/">Ajout du reversi_1.0</a>\n</ul><br /><br />\nEn ce qui concerne les développements en cours :<br />\n<ul>\n<li>Les formations(CV)</li>\n<li>Les détails des expériences professionnelles en FR</li>\n<li>La traduction des détails des expériences professionnelles en ENG</li>\n<li>Correction de certains bugs du reversi</li>\n<li>Une page de rappel des règles du reversi</li>\n</ul>\n\nVoilà, voilà c''est à peu près tout. Rendez-vous dans un prochain post.'),
(3, '2015-09-18', 'Rapport d''avancement', 'Hello !!\n<br /><br />\nAujourd''hui peu de nouveautés vraiment visibles. J''ai rajouté les formations sous la forme d''une frise chronologique.<br />\nLe reversi passe en version 1.01 avec la correction de bugs :<br />\n<ul>\n<li>Correction d''un bug permettant de charger un plateau vide</li>\n<li>Amélioration de l''ergonomie et du comportement du menu de gauche (paramètre, charger ...)</li>\n<li>Récupération de la session sur le menu de connexion afin d''éviter de se reconnecter alors que la session n''est pas fermée</li>\n</ul><br /><br />\n\nPour ce qui est des développements en cours : <br />\n<ul>\n<li>Ajout d''un système de commentaire sur le CV et l''accueil (au niveau des news)</li>\n<li>Ajout d''un bas de pages renseignant la version des applications présentes</li>\n<li>Une page de rappel des règles du reversi</li>\n<li>Ajout des détails des expériences professionnelles (FR/ENG)</li>\n</ul><br /><br />\n\nVoilà, voilà. Rendez-vous dans un prochain post.'),
(4, '2015-09-28', 'L''accueil évolue', 'Grosse mise à jour aujourd''hui,<br /><br /> L''accueil passe en 1.1 avec l''ajout de deux choses :<br /> <ul> <li>Ajout du système de commentaire</li> <li>Ajout d''un système d''affichage partiel des news afin de ne pas surcharger l''accueil</li> </ul><br /> Le footer a aussi fait sont apparition.<br /><br /> Cela réduit grandement ma TODO liste. Il me reste donc a faire les choses suivantes :<br /> <ul> <li>La page de rappel des règles du reversi</li> <li>L''ajout des détails des expériences professionnelles (FR/ENG)</li> </ul>'),
(5, '2015-10-24', 'Nouvelle interface de jeux', 'L''interface de jeux a été remaniée. En effet la connexion a été séparée du reversi, cela va permettre de créer une plateforme de mini jeux avec pourquoi pas un système de succès (obtenir tel score, jouer un certain nombre de parties etc...)<br/>\nDe plus la page de règles du reversi a été ajoutée.<br /><br />\nLes projet en cours sont donc : <br />\n<ul>\n<li>Mise à jour du design</li>\n<li>Ajout d''un mini jeu mystère ???</li>\n<li>L''ajout des détails des expériences professionnelles (FR/ENG)</li<>\n</ul>'),
(6, '2015-10-28', 'Refonte du site', 'Changement de framework pour moderniser le design du site. Le nouveau framework est Materialize, <a href="http://materializecss.com/">Le lien</a><br/><br/>\nIl reste donc à faire :<br/>\n<ul>\n<li>Ajout d''un mini jeu mystère</li>\n<li>Ajout d''une nouvelle fonctionnalité mystère</li>\n<li>L''ajout des détails des expériences professionnelles (FR/ENG)</li>\n</ul>'),
(8, '2015-11-26', 'Grosse restructuration du site', '<p>Déjà un mois depuis la dernière mise à jour. Beaucoup de changement ont été effectués, qu''ils soient visibles ou non. En premier lieu, j''ai adopté un framework (silex, une version "allégé" de symfony,  <a href="http://silex.sensiolabs.org/">le lien</a>). Le code a donc été remanié de A à Z. Pourquoi ce changement ? Et bien parce qu''un framework c''est vachement bien, ça simplifie la vie, on est obligé de respecter les conventions de ce framework et donc de codé "proprement", le modèle (MVC) est donc plus propre et le code plus flexible.<p/>\n<p>Ensuite, Composer à été mis en place afin de faciliter la gestion des dépendance. Comme vous pouvez le voir bootstrap a refait sont apparition, en effet materialize étant en alpha il présente quelque bug, de plus bootstrap permet beaucoup plus de choses et propose une énorme documentation ainsi qu''une grande communauté. En ce qui concerne le design il va évolué petit à petit afin d''être au final beaucoup plus personnalisé.<p/>\n<p>Pour les nouvelles fonctionnalités, le jeu mystère est en faite un mini pendu. Celui ci est totalement fonctionnel, je rajouterai des mots plus tard. Vous pouvez consulter les scores des autres joueurs.\nLa fonctionnalité mystère est un système de partie aléatoire pour league of legends, pour l''instant on ne peut que renseigné ses champions et consulté la liste des champions gratuits. Le but final et de pouvoir créer des parties (sous forme de salon) chaque utilisateur pour tiré aléatoirement un champion parmis sa liste de champions et tout le monde verra ainsi les résultats des autres. De plus il pouvoir établir une liste de champions à enlever du tirage (pour éviter les champions ennuyants à jouer).<p/>\n<p>Et pour finir une page de profil a été rajoutée, elle regroupe diverses informations sur les utilisateurs (Reversi, pendu et champions).<p/>\n<p>De nombreux bugs ainsi que de nombreuses améliorations ont été apportés aux autres fonctionnalités, je passe donc en stable le CV et le reversi, l''accueil passe en version 2.0.<p/><br/>\n<p>Cette fois pas de liste, je vais corriger les éventuels bugs, amélioré le design et finaliser le système de partie aléatoire pour LoL avant d''''entamer de nouveaux projets.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `parametres`
--

CREATE TABLE IF NOT EXISTS `parametres` (
  `idParam` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `reversiUserColor` varchar(25) NOT NULL DEFAULT '',
  `reversiIAColor` varchar(25) NOT NULL DEFAULT '',
  `reversiBoardColor` varchar(255) NOT NULL DEFAULT '',
  `reversiHelp` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parametres`
--

INSERT INTO `parametres` (`idParam`, `idUser`, `reversiUserColor`, `reversiIAColor`, `reversiBoardColor`, `reversiHelp`) VALUES
(1, 1, '000000', 'ffffff', '008000', 1),
(2, 2, '000000', 'FFFFFF', '008000', 1),
(3, 3, '000000', 'FFFFFF', '008000', 1),
(4, 4, '000000', 'FFFFFF', '008000', 1),
(5, 5, '000000', 'FFFFFF', '008000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penduScore`
--

CREATE TABLE IF NOT EXISTS `penduScore` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `nbVictory` int(11) NOT NULL,
  `nbGame` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `penduScore`
--

INSERT INTO `penduScore` (`id`, `idUser`, `nbVictory`, `nbGame`) VALUES
(1, 1, 17, 20),
(2, 5, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `id` int(11) NOT NULL,
  `intitule` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projet`
--

INSERT INTO `projet` (`id`, `intitule`) VALUES
(1, 'Site internet pour un projet de financement d''un\r\n				voyage scolaire\r\n				(En collaboration avec un autre étudiant,\r\n				<a href="http://sos-info-lehavre.olympe.in/">lien du site</a>)'),
(2, 'Site web personnel avec mon C.V, un jeu du reversi et d''autres fonctionnalités');

-- --------------------------------------------------------

--
-- Table structure for table `projet_tag`
--

CREATE TABLE IF NOT EXISTS `projet_tag` (
  `id` int(11) NOT NULL,
  `id_projet` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projet_tag`
--

INSERT INTO `projet_tag` (`id`, `id_projet`, `id_tag`) VALUES
(1, 2, 4),
(2, 2, 5),
(4, 2, 7),
(5, 2, 8),
(6, 2, 9),
(7, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `save`
--

CREATE TABLE IF NOT EXISTS `save` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `reversiGame` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `save`
--

INSERT INTO `save` (`id`, `idUser`, `reversiGame`) VALUES
(1, 5, '-------------------P------PWB------BWP------P-------------------');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE IF NOT EXISTS `score` (
  `id` int(255) NOT NULL,
  `idUser` int(255) NOT NULL,
  `reversiPoint` int(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`id`, `idUser`, `reversiPoint`) VALUES
(1, 1, -10),
(2, 1, 43),
(3, 2, 46),
(4, 3, 14),
(5, 1, 26),
(6, 1, 44),
(7, 1, 20),
(8, 1, 35),
(9, 1, 24),
(10, 1, 48),
(11, 3, 24),
(12, 4, 34),
(13, 4, 12),
(14, 1, 54),
(15, 3, -16),
(16, 3, -2),
(17, 5, 24),
(18, 1, -10);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE IF NOT EXISTS `tag` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(1, 'J2EE'),
(2, 'VBA'),
(3, 'ACCESS'),
(4, 'PHP'),
(5, 'JS'),
(6, 'JAVA'),
(7, 'SILEX'),
(8, 'BOOTSTRAP'),
(9, 'JQUERY'),
(10, 'HTML');

-- --------------------------------------------------------

--
-- Table structure for table `titre`
--

CREATE TABLE IF NOT EXISTS `titre` (
  `id` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `intitule` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `titre`
--

INSERT INTO `titre` (`id`, `place`, `intitule`) VALUES
(1, 1, 'Développeur Web'),
(2, 2, 'Compétences'),
(3, 3, 'langages'),
(4, 4, 'Logiciels/OS'),
(5, 5, 'Expériences Professionnelles'),
(6, 6, 'Projets personnels et universitaires'),
(7, 8, 'Langues'),
(8, 9, 'Centres d''intérêts'),
(9, 7, 'Formation');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL,
  `login` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `mail` varchar(80) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `mail`) VALUES
(1, 'nephi', '82cb479588e40b786994f08f12c2699ee915f89f', 'val766@hotmail.fr'),
(2, 'amine', '23bc6df7647b818d79ce7fc43fa0f460c188205a', ''),
(3, 'rddu76', 'e18640aba45d7b82629e52ca81ad0406156be1b9', ''),
(4, 'underset', '29475197ed29d53f3e56cfa4eb719e926b55c0e5', ''),
(5, 'RammfanTheOne', '068d7a11820617cb3caef7da070acf6dbedf39f1', 'rammfantheone@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `centreinteret`
--
ALTER TABLE `centreinteret`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `champions`
--
ALTER TABLE `champions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commentaires`
--
ALTER TABLE `commentaires`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competences`
--
ALTER TABLE `competences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiencepro`
--
ALTER TABLE `experiencepro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `experiencepro_tag`
--
ALTER TABLE `experiencepro_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `freeChamp`
--
ALTER TABLE `freeChamp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idRiot` (`idRiot`);

--
-- Indexes for table `idcard`
--
ALTER TABLE `idcard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `langue`
--
ALTER TABLE `langue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parametres`
--
ALTER TABLE `parametres`
  ADD PRIMARY KEY (`idParam`);

--
-- Indexes for table `penduScore`
--
ALTER TABLE `penduScore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projet_tag`
--
ALTER TABLE `projet_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `save`
--
ALTER TABLE `save`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `titre`
--
ALTER TABLE `titre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `centreinteret`
--
ALTER TABLE `centreinteret`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `champions`
--
ALTER TABLE `champions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT for table `commentaires`
--
ALTER TABLE `commentaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `competences`
--
ALTER TABLE `competences`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `experiencepro`
--
ALTER TABLE `experiencepro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `experiencepro_tag`
--
ALTER TABLE `experiencepro_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `freeChamp`
--
ALTER TABLE `freeChamp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3494;
--
-- AUTO_INCREMENT for table `idcard`
--
ALTER TABLE `idcard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `langue`
--
ALTER TABLE `langue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `parametres`
--
ALTER TABLE `parametres`
  MODIFY `idParam` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `penduScore`
--
ALTER TABLE `penduScore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `projet`
--
ALTER TABLE `projet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `projet_tag`
--
ALTER TABLE `projet_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `save`
--
ALTER TABLE `save`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `score`
--
ALTER TABLE `score`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `titre`
--
ALTER TABLE `titre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
