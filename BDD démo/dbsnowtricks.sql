-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 23 juin 2020 à 17:23
-- Version du serveur :  5.7.24
-- Version de PHP : 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbsnowtricks`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trick_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `trick_id`, `content`, `created_at`) VALUES
(1, 1, 1, 'Très bon article', '2020-06-13 10:09:43'),
(4, 1, 1, 'test', '2020-06-13 12:11:32'),
(5, 1, 1, 'Vel armatos cognitis cum vel vobiscum succurrens cognitis stridens dentium dentium adpetitus suae ratione omnes Gallus cum adeste colligi suae et mihi districta ratione viri inquit districta stridens Gallus vobiscum.', '2020-06-13 12:16:14'),
(6, 1, 1, 'test', '2020-06-15 12:43:58'),
(7, 1, 1, 'Pas mal', '2020-06-17 16:58:45'),
(8, 1, 1, 'test', '2020-06-18 13:36:39'),
(9, 1, 20, 'Très bon article', '2020-06-22 17:13:38'),
(10, 1, 20, 'Pas mal', '2020-06-22 17:14:11'),
(11, 1, 20, 'J\'ai vu mieux', '2020-06-22 17:14:29'),
(12, 1, 20, 'Cum subsidiis Scipionis subsidiis ille pauperis aerario absentia Reguli cum et ex stipe et humatur dotatur liberis adultae Valerius nobilitas.', '2020-06-22 17:15:07'),
(13, 1, 20, 'Incusare membra est inplorans ducebatur gnarus et renidens cum qui deessent multatus mansit abiecto cruciatibus abiecto est multatus sputamine doctus.', '2020-06-22 17:15:19'),
(14, 1, 20, 'Inter alio oppleta repellendos et urgeret Mediam oppleta quoque Mediam varietate repellendos excursus per gentium est et Nabataeis oportunos veterum.', '2020-06-22 17:15:31'),
(15, 1, 20, 'Incedit: familiae dexteris prima iungitur proeliorum memoriam frontem iniectans otiosis quae veteris ita iniectans dein post huic teneros hominum fontes', '2020-06-22 17:15:43'),
(16, 1, 20, 'Ii se sunt fere enim modo ob verbis putant sic qui sed faciunt se iis non amicitias etiam se molestas.', '2020-06-22 17:15:57'),
(17, 1, 20, 'Robustioribus tuum decebat et Vellem nostro sum et aliquis tuus Atratine magis Vellem refutaremus debeo hunc illum meae aetas pudor.', '2020-06-22 17:16:08'),
(18, 1, 20, 'Ut eius ille concertationesque iracundiae probarem a videri maledicta non inquam esset pacto quid tum in philosophia dissentientium concertationesque probarem.', '2020-06-22 17:16:19'),
(19, 1, 20, 'Supplicationem meum homines quam ego rei immortalibus tot Ergo maximis maxime meum decrevi necessitatem sententia cum eadem hominis antea bellis.', '2020-06-22 17:16:31'),
(20, 1, 20, 'Sunt occulte urgebantur rector est vel Apollinaris struuntur conscius atrocium incertum occulte cuius ideoque quo struuntur ideoque indumentum ponderibus cuius.', '2020-06-22 17:16:51'),
(21, 1, 19, 'Primo cultorum possidere suos in non Romana eluxisse annuos puta ignorantes discrepantes abunde quae annuos profecto iactitant indumentorum opibus saevissima.', '2020-06-22 17:17:22'),
(22, 1, 19, 'Ut insperatos et luctuosas narravimus et excita diutius Bellona plus tractibus minimis diutius regis excita saeviens Bellona tractibus primordiis ne.', '2020-06-22 17:17:34'),
(23, 1, 19, 'Possidere puta non virtute se fructus gregariis quos feracium quos divitiis ultimum divitiis inmensum nec opibus maiores non per vultus.', '2020-06-22 17:17:46'),
(24, 1, 19, 'In ipsis sed conservanda ipso fallacibus in fructus animal intractato nemo novo non in etiam eo vetustas et illae impediat.', '2020-06-22 17:17:58'),
(25, 1, 19, 'Gener numeros curam per petit numeros gener Domitiani scrutabatur Galli immodice altiora agens diebus scripta socero numeros per per altiora.', '2020-06-22 17:18:10'),
(26, 1, 19, 'Amicorum prorsus facimus sunt commodis sit Quam sunt vehementius viri quae potius aliquem quibus illa prorsus precari ipsi boni supplicare.', '2020-06-22 17:18:21'),
(27, 1, 19, 'Iam obiecta praedoctis resedit periere nec quid nec essent die nec perferentes stimulis aulaeum imaginarius imaginarius iudex praestituto adhibitis notarii.', '2020-06-22 17:18:33'),
(28, 1, 19, 'Dextris quidam cavatis Spoletium tamen offertur rogati ita instituta nobilium inpigre inpigre observentur artuum inpigre usque vel cavatis tamen vigor', '2020-06-22 17:18:44'),
(29, 1, 19, 'Hoc alia hoc ab vacua atque atque nobis omni conscripti omni atque Nam hoc Nam quis hoc nobis habere sentit.', '2020-06-22 17:18:55'),
(30, 1, 19, 'In vicos quae retroque nec adventu sunt timor iuventutis quae equestrium robur postquam et equestrium opulentos recreati et casu recreati.', '2020-06-22 17:19:07'),
(31, 1, 19, 'Saepe amicissimos honoris ad dirimi honoris amicitiis si non longius Quod nullam tamen esse adulescentiam commodi contentionem longius labefactari longius.', '2020-06-22 17:19:17'),
(32, 1, 18, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 17:19:47'),
(33, 1, 18, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:22:22'),
(34, 1, 18, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:22:22'),
(35, 1, 18, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:22:22'),
(36, 1, 18, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:22:22'),
(37, 1, 18, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:22:22'),
(38, 1, 18, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:22:22'),
(39, 2, 18, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:22:22'),
(40, 2, 18, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:22:22'),
(41, 1, 18, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:22:22'),
(42, 2, 18, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:22:22'),
(43, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:23:52'),
(44, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:23:52'),
(45, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:23:52'),
(46, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:23:52'),
(47, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:23:52'),
(48, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:23:52'),
(49, 2, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:23:52'),
(50, 2, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:23:52'),
(51, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:23:52'),
(52, 2, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:23:52'),
(53, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:24:16'),
(54, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:24:16'),
(55, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:24:16'),
(56, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:24:16'),
(57, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:24:16'),
(58, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:24:16'),
(59, 2, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:24:16'),
(60, 2, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:24:16'),
(61, 1, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:24:16'),
(62, 2, 17, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:24:16'),
(76, 1, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(77, 2, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(78, 1, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(79, 1, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(80, 2, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(81, 1, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(82, 2, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(83, 1, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(84, 2, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(85, 1, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(86, 2, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(87, 1, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(88, 2, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(89, 2, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(90, 1, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(91, 1, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(92, 2, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(93, 2, 9, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:29:46'),
(94, 1, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(95, 2, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(96, 1, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(97, 1, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(98, 2, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(99, 1, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(100, 2, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(101, 1, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(102, 2, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(103, 1, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(104, 2, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(105, 1, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(106, 2, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(107, 2, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(108, 1, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(109, 1, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(110, 2, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(111, 2, 8, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 19:31:26'),
(112, 1, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(113, 2, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(114, 1, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(115, 2, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(116, 1, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(117, 2, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(118, 1, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(119, 2, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(120, 1, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(121, 2, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(122, 1, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(123, 1, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(124, 2, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(125, 2, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(126, 1, 7, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:04:50'),
(127, 1, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(128, 2, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(129, 1, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(130, 2, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(131, 1, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(132, 2, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(133, 1, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(134, 2, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(135, 1, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(136, 2, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(137, 1, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(138, 1, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(139, 2, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(140, 2, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(141, 1, 6, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:06:19'),
(142, 1, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(143, 2, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(144, 1, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(145, 2, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(146, 1, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(147, 2, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(148, 1, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(149, 2, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(150, 1, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(151, 2, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(152, 1, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(153, 1, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(154, 2, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(155, 2, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(156, 1, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:08:47'),
(157, 1, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(158, 2, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(159, 1, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(160, 2, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(161, 1, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(162, 2, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(163, 1, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(164, 2, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(165, 1, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(166, 2, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(167, 1, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(168, 1, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(169, 2, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(170, 2, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(171, 1, 4, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:10:10'),
(172, 1, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(173, 2, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(174, 1, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(175, 2, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(176, 1, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(177, 2, 5, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(178, 1, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(179, 2, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(180, 1, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(181, 2, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(182, 1, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(183, 1, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(184, 2, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(185, 2, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(186, 1, 3, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:13:12'),
(187, 1, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(188, 2, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(189, 1, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(190, 2, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(191, 1, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(192, 2, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(193, 1, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(194, 2, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(195, 1, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(196, 2, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(197, 1, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(198, 1, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(199, 2, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(200, 2, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(201, 1, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:14:34'),
(202, 1, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(203, 2, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(204, 1, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(205, 2, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(206, 1, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(207, 2, 2, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(208, 1, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(209, 2, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(210, 1, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(211, 2, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(212, 1, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(213, 1, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(214, 2, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(215, 2, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(216, 1, 1, 'Posset ad fuisse in dignitatis gloria homines superos superos reductus homines illum gradu clarissimum senatu vesperum videtis mortis quidem est.', '2020-06-22 20:15:53'),
(217, 1, 1, 'Pas mal', '2020-06-22 18:16:42');

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200613093557', '2020-06-13 09:36:24'),
('20200617120835', '2020-06-17 12:08:42');

-- --------------------------------------------------------

--
-- Structure de la table `picture`
--

CREATE TABLE `picture` (
  `id` int(11) NOT NULL,
  `trick_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `picture`
--

INSERT INTO `picture` (`id`, `trick_id`, `name`) VALUES
(1, 1, '54456150fe5a1bc3dcc45c3abddfca43.jpeg'),
(2, 7, '37478eaf1db8afaf61fbca83c13e1bee.jpeg'),
(3, 7, '21d551193a8a5fc2e24007d3ca5e75a1.jpeg'),
(4, 7, '04537ea87cc3dbc1fca6266d39e049f2.jpeg'),
(5, 1, '925f5e36921ab433982fd33e9d5f247a.jpeg'),
(6, 4, '9519d84b64eb3652abdd9add4550d440.jpeg'),
(7, 17, 'e6c3e1aef2f5f598d5bc145888129242.jpeg'),
(8, 17, '9e4d4d4e3166ffc3efe0095d98c97622.jpeg'),
(9, 17, 'b47c8c99d3258b243367ad15ad127212.jpeg'),
(10, 18, '29f9553010c2032dd149e03ae00b1078.jpeg'),
(11, 18, '7e89ad0a1544ae4423e9121ebc3e5d69.jpeg'),
(12, 18, 'af2ff7ba93752faf0df45f845243b4cd.jpeg'),
(13, 19, '55dfe6e1f721bac2880baef5496491a1.jpeg'),
(14, 19, '582952cf70ec31a712f27e691ee2fe5c.jpeg'),
(15, 20, 'a54b5bf70a8e528c9be7ccba6eea0dc0.jpeg'),
(16, 20, '524ad0f23009115d6bed56f72de59e16.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `trick`
--

CREATE TABLE `trick` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `main_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `trick`
--

INSERT INTO `trick` (`id`, `title`, `description`, `category`, `created_at`, `main_image`) VALUES
(1, 'Mute', 'Saisie de la carre frontside de la planche entre les deux pieds avec la main avant', 'Grab', '2020-06-13 09:42:10', 'mute1-5ee49f729d50a.jpeg'),
(2, '360', 'Trois six pour un tour complet', 'Rotation', '2020-06-13 09:43:59', 'friedl-fs-360-0-5ee49fdf96c56.jpeg'),
(3, 'Seat belt', 'saisie du carre frontside à l\'arrière avec la main avant', 'Grab', '2020-06-13 09:45:09', 'mac-5ee4a0258edf6.jpeg'),
(4, 'Mac Twist', 'Les flips agrémentés d\'une vrille existent aussi (Mac Twist, Hakon Flip, ...), mais de manière beaucoup plus rare, et se confondent souvent avec certaines rotations horizontales désaxées', 'Flip', '2020-06-13 09:46:39', '28-5ee4a07f888d3.jpeg'),
(5, 'Hakon Flip', 'Les flips agrémentés d\'une vrille existent aussi (Mac Twist, Hakon Flip, ...), mais de manière beaucoup plus rare, et se confondent souvent avec certaines rotations horizontales désaxées.', 'Flip', '2020-06-13 09:47:40', 'maxresdefault-5ee4a0bd0ec38.jpeg'),
(6, 'Nose slide', 'On peut slider avec la planche centrée par rapport à la barre (celle-ci se situe approximativement au-dessous des pieds du rideur), mais aussi en nose slide.', 'Slide', '2020-06-13 09:49:17', 'unnamed-5ee4a11d9f422.jpeg'),
(7, 'Style Week', 'Saisie de la carre backside de la planche, entre les deux pieds, avec la main avant', 'Grab', '2020-06-13 09:50:52', 'styleweek-5ee4a17c3645e.jpeg'),
(8, '720', 'Sept deux pour deux tours complets', 'Rotation', '2020-06-13 09:56:04', 'f58a0196ca057473efe467f0e0ceb0e9-5ee4a2b433e6e.jpeg'),
(9, 'Indy', 'Saisie de la carre frontside de la planche, entre les deux pieds, avec la main arrière', 'Grab', '2020-06-13 09:59:35', 'weway98epgp01-5ee4a38759b72.jpeg'),
(17, 'Crippler', 'Une autre rotation tête en bas classique qui s\'apparente à un backflip sur un mur frontside de pipe ou un quarter.', 'Rotation', '2020-06-17 13:15:27', 'cri1-5eea177006d7e.jpeg'),
(18, 'Cork', 'Le diminutif de corkscrew qui signifie littéralement tire-bouchon et désignait les premières simples rotations têtes en bas en frontside. Désormais, on utilise le mot cork à toute les sauces pour qualifier les figures où le rider passe la tête en bas, peu importe le sens de rotation. Et dorénavant en compétition, on parle souvent de double cork, triple cork et certains riders vont jusqu\'au quadruple cork !', 'Rotation', '2020-06-17 13:17:30', 'cork-5eea17ea69cc1.jpeg'),
(19, 'Handplant', 'Un trick inspiré du skate qui consiste à tenir en équilibre sur une ou deux mains au sommet d\'une courbe. Existe avec de nombreuses variantes dans les grabs et les rotations.', 'Flip', '2020-06-18 09:25:15', 'hand2-5eeb32fbc27fe.jpeg'),
(20, 'Backside air', 'Le grab star du snowboard qui peut être fait d\'autant de façon différentes qu\'il y a de styles de riders. Il consiste à attraper la carre arrière entre les pieds, ou légèrement devant, et à pousser avec sa jambe arrière pour ramener la planche devant. C\'est une figure phare en pipe ou sur un hip en backside. C\'est généralement avec ce trick que les riders vont le plus haut.', 'Grab', '2020-06-18 09:42:29', 'back3-5eeb37060f2b2.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `catch_phrase` tinytext COLLATE utf8mb4_unicode_ci,
  `token_validate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `reset_token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `roles`, `password`, `catch_phrase`, `token_validate`, `is_valid`, `reset_token`, `picture_name`) VALUES
(1, 'Eliott.geoffroy@gmail.com', 'Eliott', '[]', '$argon2i$v=19$m=65536,t=4,p=1$VHZwVnlGQ0tEVDd3WU9Fbw$vBS9QrFYBkq3QYe0AI3czqJ2UPGRZNbbzQj9qifsEFI', NULL, NULL, 1, '7ffbebecf59ab282069bb673a75fd7b6', 'Undertaker-1-5eeb1fa021959.jpeg'),
(2, 'Eliottish.geoffroy@gmail.com', 'EliottG', '[]', '$argon2i$v=19$m=65536,t=4,p=1$RzFTUDdnTWk5TVl6eHguOQ$Zx3xy/eEYWvvrycN5enXsGCTsK6vpLUKiQ4ztaQ6wag', NULL, NULL, 1, NULL, NULL),
(3, 'paco@mail.com', 'Paco', '[]', '$argon2i$v=19$m=65536,t=4,p=1$UEswTjNDRlh6cjlKWXp0Mw$7w/pJ74ziN/QxGJozO9+ECJHkzq9Wj1V+hhGSY6O8uA', NULL, 'd67e98cf07531b82e992a408998fce0e', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `trick_id` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`id`, `trick_id`, `link`) VALUES
(1, 1, 'https://www.youtube.com/embed/k6aOWf0LDcQ'),
(2, 2, 'https://www.youtube.com/embed/GS9MMT_bNn8'),
(3, 2, 'https://www.youtube.com/embed/PCKrzZNwyoQ'),
(4, 3, 'https://www.youtube.com/embed/4vGEOYNGi_c'),
(5, 4, 'https://www.youtube.com/embed/moIVmIK2G9Y'),
(6, 6, 'https://www.youtube.com/embed/8bmd1NYfIAU'),
(7, 9, 'https://www.youtube.com/embed/6yA3XqjTh_w'),
(8, 9, 'https://www.youtube.com/embed/CA5bURVJ5zk'),
(9, 1, 'https://www.youtube.com/embed/AzJPhQdTRQQ'),
(11, 17, 'https://www.youtube.com/embed/tjMo7FfW2WE'),
(12, 17, 'https://www.youtube.com/embed/CMWel8h2vho'),
(13, 18, 'https://www.youtube.com/embed/FMHiSF0rHF8'),
(14, 18, 'https://www.youtube.com/embed/P5ZI-d-eHsI'),
(15, 18, 'https://www.youtube.com/embed/dhmkRg-sOhQ'),
(16, 19, 'https://www.youtube.com/embed/SIi9EpULILA'),
(17, 19, 'https://www.youtube.com/embed/us8tZcQ1GrY'),
(18, 19, 'https://www.youtube.com/embed/2iS21nuz03Y'),
(19, 20, 'https://www.youtube.com/embed/_CN_yyEn78M'),
(20, 20, 'https://www.youtube.com/embed/jBb52YGzrOc');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526CA76ED395` (`user_id`),
  ADD KEY `IDX_9474526CB281BE2E` (`trick_id`);

--
-- Index pour la table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `picture`
--
ALTER TABLE `picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_16DB4F89B281BE2E` (`trick_id`);

--
-- Index pour la table `trick`
--
ALTER TABLE `trick`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D8F0A91E2B36786B` (`title`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- Index pour la table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CC7DA2CB281BE2E` (`trick_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=218;

--
-- AUTO_INCREMENT pour la table `picture`
--
ALTER TABLE `picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `trick`
--
ALTER TABLE `trick`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_9474526CB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);

--
-- Contraintes pour la table `picture`
--
ALTER TABLE `picture`
  ADD CONSTRAINT `FK_16DB4F89B281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);

--
-- Contraintes pour la table `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `FK_7CC7DA2CB281BE2E` FOREIGN KEY (`trick_id`) REFERENCES `trick` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
