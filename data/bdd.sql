-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 25 nov. 2024 à 10:05
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omeka-s`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` varchar(60) NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('K0DTO51WJeHaNmmCuwMXwero9CLsxiAw', 1, 'API_Keys', '$2y$10$fGs29P/hksJscRWqmmzNquILwZt.lQJ9Evke8eAMT8ib/g1NxiRa6', 0x00000000000000000000000000000001, '2024-11-24 17:06:19', '2024-11-11 13:59:00');

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_entity`
--

CREATE TABLE `csvimport_entity` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `csvimport_entity`
--

INSERT INTO `csvimport_entity` (`id`, `job_id`, `entity_id`, `resource_type`) VALUES
(1, 25, 10, 'items'),
(2, 25, 11, 'items'),
(3, 25, 12, 'items'),
(4, 25, 13, 'items'),
(5, 25, 14, 'items'),
(6, 25, 15, 'items'),
(7, 25, 16, 'items'),
(8, 25, 17, 'items'),
(9, 25, 18, 'items'),
(10, 25, 19, 'items'),
(11, 25, 20, 'items'),
(12, 25, 21, 'items');

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_import`
--

CREATE TABLE `csvimport_import` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `undo_job_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `csvimport_import`
--

INSERT INTO `csvimport_import` (`id`, `job_id`, `undo_job_id`, `comment`, `resource_type`, `has_err`, `stats`) VALUES
(1, 25, NULL, '', 'items', 0, '{\"added\":{\"items\":12}}');

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(3, 'items', 1, 1, NULL, 'Mobilité\nEntreprise de transport\n13/10/2024 20:55:32\nRéduire les émissions de carbone\nRéduire les émissions de carbone\nNon\nManque de données pour optimiser les flux\nApprofondir les recherches\nNon\nRéduire l’utilisation du Carbon\noui\nnon\nmelissaorb02@gmail.com\nMelissa\nOurabah\nNoisy le grand'),
(4, 'items', 1, 1, NULL, 'Moussaoui\nEntreprise de transport\n13/10/2024 22:51:15\nDéveloppement d\'infrastructures de recharge pour véhicules électriques\nRéduire les émissions de carbone\noui, Nous collaborons avec des collectivités locales pour la mise en place de zones de recharge électrique et avec des entreprises technologiques pour intégrer des systèmes de gestion de données de transport en temps réel.\nAccès limité aux infrastructures (pistes cyclables, bornes de recharge)\nTravailler avec des décideurs politiques pour accélérer la mise en place d\'infrastructures adaptées\noui, nous avons introduit des bus électriques dans certaines zones urbaines, équipé nos véhicules d’un système de suivi en temps réel pour optimiser les trajets et mis en place un service de covoiturage pour les trajets domicile-travail en collaboration avec des entreprises locales.\nNous souhaitons développer des partenariats avec des startups spécialisées dans les technologies de recharge rapide pour les véhicules électriques et intégrer l\'intelligence artificielle pour mieux prévoir les flux de passagers et adapter l’offre de transport en conséquence.\n\noui\noui\nmoussaoui.rania755@gmail.com\n\n\nRania\nMoussaoui\n17 Rue Vincent Compoint'),
(5, 'items', 1, 1, NULL, 'Univeristé\nInstitut de recherche / Université\n14/10/2024 08:12:52\nPromotion des plateformes de covoiturage et de partage de véhicules électriques.\nEncourager l\'utilisation de véhicules partagés ou électriques\nNon\nFinancement insuffisant\nCollaborer avec le secteur privé et la société civile\nNon\nAccélérer le développement et l’intégration de véhicules autonomes 100 % électriques, avec des infrastructures adaptées (bornes de recharge, systèmes de contrôle).\nOui\nOui\nnoureddineaitkhouya@gmail.com\nNoureddine \nAit khouya\nAnsieres sur seine'),
(6, 'items', 1, 1, NULL, 'Paris 8\nCitoyen / Usager\n14/10/2024 08:34:08\nLes solutions d’optimisation de parcours, basées sur les données en temps réel (trafic, retards), aident les usagers à gagner du temps et à choisir les meilleurs moyens de transport\nAméliorer l\'efficacité des transports publics\nnon\nFinancement insuffisant\nAméliorer la sécurité et le confort\nnon\nDévelopper et intégrer des véhicules autonomes (bus, voitures, taxis) dans les réseaux de transport urbain pour améliorer la fluidité du trafic, réduire les accidents et offrir des services de transport 24/7. Les véhicules autonomes peuvent être utilisés à la fois pour le transport public et pour des services de livraison, optimisant ainsi les trajets et réduisant les émissions de carbone.\noui\noui\noumaimaelelfazazi01@gmail.com\noumaima\nel elfazazi'),
(7, 'items', 1, 1, NULL, 'R10 LOCATION\nCollectivité locale\n12/10/2024 15:49:06\nLE FINANCEMENT\nAméliorer l\'efficacité des transports publics\nnon\nFinancement insuffisant\nacquisitions de matériel, équipement et travaux\nnon\nCréation d\'un site internet\noui\noui\nmassidireddy@gmail.com\nReddy\nMASSIDI SEMI \nAlfortville 94140, 5 sente de villiers'),
(8, 'items', 1, 1, NULL, 'mokrani islam\nFournisseur d\'énergie\n13/10/2024 17:06:21\nfavoriser l\'écologie\nRéduire les émissions de carbone\nnon\nFinancement insuffisant\ntrouver des partenariat\nnon\ndes technologies de ai\noui\noui\nmokraniislam998@gmail.com\nislam \nmokrani\n75002'),
(9, 'items', 1, 1, NULL, 'Énergies Futures\nCollectivité locale\n01/10/2024 23:37:54\nAccès à des subventions pour financer des infrastructures de recharge pour vélos et voitures électriques.\nDévelopper des infrastructures de mobilité douce (pistes cyclables, trottoirs)\noui, Nous travaillons avec des collectivités locales pour installer des bornes de recharge dans les zones rurales et avec des entreprises de transport pour alimenter leur flotte électrique.\nManque de données pour optimiser les flux\nRechercher des investisseurs privés pour financer des projets d\'infrastructure.\nNous avons déployé un réseau de bornes de recharge rapide dans les zones périurbaines et avons développé des batteries de stockage d\'énergie renouvelable pour alimenter les bornes.\nDéveloppement de solutions de recharge mobile pour véhicules électriques.\noui\noui\ntop@gmail.com\nPierre \nMartin\n10 avenue de la Liberté, 69003 Lyon'),
(10, 'items', 1, 1, NULL, '25/09/2024 20:40:45\nVille de X\n99 Av. Jean Baptiste Clément, 93430 Villetaneuse\nroot@gmail.com'),
(11, 'items', 1, 1, NULL, '25/09/2024 20:43:48\nTechMobility Inc\nDoe\nJoe\n2 Rue de la Liberté, 93200 Saint-Denis\ntest@gmail.com'),
(12, 'items', 1, 1, NULL, '01/10/2024 23:34:56\nMobilité Urbaine Paris\nDubois\nMarie\n15 rue de la République, 75001 Paris\nrep@gmail.com'),
(13, 'items', 1, 1, NULL, '01/10/2024 23:37:54\nÉnergies Futures\nMartin\nPierre\n10 avenue de la Liberté, 69003 Lyon\ntop@gmail.com'),
(14, 'items', 1, 1, NULL, '07/10/2024 11:32:34\nTest 1\ntest\ntestes\nPl. du Maréchal de Lattre de Tassigny, 75016 Paris\ntest2@gmail.com'),
(22, 'items', 1, 1, NULL, ''),
(23, 'items', 1, 1, NULL, 'Hugo\nMartins\nhugo.martins@gmail.com\ntest'),
(24, 'items', 1, 1, NULL, ''),
(29, 'items', 1, 1, NULL, '{\"p\":\"Prénom\",\"v\":\"Bastien\"}\n{\"p\":\"Nom\",\"v\":\"Boa\"}\n{\"p\":\"Email\",\"v\":\"bastien.boa@gmail.com\"}\n{\"p\":\"Possède trajet\",\"v\":\"Non\"}');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(3, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(22, NULL),
(23, NULL),
(24, NULL),
(29, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (6).csv\",\"filesize\":\"2222\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\omeCE79.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-08T09:26:14+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-08T09:26:14+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-08T09:26:14+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-08 09:26:14', '2024-10-08 09:26:14'),
(2, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (7).csv\",\"filesize\":\"2222\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome350B.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"Test\",\"automap_check_names_alone\":false,\"column\":[\"Horodateur\",\"Nom de l\'organisation \\/ entit\\u00e9\",\"Quel est votre r\\u00f4le dans le projet de mobilit\\u00e9 durable ?\",\"Quels sont les principaux objectifs que vous visez en mati\\u00e8re de mobilit\\u00e9 durable ?\",\"Quels sont vos besoins sp\\u00e9cifiques pour atteindre ces objectifs ?\",\"Travaillez-vous actuellement avec d\'autres acteurs du secteur pour r\\u00e9pondre \\u00e0 ces besoins ?\\r\\n(Oui\\/Non)\\r\\nSi oui, veuillez pr\\u00e9ciser avec qui et comment.\",\"Quels sont les principaux obstacles auxquels vous faites face dans le d\\u00e9veloppement de solutions de mobilit\\u00e9 durable ?\",\"Quelles sont vos priorit\\u00e9s pour surmonter ces obstacles ?\",\"Avez-vous mis en \\u0153uvre des solutions innovantes dans le domaine de la mobilit\\u00e9 durable ?\\r\\n(Oui\\/Non)\\r\\nSi oui, veuillez d\\u00e9tailler les solutions mises en place.\",\"Quels types d\'innovation technologique ou de collaboration souhaiteriez-vous d\\u00e9velopper \\u00e0 l\'avenir ?\",\"Souhaitez-vous \\u00eatre contact\\u00e9 pour participer \\u00e0 des projets collaboratifs en mobilit\\u00e9 durable ?\\r\\n(Oui\\/Non)\",\"Si oui, veuillez indiquer vos coordonn\\u00e9es :\",\"Nom\",\"prenom\",\"Adresse\",\"T\\u00e9l\\u00e9phone\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-08T09:28:42+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-08T09:28:42+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-08T09:28:42+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-08 09:28:42', '2024-10-08 09:28:42'),
(3, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (6).csv\",\"filesize\":\"2222\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\omeC2C9.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"Horodateur\",\"Nom de l\'organisation \\/ entit\\u00e9\",\"Quel est votre r\\u00f4le dans le projet de mobilit\\u00e9 durable ?\",\"Quels sont les principaux objectifs que vous visez en mati\\u00e8re de mobilit\\u00e9 durable ?\",\"Quels sont vos besoins sp\\u00e9cifiques pour atteindre ces objectifs ?\",\"Travaillez-vous actuellement avec d\'autres acteurs du secteur pour r\\u00e9pondre \\u00e0 ces besoins ?\\r\\n(Oui\\/Non)\\r\\nSi oui, veuillez pr\\u00e9ciser avec qui et comment.\",\"Quels sont les principaux obstacles auxquels vous faites face dans le d\\u00e9veloppement de solutions de mobilit\\u00e9 durable ?\",\"Quelles sont vos priorit\\u00e9s pour surmonter ces obstacles ?\",\"Avez-vous mis en \\u0153uvre des solutions innovantes dans le domaine de la mobilit\\u00e9 durable ?\\r\\n(Oui\\/Non)\\r\\nSi oui, veuillez d\\u00e9tailler les solutions mises en place.\",\"Quels types d\'innovation technologique ou de collaboration souhaiteriez-vous d\\u00e9velopper \\u00e0 l\'avenir ?\",\"Souhaitez-vous \\u00eatre contact\\u00e9 pour participer \\u00e0 des projets collaboratifs en mobilit\\u00e9 durable ?\\r\\n(Oui\\/Non)\",\"Si oui, veuillez indiquer vos coordonn\\u00e9es :\",\"Nom\",\"prenom\",\"Adresse\",\"T\\u00e9l\\u00e9phone\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-13T09:32:03+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-13T09:32:03+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-13T09:32:03+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-13 09:32:03', '2024-10-13 09:32:03'),
(4, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (8).csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\omeF4EC.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-item_set\":{\"12\":\"foaf:familyName\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-14T09:11:33+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-14T09:11:33+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-14T09:11:34+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-14 09:11:33', '2024-10-14 09:11:34'),
(5, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (8).csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome4FAD.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":{\"12\":\"Nom\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 09:15:50', NULL),
(6, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (8).csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome48A5.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 09:17:05', NULL),
(7, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (8).csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome8B87.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 09:18:24', NULL),
(8, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (8).csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome9866.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 09:20:39', NULL),
(9, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (8).csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\omeBD7F.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-14T09:21:52+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-14T09:21:52+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-14T09:21:52+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-14 09:21:52', '2024-10-14 09:21:52'),
(10, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (8).csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome189E.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 09:36:33', NULL),
(11, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (8).csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome507F.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 09:49:50', NULL),
(12, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (8).csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome699C.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":{\"12\":\"Nom\"},\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-14T10:49:06+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-14T10:49:06+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-14T10:49:06+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-14 10:49:06', '2024-10-14 10:49:06'),
(13, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (8).csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome2D79.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-14T11:04:07+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-14T11:04:07+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-14T11:04:07+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-14 11:04:07', '2024-10-14 11:04:07'),
(14, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1 (8).csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\omeA8FA.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":{\"12\":\"Nom\"},\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 11:10:12', NULL),
(15, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\omeF86F.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":{\"12\":\"Nom\"},\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 11:11:29', NULL),
(16, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome6DA8.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":{\"12\":\"Nom\"},\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 11:17:27', NULL),
(17, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome8B01.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 11:54:23', NULL),
(18, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome628B.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":[\"Horodateur\",\"Nom de l\'organisation \\/ entit\\u00e9\",\"Quel est votre r\\u00f4le dans le projet de mobilit\\u00e9 durable ?\",\"Quels sont les principaux objectifs que vous visez en mati\\u00e8re de mobilit\\u00e9 durable ?\",\"Quels sont vos besoins sp\\u00e9cifiques pour atteindre ces objectifs ?\",\"Travaillez-vous actuellement avec d\'autres acteurs du secteur pour r\\u00e9pondre \\u00e0 ces besoins ?\\r\\n(Oui\\/Non)\\r\\nSi oui, veuillez pr\\u00e9ciser avec qui et comment.\",\"Quels sont les principaux obstacles auxquels vous faites face dans le d\\u00e9veloppement de solutions de mobilit\\u00e9 durable ?\",\"Quelles sont vos priorit\\u00e9s pour surmonter ces obstacles ?\",\"Avez-vous mis en \\u0153uvre des solutions innovantes dans le domaine de la mobilit\\u00e9 durable ?\\r\\n(Oui\\/Non)\\r\\nSi oui, veuillez d\\u00e9tailler les solutions mises en place.\",\"Quels types d\'innovation technologique ou de collaboration souhaiteriez-vous d\\u00e9velopper \\u00e0 l\'avenir ?\",\"Souhaitez-vous \\u00eatre contact\\u00e9 pour participer \\u00e0 des projets collaboratifs en mobilit\\u00e9 durable ?\\r\\n(Oui\\/Non)\",\"Si oui, veuillez indiquer vos coordonn\\u00e9es :\",\"Nom\",\"Pr\\u00e9nom\",\"Adresse\",\"Email\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 11:55:35', NULL),
(19, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome953D.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":{\"12\":\"Nom\"},\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 11:57:59', NULL),
(20, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome5BF3.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":{\"12\":\"Nom\"},\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 12:10:53', NULL),
(21, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\omeF47B.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column\":{\"12\":\"Nom\"},\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 18:41:41', NULL),
(22, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome95AC.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 18:50:56', NULL),
(23, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\omeF687.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"0\":{\"fup8:Horodateur\":185},\"1\":{\"fup8:NomOrganisation\":188},\"12\":{\"fup8:Nom\":196},\"13\":{\"fup8:Prenom\":197},\"14\":{\"fup8:Adresse\":199},\"15\":{\"fup8:Email\":198}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-28T08:23:04+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-28T08:23:04+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-28T08:23:04+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-28 08:23:04', '2024-10-28 08:23:04'),
(24, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\omeC775.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"0\":{\"fup8:Horodateur\":185},\"1\":{\"fup8:NomOrganisation\":188},\"12\":{\"fup8:Nom\":196},\"13\":{\"fup8:Prenom\":197},\"14\":{\"fup8:Adresse\":199},\"15\":{\"fup8:Email\":198}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-28T08:23:42+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-28T08:23:42+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-28T08:23:42+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-s\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-s\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-s\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-s\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-28 08:23:42', '2024-10-28 08:23:42');
INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(25, 1, NULL, 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome8ADA.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"0\":{\"fup8:Horodateur\":185},\"1\":{\"fup8:NomOrganisation\":188},\"12\":{\"fup8:Nom\":196},\"13\":{\"fup8:Prenom\":197},\"14\":{\"fup8:Adresse\":199},\"15\":{\"fup8:Email\":198}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-28 08:30:02', '2024-10-28 08:30:03');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.1');

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('OVw1DczT6gFxZGNzdnSsvNxOvoY7F1zO', 2, '2024-11-25 09:02:14', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(217, 1, 7, 'nomTrajet', 'Nom du trajet', NULL),
(218, 1, 7, 'pointDepart', 'Point de départ', NULL),
(219, 1, 7, 'pointArrivee', 'Point d\'arrivée', NULL),
(220, 1, 7, 'possedeTrajet', 'Possède trajet', 'Relation entre un utilisateur et ses trajets'),
(221, 1, 7, 'contientVoiture', 'Contient option voiture', NULL),
(222, 1, 7, 'contientTransportEnCommun', 'Contient option transport en commun', NULL),
(223, 1, 7, 'contientVelo', 'Contient option vélo', NULL),
(224, 1, 7, 'contientMarche', 'Contient option marche', NULL),
(225, 1, 7, 'duree', 'Durée', NULL),
(226, 1, 7, 'distance', 'Distance', NULL),
(227, 1, 7, 'emissionsCO2', 'Émissions CO2', NULL),
(228, 1, 7, 'typeCarburant', 'Type de carburant', NULL),
(229, 1, 7, 'prenom', 'Prénom', NULL),
(230, 1, 7, 'nom', 'Nom', NULL),
(231, 1, 7, 'email', 'Email', NULL),
(232, NULL, 7, 'utiliseModeTransport', 'Utilise mode de transport', 'Relation entre un trajet et un mode de transport spécifique');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(3, 1, NULL, NULL, NULL, NULL, 1, '2024-10-27 10:29:03', '2024-10-27 10:29:03', 'Omeka\\Entity\\Item'),
(4, 1, NULL, NULL, NULL, NULL, 1, '2024-10-27 10:31:00', '2024-10-27 10:31:00', 'Omeka\\Entity\\Item'),
(5, 1, NULL, NULL, NULL, NULL, 1, '2024-10-27 10:32:45', '2024-10-27 10:32:45', 'Omeka\\Entity\\Item'),
(6, 1, NULL, NULL, NULL, NULL, 1, '2024-10-27 10:34:07', '2024-10-27 10:34:07', 'Omeka\\Entity\\Item'),
(7, 1, NULL, NULL, NULL, NULL, 1, '2024-10-27 10:37:51', '2024-10-27 10:37:51', 'Omeka\\Entity\\Item'),
(8, 1, NULL, NULL, NULL, NULL, 1, '2024-10-27 10:39:52', '2024-10-27 10:39:52', 'Omeka\\Entity\\Item'),
(9, 1, NULL, NULL, NULL, NULL, 1, '2024-10-27 10:41:19', '2024-10-27 10:41:19', 'Omeka\\Entity\\Item'),
(10, 1, NULL, NULL, NULL, NULL, 1, '2024-10-28 08:30:02', '2024-10-28 08:30:02', 'Omeka\\Entity\\Item'),
(11, 1, NULL, NULL, NULL, NULL, 1, '2024-10-28 08:30:02', '2024-10-28 08:30:02', 'Omeka\\Entity\\Item'),
(12, 1, NULL, NULL, NULL, NULL, 1, '2024-10-28 08:30:02', '2024-10-28 08:30:02', 'Omeka\\Entity\\Item'),
(13, 1, NULL, NULL, NULL, NULL, 1, '2024-10-28 08:30:02', '2024-10-28 08:30:02', 'Omeka\\Entity\\Item'),
(14, 1, NULL, NULL, NULL, NULL, 1, '2024-10-28 08:30:02', '2024-10-28 08:30:02', 'Omeka\\Entity\\Item'),
(22, 1, 1, 2, NULL, NULL, 1, '2024-11-11 14:37:26', '2024-11-11 14:37:26', 'Omeka\\Entity\\Item'),
(23, 1, 116, 14, NULL, NULL, 1, '2024-11-11 15:07:30', '2024-11-11 15:07:30', 'Omeka\\Entity\\Item'),
(24, 1, 1, 2, NULL, NULL, 1, '2024-11-11 15:13:02', '2024-11-11 15:13:02', 'Omeka\\Entity\\Item'),
(29, 1, 116, 14, NULL, NULL, 1, '2024-11-24 15:59:58', '2024-11-24 15:59:58', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(114, 1, 7, 'Trajet', 'Trajet', 'Classe représentant un trajet avec différentes options de transport'),
(115, 1, 7, 'ModeTransport', 'Mode de Transport', 'Classe pour les différents modes de transport'),
(116, 1, 7, 'Utilisateur', 'Utilisateur', 'Classe représentant les informations de l\'utilisateur'),
(117, 1, 7, 'Voiture', 'Voiture', NULL),
(118, 1, 7, 'TransportEnCommun', 'Transport en Commun', NULL),
(119, 1, 7, 'Velo', 'Vélo', NULL),
(120, 1, 7, 'Marche', 'Marche', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, 94, NULL, NULL, 'Etudiant'),
(8, 1, 115, NULL, NULL, 'Mobilité Durable - Mode de Transport'),
(9, 1, 119, NULL, NULL, 'Mobilité Durable - Velo'),
(10, 1, 118, NULL, NULL, 'Mobilité Durable - Transport en Commun'),
(11, 1, 120, NULL, NULL, 'Mobilité Durable - Marche'),
(12, 1, 117, NULL, NULL, 'Mobilité Durable - Voiture'),
(13, 1, 114, NULL, NULL, 'Mobilité Durable - Trajet'),
(14, 1, 116, NULL, NULL, 'Mobilité Durable - Utilisateur');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(21, 2, 144, NULL, NULL, 1, NULL, 0, 0, NULL),
(22, 2, 139, NULL, NULL, 2, NULL, 0, 0, NULL),
(23, 2, 1, NULL, NULL, 3, NULL, 0, 0, NULL),
(24, 2, 4, NULL, NULL, 4, NULL, 0, 0, NULL),
(25, 2, 123, NULL, NULL, 5, NULL, 0, 0, NULL),
(65, 8, 226, NULL, NULL, 1, NULL, 0, 0, NULL),
(66, 8, 225, NULL, NULL, 2, NULL, 0, 0, NULL),
(67, 8, 227, NULL, NULL, 3, NULL, 0, 0, NULL),
(80, 12, 228, NULL, NULL, 1, NULL, 0, 0, NULL),
(81, 13, 217, NULL, NULL, 1, NULL, 0, 0, NULL),
(82, 13, 218, NULL, NULL, 2, NULL, 0, 0, NULL),
(83, 13, 219, NULL, NULL, 3, NULL, 0, 0, NULL),
(84, 13, 221, NULL, NULL, 4, NULL, 0, 0, NULL),
(85, 13, 222, NULL, NULL, 5, NULL, 0, 0, NULL),
(86, 13, 223, NULL, NULL, 6, NULL, 0, 0, NULL),
(87, 13, 224, NULL, NULL, 7, NULL, 0, 0, NULL),
(88, 14, 229, NULL, NULL, 1, NULL, 0, 0, NULL),
(89, 14, 230, NULL, NULL, 2, NULL, 0, 0, NULL),
(90, 14, 231, NULL, NULL, 3, NULL, 0, 0, NULL),
(91, 14, 220, NULL, NULL, 4, NULL, 0, 0, NULL),
(92, 9, 232, NULL, NULL, 1, NULL, 0, 0, NULL),
(93, 12, 232, NULL, NULL, 2, NULL, 0, 0, NULL),
(94, 11, 232, NULL, NULL, 1, NULL, 0, 0, NULL),
(95, 10, 232, NULL, NULL, 1, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('2ah2b1rc3ogibhcbsoh2p7sqed', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323436333134332e3134343031383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226a3462316539336f3967653468676561686530716f756b323270223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323530353539363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323530363333373b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226664636233643932376534303333616634643163323961396261366364626666223b733a33323a223334656565373838393666633965663163613665386636383732623964336433223b7d733a343a2268617368223b733a36353a2233346565653738383936666339656631636136653866363837326239643364332d6664636233643932376534303333616634643163323961396261366364626666223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a226566626436343732376135656638323236383839336238353536653431353366223b733a33323a223561393864663532363863366539623637633266613732313937616330633638223b733a33323a223936353962333134663266396132336564303035643333333132653139376166223b733a33323a223166613263333566363630326665363438353766646335376463623038663536223b733a33323a223733316437616337376239383734356232303335303638313236656665326561223b733a33323a223339323835353466313861303037393533323362353234626263386235636134223b733a33323a226132383938363863316564646634386539376131613633613937653766373264223b733a33323a226533343762393265663137396235313034393331386233353530356232383364223b733a33323a223334366162323832643838326431376630613635373231306135316364643334223b733a33323a223262616231323963323736386530326531643237666331363265353861333735223b733a33323a223332626639306337336265663331326337316162393231643265623134303939223b733a33323a223063636238643238663931616533663961373938653539373535616637623266223b733a33323a226434633166626662303639313537303561393533323961393237313232313534223b733a33323a223764343332636634333333383135383439656561656631666564326232306163223b733a33323a223032306233626232343135626165313335323631663664633537393239656365223b733a33323a223363633163626632356232313438313131343439336331353636326564353932223b733a33323a223662656139366330396530653434363537373937643831653436383331336433223b733a33323a226261356561373035373731313363376637633364383834333430396335613134223b733a33323a226536323633623166666261343065363639656232636663663633626163323733223b733a33323a223662373461643665343636366235646236656537666639396639386636333665223b733a33323a223436366239636333623365303331303239613530646635616566656262326537223b733a33323a223330366465346362363930303762303530313739333639393738616135633131223b733a33323a223534623062373130353364333265303131396464626334396430643962333134223b733a33323a226534363935643736643463633765666431373534666336363437616332623735223b733a33323a226463373363333431653739636561333337383134396466633162343331366666223b733a33323a223565373063393134383733633535616365326430356430643037386263383066223b733a33323a226634303262393161626533623465343163383766363831343961363466383336223b733a33323a223964656664373133623039383663346630373839376435613366336562376631223b7d733a343a2268617368223b733a36353a2239646566643731336230393836633466303738393764356133663365623766312d6634303262393161626533623465343163383766363831343961363466383336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732463143),
('2pkmddegs2kjan9qhs9k0626ji', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323434373934362e3535353333373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d74653675637337663268636831656974683832766e73317136223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323438373531383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323438373630383b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223336383937363466613633646135386338336635396431626632396663626436223b733a33323a223163353832666566323766343636346538623465326533666536363830343139223b733a33323a226332343432613462363235646538626337353539343963346666376138663535223b733a33323a223231303930363765653866343863616261656561316635636333653361643936223b7d733a343a2268617368223b733a36353a2232313039303637656538663438636162616565613166356363336533616439362d6332343432613462363235646538626337353539343963346666376138663535223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223539373837646635646163336564383464653662316437333064613833366365223b733a33323a223965373763363234396266323761353861376465303430346338633832323838223b733a33323a223566626235313839653033383930303966376239363261333931663336313865223b733a33323a226465303061666566346163383265626264626661623235333165363834636234223b733a33323a223337653131333064316632663564626137373366613961623637363337346565223b733a33323a226230313338613465663535336365333834636264376432366631366166316163223b733a33323a223437643537346366626465323530373165643339313666313135376538343232223b733a33323a226332386663323266373934333163643432653463306331346466653564323635223b7d733a343a2268617368223b733a36353a2263323866633232663739343331636434326534633063313464666535643236352d3437643537346366626465323530373165643339313666313135376538343232223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732447946),
('2sqf4mh9gkrjt49cgo0miipsuo', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303131383136372e3133373536383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232737166346d6839676b726a74343963676f306d69697073756f223b7d7d, 1730118167),
('37guabmsfcngs6rhq5a940s4bs', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323532353438322e3239373832313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226137716a666a6e637339726176746c6c6f6961306f3732346430223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536373834353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733323536383635303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536383638323b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226635653933333761363336663237653562666435366566336363363664323034223b733a33323a223064643934393234306439326435333333663432313532313365353139333031223b7d733a343a2268617368223b733a36353a2230646439343932343064393264353333336634323135323133653531393330312d6635653933333761363336663237653562666435366566336363363664323034223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a226439623432623138633936653030373332623632396335646364643837376162223b733a33323a223864303637666534643939376234303165393666623732643563336333633935223b733a33323a223265343532326130613661363565393139653239396637393335663331336336223b733a33323a226436386264306336366334363437656165373134633866633234303665376564223b733a33323a226365636430326462376237396336363136616566663639613565313030303362223b733a33323a226431613161393330623235336465646262623032343865323030363430356139223b733a33323a223934353931633565626532333838643538666631383039623736366466356634223b733a33323a226536613437646437343364666431303234653830363362663733386330663137223b733a33323a223039313465343833633064393236346665393431633332346263656331616339223b733a33323a223931323339646238313863323630666539323265373561653337356434666364223b733a33323a226139393231343038653830643832303831373439316465366538323365613562223b733a33323a223337613439323336643832653838306331303263646562626462656165616265223b733a33323a223539313836333165323837323366643964333165393133326333316164366263223b733a33323a223230613037346561386435373161363566653434653432666538623762376463223b733a33323a226132353564373432643534656364356139653233636438666233383339656438223b733a33323a223566323438353630663430653237633562353831313765323139623463326632223b7d733a343a2268617368223b733a36353a2235663234383536306634306532376335623538313137653231396234633266322d6132353564373432643534656364356139653233636438666233383339656438223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33373a7b733a33323a223838333539306362663532653066313930613930646632313134346136623830223b733a33323a223731303166333162343634656637666535653731326538613634663931393032223b733a33323a226431636233383438643737383262346466373433346438333765643432653630223b733a33323a226566653037373162383934353939623231623932663233633764313936356430223b733a33323a223562616134633565633463323661363465616466333063333665303930376232223b733a33323a223831383737333663336635623361656239636162333034616537326537636262223b733a33323a226430346566353261633739313334396661316432613064333235396430663166223b733a33323a223462306661646632363363313564333664346565616663376364656339663964223b733a33323a223463376337303036326264396138623337313833663332363331613163636366223b733a33323a223161613838633665306266616432323139666166656362303234633165663336223b733a33323a226231616362623230613864346638333236353336353333653537623734326634223b733a33323a223738646339626331336365373333356530306565383034616164383835363231223b733a33323a223066303438633766363834386535356531333466343830373634366362356135223b733a33323a223431633139373063343264316333363338393365663862383330613063353136223b733a33323a223633306338666463333931633361633637376232636364663962303464613731223b733a33323a226333323331313531396562313461656134653262363361666265383436333461223b733a33323a223162333035396565646630316363663864373734643338653438336261383366223b733a33323a226133346462316461353133386261393337616263666366353835613537313463223b733a33323a226364353562316338313732376532666138336363656262323238333633626163223b733a33323a223065326232353165363164363431343863306631356433333830633739363734223b733a33323a226536373835633765666564666365393465396566333431313366613633366139223b733a33323a226238616330653539636565666437303135633262653335363663626465396530223b733a33323a226437616561353737633761323666396336663261663861633262323232626136223b733a33323a223765313637323766653731353136353437663732313132396330343932623736223b733a33323a223235613731373735323864313364383137303731383863613066363861656265223b733a33323a226337633936313261633761373933633138356131316665623861613232306130223b733a33323a226632343537363634313036313935383734373164313631396433623263616163223b733a33323a226435366539363530633063313330386463353264653665333833636464646161223b733a33323a223861343863373236386638623434326132303664313736343766343233313162223b733a33323a226465333865306661613832336562636666663134336331393039656533336538223b733a33323a223430343735373635366234613732346465326230643361303838326464363336223b733a33323a226631353161613736353830386535313339623031643631303939613630636635223b733a33323a226266616138653536623663643339323937396631346462346534306332363433223b733a33323a223232663764383334333931383031366464373036363562303038333365383830223b733a33323a226563356538643764386335653630373664383039386232666630663865306235223b733a33323a226662393435616334333033663964346135666163613334613737616432356236223b733a33323a226137373530316564626566323834356539626132653463366135356364613061223b733a33323a226333333764613933313931303262343364623064363065373038363235623363223b733a33323a226166333936613831366661383365616462316537336231383961363936386135223b733a33323a223261633834316136663864303163306235666137393630316635633366326332223b733a33323a223032306161306639613238653463613863623230633639386537663261653439223b733a33323a223164626364633061366337613566393737616661363663616631326461666362223b733a33323a223532353431346638356438636166656266646538633230626239356139623062223b733a33323a223030393131613337373365396532633363373333666639636636356562323030223b733a33323a226434653336366662613030373965613762643930366632316235363562646638223b733a33323a223735623365666432393539373036363332373434343339623465663032383037223b733a33323a223363336231303932396337646231656461396366316235326338333239393439223b733a33323a226165336330616266363561623434343035626364306364613964313139336165223b733a33323a223265383535396130396636616661336330666138633361623965633939323030223b733a33323a223435363265386636386562313964653362376336383431393238356264343236223b733a33323a226230623438366238643237333761376133303564383934306136656530336535223b733a33323a223766383462633637303037386361636562643266313631383764626532346565223b733a33323a226337633438306232353839356531656432326262316334383138333239336533223b733a33323a223736616537366230353866333939303338306661663330373035373366353536223b733a33323a223432326332306233333334643630396433633730353731333761633537393230223b733a33323a223662386462376337313464623763303433613661396531336236373037346134223b733a33323a223036316534343136616434306262623165346530363564326165333931366265223b733a33323a226338396664613939333233396538333333633366333330323266343331633366223b733a33323a223861393235373566653930383935633337383536336366643766306632356636223b733a33323a223361373532623031326136313166383034653430323962663730323938366239223b733a33323a226461393935386166373335313461656438613362366163343465643862383337223b733a33323a223030643437633565393837313334323661363238333736313961643665353933223b733a33323a226465323065373832373638663066363832343665386636333338373264373964223b733a33323a223466663232326434303234623636303230653330613435633066323466666362223b733a33323a226331393864363365626531316561666430656439363634373231666164313238223b733a33323a223432643265303262303239636333643939333831363933373634616563313365223b733a33323a226235393964396135316133393432653338343431393866373839313633376162223b733a33323a223733386339303135333339613934373533633063393163333165653261323934223b733a33323a226563646333653035386563313331373762373465653938393363333763336363223b733a33323a226566303535353333633261373964303364386332313330383232383331363035223b733a33323a223163643734326235396464373166306566396361326563616562666636366134223b733a33323a223665653038323565383732613231353934623264383635663566353466386133223b733a33323a223933376537353135623565356466303164303766343535313237386663303739223b733a33323a226565313963383465343866633931653564333731363465643538316633653736223b7d733a343a2268617368223b733a36353a2265653139633834653438666339316535643337313634656435383166336537362d3933376537353135623565356466303164303766343535313237386663303739223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732525482),
('39e40dahh2smggmpkpqmk5ut21', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303032353735392e3435333938363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223332376c68697234363333376b34303376677276386a36397267223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303036353533393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303036383830383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303036383739353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303036373935313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303036373838383b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223334643435623561323332643832303962366565353631303466373565626430223b733a33323a223465316231616530643132646666373833326332363237313430356265303739223b7d733a343a2268617368223b733a36353a2234653162316165306431326466663738333263323632373134303562653037392d3334643435623561323332643832303962366565353631303466373565626430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32373a7b733a33323a223231386331323030333163353063393732383131663030666637366135353136223b733a33323a223433326462653362343161353730656361363933616463323164343938326662223b733a33323a223066333065353739393730323236303237373461646434613966323436376565223b733a33323a226133613665643531323331363762383637363531316164666632333732663163223b733a33323a226264316665353732323965346439623838613730366366376461326331616631223b733a33323a226230313561663562333836393763663263336664333138613536356439633236223b733a33323a223663313834343030356639616635313563643564373532376463653939626336223b733a33323a226261383530656666666462653037363731393430303134653865643062393038223b733a33323a223633613531353165633438313166613463613336333333383835636565636433223b733a33323a226430333430346135613731363466633337623263376234353639323139303938223b733a33323a226533313638393236616535353962393963316234316534633333663335333137223b733a33323a223562623363633430653062616565333335666634386339653264626163316237223b733a33323a223239613532346633313834613666346162323665636635666136343461613137223b733a33323a223330326264366232613432323932663532653938646264313864363965666463223b733a33323a223838626665326363666663326136333732313838666461333138663233386235223b733a33323a223161666564623433363030323330373934323163373131343762623431656338223b733a33323a223233383761636238633461646237623836643865353131666438643539383139223b733a33323a226231376637653661663636626433336264366138663839303030613435636236223b733a33323a223464663765626464386162386339323038613933396634666533333332613631223b733a33323a223863643234376537346636623066636633316335323434643763333636623962223b733a33323a223531386530356164306166333062326537313032643732346363656339363066223b733a33323a223530646163363664666166333464336633656432393938383566633536623637223b733a33323a223065316565363566306166396435313566393139316563336264636464333536223b733a33323a226132396265666461636534326530343330393635383839663031336535643361223b733a33323a223038366337663334623664643666336131653739386566346264666661643932223b733a33323a223139356630363963306261383233663535346437653631396666623830336237223b733a33323a226431616338353264663633373963393330393661633832323334373139646466223b733a33323a223764643033366461643663626138393731663931366436633765643033343639223b733a33323a223735383337633962653265313335663134323438633062316432326462653034223b733a33323a223730626630316564643438336434386631636332373134303033393030333035223b733a33323a226338363565613966663931336634363766376133653962316662373537623864223b733a33323a226566303366663234373233356234656230626638383738393231643562386465223b733a33323a226436363639356263373361636230326238623361313239643061306364386433223b733a33323a223032333233336632343037376566316262313766316462343132336139623939223b733a33323a226262613039636530353064303739306235633462373864623066613232653838223b733a33323a223035383164653438636336336234386138626530613734386230393036363538223b733a33323a223564333531636262376261643032353035396664376234386335313336633563223b733a33323a226136666565343662306431346534376538636236303632376438356232343562223b733a33323a226266343338376635396465616632643861616565393239623838636165383730223b733a33323a223638616238323037393235393265653261326462373565326638353038653161223b733a33323a223531373831643638333630336538383066633236326135626433356132626339223b733a33323a223164663662396566363837633664363732623834666239383033616536653463223b733a33323a223737643835363833636537376466313838626239303264616166363964376539223b733a33323a223865376362653162663166393338613836373662326133346536306431363762223b733a33323a226666373233663637326463373239623732636566633230393730386435333965223b733a33323a226439373032336134376335363237363636313962633031343931613062346364223b733a33323a223735613663616632363364363635616633363239333265396634303830633534223b733a33323a223930643330363663326230303862363332383133376266396235366361303836223b733a33323a223433346131373535663438363039633535383333323261356234383732376562223b733a33323a226539643235613635383734313365326237383635353639633761393765636265223b733a33323a223866383932623138613765653666343131396661333263373936396233636163223b733a33323a223230363963633064386531376366313831303130313235396164396236316538223b733a33323a226237636366336133336239393138656533326233363863616438303434333132223b733a33323a223965316135623465326265373362656335393434653964333039626565306335223b7d733a343a2268617368223b733a36353a2239653161356234653262653733626563353934346539643330396265653063352d6237636366336133336239393138656533326233363863616438303434333132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35333a7b733a33323a226466646162383034373465343833393762346435626535383136663330313539223b733a33323a226130643233373731313666393530393961623733393930626261666136313363223b733a33323a223231383638393433376533616462373764326662356331313331636662393531223b733a33323a223566323839653863346361313431393038613139386564636432353832326132223b733a33323a226432343063363337383762623431383937396231623737333831393131666462223b733a33323a226234373630646230343561333636393562383762616363366232396165393161223b733a33323a223530336563306237653733396635343365633839363635366639333566663237223b733a33323a223263356663326236363739666433666230316366626338616636366236616463223b733a33323a226531323939366539316134333832323564666338313936363730386562376362223b733a33323a226135383664393239336364653636626538333735336435323736663639366239223b733a33323a223330613562396333656361613664386138626332386366396466313366623535223b733a33323a223137613134663338326662366639393730306138396638376462653866643234223b733a33323a223333383465343036316661626265303432376333383765326631653637393539223b733a33323a223665623363386531633330326631326433366262383334353538306565396634223b733a33323a223834386165386461306665313664616131336336386234326135636662313537223b733a33323a226135303763366239383032373933373330376632326363656238363266626135223b733a33323a223532623834306633643937353534656363303430656639373333626435323434223b733a33323a226361303331326536656639623633633739646638343462343863373538656536223b733a33323a223333316264343930623931663666613630633939383533626430656632643262223b733a33323a223634336338346261373231326366373362393462373731643866663863653539223b733a33323a223836316139393363666361363763396464663935643561633461353561356637223b733a33323a223930366461366231336334326430333066393435333938333566613461396562223b733a33323a223939373361383437626361373231653831306138613763373436646661303539223b733a33323a223139313962616364376530613564646464613039666465376462326238346663223b733a33323a223539343235303532663434613038313731633035636166396564326439633563223b733a33323a226334353931383265313264363034333833336138383865353734386638383939223b733a33323a223762303335306464643437623466333165306134373661346361343832613432223b733a33323a226565306131363832663065653766366230626138366136313264333734316130223b733a33323a223136353039396561306131663232316332323666653661393034653231613264223b733a33323a226636613661636335303039616166646663303236303364666638356262666139223b733a33323a223062653132323037336233366634343661336239616364363963643264306566223b733a33323a223836656233353735303335356165656265303039386634666339346563313236223b733a33323a223239636634646233643862343864633630646536636137343963393138333231223b733a33323a223332626431613766396336643365376565386638653338623234353431353563223b733a33323a223239326666313630613933633965633238373137356138633036656632313438223b733a33323a226438333065386234373863396338666465353030616531336539313834646430223b733a33323a223037656565633963383131373861353964623135316263366333363532613339223b733a33323a226339306131393038613530313766313963363038383161626533393735333364223b733a33323a226465643064323534316534663766656531393864336363316137633333396464223b733a33323a226665393363346330313466306537353535313631383835346465643534663936223b733a33323a223734303737383539363539376234663463363035663761323534626634353936223b733a33323a223537636466663933346132363561383332333231656333636462313061633262223b733a33323a226432326531303365633365636434306435616638643264353465353464626135223b733a33323a223438616431303930373563323038386164633130633066363334373138333563223b733a33323a223632323463323233363330656534616332663637333233383862393332323866223b733a33323a226439383265646564313266323762323835383334613331383763643032616263223b733a33323a226362633930333932303032636464393163303635356337353630303635303866223b733a33323a226131386466613165343739303032613234343839373234343439613431306462223b733a33323a223461303438666232383662306464616535616631363233333738353264333639223b733a33323a223361613331626431633634313963373062346361396130643239653537303330223b733a33323a223665303233376231623839383065386465623735653163393135363530396333223b733a33323a223235306431623039656636653934363232356638303336663566666138393738223b733a33323a226238306263396536336234343330396439653162633662386235623233383966223b733a33323a223539363732653231623335316133333333386535323561613766653664303930223b733a33323a223931386130613162353463356264303438633266653134623833313339393464223b733a33323a223637346261623033333364353666356133356532313839376530386164363364223b733a33323a223037333962643839383834653161336239643832386638353930333038313765223b733a33323a223262623836633961646165626161626464373334353438393163306232653039223b733a33323a223165366339393161656365663836666331663030663861646162386531376434223b733a33323a223531306538336638666165343737393638323733613434353031303362383837223b733a33323a226236386436623830366531323162373730616231386138663138623166306265223b733a33323a223363323865363232306465626339343562363633316362656365303630616635223b733a33323a223162326266646234393332356136336465396238373365386363376331386333223b733a33323a223739366637373137656364643161616232626233353866656265363261353631223b733a33323a223364646633396130376338633433616635623737383965333832633363623362223b733a33323a226561633033386161623964376561653139616333393932643262356231383236223b733a33323a226137666664616264303231613265353739623238343961376162373338353034223b733a33323a223161383766636633373764623730313533373133656433356434623665656464223b733a33323a223937366331663730636639343739663462646536326565383431613866303663223b733a33323a223264666531356532366566306237663866313032366132333538643832326561223b733a33323a223231333334636562306135663138383231626265393437666264383164656637223b733a33323a223737333031306465646661313232383432343766646263333865336466396263223b733a33323a223639636234373431613662363265326439393234623764613432333737336238223b733a33323a223763653033306133336563623532336237383163326239623137633333306266223b733a33323a223833663465386565626535353636636339653234356561666461323834396365223b733a33323a226138623161343334386161336361643930313162623032373436336162656166223b733a33323a223431616262616132373733343134373936663830633438663531613738623661223b733a33323a226237653637656439663030326331323361626330616561393465643935363236223b733a33323a223630326133303164356635326537396531366134303434306238353836393933223b733a33323a223232663063353533336561636235663337623765393436643338343561396562223b733a33323a223965396564363938346234316666326164393761373538653834623039376636223b733a33323a226661346333343134346630396462663537643764386530373135393032353864223b733a33323a223036326165323234396635633337646230633166353439323331643637316333223b733a33323a226364346131356236633938633164656539653563636562393061623661323665223b733a33323a223631326539383539353632396361653362336330333432613764643430383235223b733a33323a223131303665353232346166326333363936363539643335393763666638343665223b733a33323a226563623439343934636332346138313965323834343037653731613261323765223b733a33323a223464323839353734366633323863616461383631363666306262366630636661223b733a33323a223738653561393030333562626431393963663636343530613033663037356165223b733a33323a226163613938356361616331326233636563343563393732386265323839343461223b733a33323a223265323837336237636334636462343737353462343365396664666335623364223b733a33323a223335643437353032386566323363356365663061366638643634386636326637223b733a33323a223733653265376266613835666339393465383263373334383137643563643762223b733a33323a223265666233613431386465376337396430666236333934396666303734326534223b733a33323a223632336166316538383035613939363135356238343637666437666438336632223b733a33323a223539313465366162346433323034663739326136363062376237383063653131223b733a33323a223531343862386564376364353438376432373634343663313435363836643162223b733a33323a226664386136376630306235393334336562393961336336373830623763616334223b733a33323a223830363538643465333639653364613935363437396661636138623164323735223b733a33323a223562646662623939316235336563363233333164643661396662656264653930223b733a33323a223062613561393864336436626134646635643938373539613465363335326164223b733a33323a223535353238323232326133633331306362653664306434396333396535663731223b733a33323a223230373033663463633163643030613261316137623734396337663132373165223b733a33323a223065363338623238303035386232393465333235653665323735386566663430223b733a33323a226564343238633235373835333131643635633031373938323335363038613533223b733a33323a223365373166313030613436646435353532303435613861343338386638396536223b7d733a343a2268617368223b733a36353a2233653731663130306134366464353535323034356138613433383866383965362d6564343238633235373835333131643635633031373938323335363038613533223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223138353035353533353131373161303732383030373437333335316633376563223b733a33323a226438373831316662333062376533626230373331386633623330383862303031223b733a33323a223865323738346338343833386630643436353963396533393235303034343930223b733a33323a223433346166663837623438356436366333666638623563666464353238373430223b733a33323a226461333261343639613966336237373735626361623563656566356430623164223b733a33323a223236333666333864303737313034316431313131626537616432373334653265223b733a33323a223134373132343365306566646137613534306238346464376230303933646430223b733a33323a223639666664383536656666353762346239396531326363366664363166313938223b733a33323a223266363238343237626434633130633237326664633238613566633864323034223b733a33323a226361343434373163363961383265646138303730333030643765636237356264223b733a33323a223131663361323131653633626634313535613535366366346138366465396663223b733a33323a223831346236643239363631333236633762313630643163366162663363363034223b733a33323a223039626665343164333139643262343462643233383737633235346439323938223b733a33323a226332393232366534663732343065303932316563353035343266386236646330223b733a33323a226265333762383166616239326235303436383337363237386634636466616564223b733a33323a223139333236363265346263346633376465363761383466343939653338393362223b733a33323a226130653131373434313065343265373138316137353234356531396338333533223b733a33323a223738343866383466393662646134316132393361303762646635313562323665223b733a33323a226531626535343139353631316538356364646562363837663533323763383062223b733a33323a223166323363653263656631646464643339626630343464643961646461356232223b7d733a343a2268617368223b733a36353a2231663233636532636566316464646433396266303434646439616464613562322d6531626535343139353631316538356364646562363837663533323763383062223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223666343661646133393265633435663330396631343334663564396561313530223b733a33323a226466656164653737633831633366626662323731656635343530616366386130223b733a33323a223132656133623832326265646430393733633864663130333133646136626662223b733a33323a226562366439316430396433636335646561346366636530356439303536336363223b733a33323a223566666463386463626635353462613461643731323333666466383664326538223b733a33323a223634373361333731336161333732316266646134333764643062643536343937223b733a33323a226431393838393734383165343963393239646666353237636665623164323663223b733a33323a226338313366613663326434366339363939393734626432306234376363323063223b733a33323a226361353333396232616435616335623762653631303230326362356330313134223b733a33323a223435633464663439343264353763386161323466616261346637393938313162223b733a33323a223730336565323363626165373836326637303033303234363832346261363634223b733a33323a226430646138303136343964663233616432396633656535353662356663396466223b733a33323a223831313665363366393736643330623835643365363566356135653866353132223b733a33323a226331623237303736396665343333623964323037343365333937636362343466223b733a33323a223566343738313366366561373231306137393263336336373631333032363733223b733a33323a223238356436363933393038386131396133653432666461366632663333613437223b7d733a343a2268617368223b733a36353a2232383564363639333930383861313961336534326664613666326633336134372d3566343738313366366561373231306137393263336336373631333032363733223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730025759),
('42cbfqsb60reu8rl9lqsh5nj20', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383933313836302e3433343533393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265616273346c74356e6371316d33643869656732726c746d3164223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383937343239303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383937353033303b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223061613632666461646165303231376362633931343537633939646438313861223b733a33323a223038376530613161656630313331623664633636366330393930383235346237223b7d733a343a2268617368223b733a36353a2230383765306131616566303133316236646336363663303939303832353462372d3061613632666461646165303231376362633931343537633939646438313861223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223331613632303133343463326336306432373766623533303064303662383437223b733a33323a226533363065396663326134343531353066373563643965623231346134633665223b733a33323a223738656664613037396463646635306437353233633433633137663130616639223b733a33323a223362383138653037626464656139343939343537376632663965326536393433223b733a33323a223364343863613537663037396564373430613637656135653935326362666636223b733a33323a223766343962646637643134333538326161303437333139643235353463336136223b733a33323a223730363636343536663863363332383431353266633035633966303566323535223b733a33323a226138633963363834373139393334663531393036343339353862303935373064223b7d733a343a2268617368223b733a36353a2261386339633638343731393933346635313930363433393538623039353730642d3730363636343536663863363332383431353266633035633966303566323535223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728931860);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('5fj4tr8t2ans588q2mfcbhlhem', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383930383636302e3831393431353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c69627664323262376e35716166627031637232376f6f316269223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383934363938313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383935313033323b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223439643463363231613132643763343635366236363033336466393637613165223b733a33323a226463393964636563613163373063336637613237623830646138643463633539223b7d733a343a2268617368223b733a36353a2264633939646365636131633730633366376132376238306461386434636335392d3439643463363231613132643763343635366236363033336466393637613165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223535663038616633333639343163616637653561313736663931313532376363223b733a33323a223635626433323033323131326533303431366632323737636432316130356238223b733a33323a223364643266363063653766383563393539616266366566643865666364613063223b733a33323a226262356232386531396261343633306331313730363337396335376239343862223b733a33323a226639653138343766306339643030653430663735616337646235353064616564223b733a33323a223266396162333261643438303833363730313737653937346132643239643536223b733a33323a226631323737633661353733333230313636653166643632626566353339363039223b733a33323a223764353230373566666632303232346439363334383262643832343838636263223b733a33323a226161396664303761383835313361626263316363646439356530656235366462223b733a33323a226530633738613039393462383636386337616537653336396639366139346131223b733a33323a226432376464666238653438373961326233373739306532666164623236643730223b733a33323a223030393039613233363237623032653437373037373934353432613430626161223b733a33323a223532646362373535663136386631646166653163353333633031396539326531223b733a33323a226539316236373865656138373330623666623963333236313136623231323262223b733a33323a223338323136393230666261303435346637306534353965343930366266343239223b733a33323a223333303563353336323663346336373730396131663035323066656264636138223b733a33323a226434376130613366616230363538373039663564303463303236383963326132223b733a33323a223035326132393964356166313764376665656534616564636363646166383532223b733a33323a223630346337383761383165656332376131663039623138663135646162323363223b733a33323a223930323030626132353135616339306533366132353036626336316462366536223b733a33323a223465383630623930616238316331376139373861353137333738323366616338223b733a33323a223232333564363166376135366565653338663737376161346137313830393462223b733a33323a223638633637313430383337333038653932366362633331383832613238383736223b733a33323a226236333537316134636366316434396430313634356133643764313339623666223b733a33323a226338376235656232393539306363303061373336393434643230323563313432223b733a33323a226530323866326664316166656634373761323732636336346638313934313130223b733a33323a223530623431633661373338333630646339356337366339383237376561646238223b733a33323a226364363061643533396431346664623932613636633262616437623833616433223b733a33323a226434376633613638653133636634653438636265373931376461636432373133223b733a33323a223735386139396536636161363936653961333965326339613361303637613737223b733a33323a226332376664323637363930343537393930353038326536663337346536386534223b733a33323a223861303934346337333039393432306665633562656233306362346131393562223b733a33323a223562613163396266323261383564393763386531303738613661373235623231223b733a33323a223137336163343236303935303363653962636431663665366162613837386562223b733a33323a223961623837656637613066633265393638363632326335393365333432643034223b733a33323a223235666132623566313135396334636630393739396462336534353238366135223b733a33323a226165646433353831663739383733336561646333653263333663633461323235223b733a33323a226566623237656565636164373833343733633931623631366234303234323935223b733a33323a223634343632653833396233636162386638653262356236346236306238343432223b733a33323a223537336361633761383138376264313835646639643233356534623836343136223b7d733a343a2268617368223b733a36353a2235373363616337613831383762643138356466396432333565346238363431362d3634343632653833396233636162386638653262356236346236306238343432223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728908660),
('618d9ptn087dg8n1g3iol8kvph', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303032323332322e3136373239313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22363138643970746e3038376467386e316733696f6c386b767068223b7d7d, 1730022330),
('6topaq9q1qh69djvjcapqej4b6', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383930323838332e3437393037393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226964636e316333386e73646b303630766c647162373761386a67223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383934353038343b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226535393864666539303063353061373338623436643662633163363861613939223b733a33323a223635333461623264626230663364643133356230366330646530323836666132223b7d733a343a2268617368223b733a36353a2236353334616232646262306633646431333562303663306465303238366661322d6535393864666539303063353061373338623436643662633163363861613939223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728902883),
('7gl886ui5kngl1svm496immd58', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732373730393639352e3137313739313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237676c3838367569356b6e676c3173766d343936696d6d643538223b7d7d, 1727709702),
('90id9sutbpeeqk0dsu3f2dfkup', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303130333833322e3635303535373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756763686d313061736e6833727534706663666f6f6569306964223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303134363932353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303134373032303b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223566326261336336326164343939366363363361343734643533646461343364223b733a33323a223734633039303533396665336433353133313062366336306662303534623231223b7d733a343a2268617368223b733a36353a2237346330393035333966653364333531333130623663363066623035346232312d3566326261336336326164343939366363363361343734643533646461343364223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223139363831623761313964336234666137306335646632396332303739323539223b733a33323a223636383632373962336661343834393130666434333837316232336139306432223b733a33323a226332626364306166623138653836323666326364653638343936653663663333223b733a33323a223539636530646131613461393166313963643936636631623434663836363762223b733a33323a223438306638303533646631313137373939653537656436613430386137353763223b733a33323a223033613864333039636532386330393632376632653539616432386132313131223b733a33323a226639663137333933666361346339363665356137346131326361623365646537223b733a33323a223531666138376532646665353238653865323338656234383634663836616537223b7d733a343a2268617368223b733a36353a2235316661383765326466653532386538653233386562343836346638366165372d6639663137333933666361346339363665356137346131326361623365646537223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730103832),
('bubd8hla7kaa0qis3sq801h28o', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383333313731362e323136353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22713373706130626770376a75766d6339647532746139726a756e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383337343533313b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223665626434323136333835323362623837383165333136636163386662376230223b733a33323a226233663133336132363239643661613031656236633634613161613437313365223b7d733a343a2268617368223b733a36353a2262336631333361323632396436616130316562366336346131616134373133652d3665626434323136333835323362623837383165333136636163386662376230223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728331716),
('cs4ntnb0aj6j40rqjgl24vnve9', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303130343530332e3231303630373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2273646963327076376336687276326239376e73617569396b3361223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303134373336373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303134373339383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303134373730353b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226566306162613538666365323837633733323766643536656138343863653962223b733a33323a223834313338633839343132316635336335323031363736346262613232313638223b7d733a343a2268617368223b733a36353a2238343133386338393431323166353363353230313637363462626132323136382d6566306162613538666365323837633733323766643536656138343863653962223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226537653730393032356565393738326436663263666633656630353731613063223b733a33323a223136373332376431383539613666376331306266633765353033333038316338223b733a33323a223166646562323930353065616335373735353762306134353464643762656230223b733a33323a223935663065626539346132333163613930323133373366623865313136316231223b7d733a343a2268617368223b733a36353a2239356630656265393461323331636139303231333733666238653131363162312d3166646562323930353065616335373735353762306134353464643762656230223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223132616466306336353165306636643130336534363035393762643330346563223b733a33323a226562613031333131343662663962316565373536643161336365663064303938223b733a33323a226162636434666431666434313465373736623637653364313237663961326133223b733a33323a223039346237643230323036343863363130303166313931373365363765313036223b7d733a343a2268617368223b733a36353a2230393462376432303230363438633631303031663139313733653637653130362d6162636434666431666434313465373736623637653364313237663961326133223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730104505),
('daorlh9p5i8fjhial81v4u0rrj', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303437343333392e33323830323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2270626a76696133726d6367766f6673753569686672706a616d67223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303531333536373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303531343732333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303531373532363b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303531373532363b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223734396135376434356363393134393733326235613038373263306662666336223b733a33323a226637666665383132653239666236663638346438653763636636666565323264223b7d733a343a2268617368223b733a36353a2266376666653831326532396662366636383464386537636366366665653232642d3734396135376434356363393134393733326235613038373263306662666336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a226465306331303664346334306538393533363039303335616332653665633039223b733a33323a223363343334386132636335626562636437326332626139323062616238366532223b733a33323a223062666264386166653835346631376436323364366262363738303735336563223b733a33323a226561346138353965356135316162643062663738633738393362316138636331223b733a33323a223635393633343664383537383036393236356462613934333233386661333233223b733a33323a223164623362633433653030623534633233303833613761663233616339616262223b733a33323a223936663466333039376334313132333363653765303033323131656231353238223b733a33323a226232623062626165346461646437306432363337643162656434373564333632223b733a33323a223830616239323433343530383839336666663131646130633730336632313932223b733a33323a223031643865336239303030356634383062313538383065333930366636376138223b7d733a343a2268617368223b733a36353a2230316438653362393030303566343830623135383830653339303666363761382d3830616239323433343530383839336666663131646130633730336632313932223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a34303a7b733a33323a223638613964643364356562363863623839303338383335643763326534323434223b733a33323a223665343433633838313839613035343038366439383935303033393238343364223b733a33323a226337363035306135366539643863333662383963343539353661633865623739223b733a33323a226334313935323534383535383166353032393839336138616164636165396631223b733a33323a226639303731343438383935633163336334643331346365323161653739356666223b733a33323a223361646537613231336138316536326362383938343366633764376266383131223b733a33323a223932376538363266656232373234643437353237613135333139323661623838223b733a33323a223361386136303438626636333630623135616237383139346131336563356266223b733a33323a223161323532353936366531353532373837323039396333353231333536373234223b733a33323a226533336666336264323936386537666635653362656438353830303463323939223b733a33323a226530653337383832356562373533633234313037373339303834666262633762223b733a33323a226634393032346634666163333835306135323662363230383265333361386166223b733a33323a223034386635613165353939353936633534653866353839616263313965383735223b733a33323a223761656365353564323633356362393132656565336438613266363131626630223b733a33323a226330343137333663323466323066316265353230636265633466333035366331223b733a33323a223636313565656636373134393835663564663764326663633864653830303139223b733a33323a223533346635373038343532643435653662343930363266346631353830306363223b733a33323a223839343465353036656532616662623136323532636433613936623261666261223b733a33323a226439623463626633353038386163363538616665636361653532376530653237223b733a33323a223663633339373265333563343362333931383665313366343863386236323765223b733a33323a223463306330303363653835653265653838666666346135333634613763643965223b733a33323a223066386136646161383337623262643633316535643738326136373634353664223b733a33323a223039333765373137653831643836316565333663663839323938666335333439223b733a33323a223833613332336664373238383863613663343530666430333639666533396666223b733a33323a223664633236383462653030646237393635643331383065643064353230393439223b733a33323a223961643965383131636364343030643036376631396432333366326465343366223b733a33323a226261336361653633386363393932336637663061386364646162646164386462223b733a33323a223565356437626261386361366332383733323261323234633031316130613631223b733a33323a226539363462623936303234353631346133653936396662383631373964616531223b733a33323a226537643130306563653639336265363662643032656165383233616331303162223b733a33323a223262396164356363383562666339656532346234373735666332626638323362223b733a33323a226438643738666539643939303036653666373734656263323762656137303764223b733a33323a226234323162326462613865313362306135643136633635376439393032663530223b733a33323a226537396230633861663830333264373561626565326532353533393334656236223b733a33323a223334666231326362383838366632653834336636313638633935396634616536223b733a33323a223965626137313931343733316230393464623465343734333632666138366231223b733a33323a223830336634323265363365663765666461666536653433653361363262326339223b733a33323a226636653535653939313939626236343034626230613739623962393436613434223b733a33323a226130336133353262353261363330363862666431316535323734623663636330223b733a33323a223466306636383132383732343363386138623161623962356430336639653737223b733a33323a223764366466613062643436373165653037623832303932333533633037326263223b733a33323a226563646134333630333966636465313462313466363132653663623130396163223b733a33323a223235363930633763663233613266343739396162653239383266663661323430223b733a33323a223736356666646632626164333365343037366531393136626439646561316662223b733a33323a223938346438616537626633653966373232666363366566343964316635646561223b733a33323a223164323130316430303364303330303265663134373935366533313363623434223b733a33323a223731653965346238363535333363393963616536643735326437343638343765223b733a33323a226133383330386265646333323363376235636239656431613861313731306564223b733a33323a223938336665653562386664333662623932396331636639623330646634333762223b733a33323a223761613834356363303134653934323535356264303530373037303666626537223b733a33323a226666353661313864393261333863633037346432343763633965666333633531223b733a33323a223161343735646432303465383230346162666235323435366139643030653035223b733a33323a223232643230363636653135326131663061343834653737623034643633646533223b733a33323a226563356265383262333830376135373539376465356335383835383531636164223b733a33323a223233343466633262633561616335393735653231656633623138663433386533223b733a33323a226330343234353635363563336466313234653237643866353066643430303335223b733a33323a223833623461663966623632623662313230363061613265336535303735393061223b733a33323a226135353132623134376330663335396665353839633333663463306362613764223b733a33323a226138313831383366373365613030343162366461656664623237643263633662223b733a33323a223761373139626335373138623963386561616661656634353837643637396539223b733a33323a223432366430326664383664353132656132343637643938653063623634313530223b733a33323a226632393233393963326436316237663435636331376635353333613365653032223b733a33323a223932666439393566343236376533613366383133613034663661616338366231223b733a33323a226331373337353164303461613833306230636566666431663736343230353961223b733a33323a223766336561353365323837663436373239343861663365326133363564373438223b733a33323a226336343230643533613637633439343736353436646465313038633862386265223b733a33323a223938366430373563623362333266313138636437663331656362666534336565223b733a33323a223539353131353365613436633163633162616438383764643531623138356534223b733a33323a226163623739663665303733333731646237646265353566646361643734333435223b733a33323a226166323435333162366531383831383734373133353330336438353931636636223b733a33323a226331323866386564663963666232373065356636383665656631303337643634223b733a33323a223235363232383339376462636433656561626437333437623834313738636563223b733a33323a223332383831333665643932353139336465653737336136623138343338333563223b733a33323a226365356165393538613765396132643265656332643730323564386466306165223b733a33323a226634363535303135323631353231616263363037663530343531626261393435223b733a33323a226231656466666565623931303036323964376433306136306364633634323861223b733a33323a223435613037613733363764356339633833376566643732346133653239616666223b733a33323a223661363462373961303338653961623934656566336232373665653938653734223b733a33323a223439383234323564353430356139303061373135373136376662636662303561223b733a33323a223865633336373734643939653639313161653734313061393365386462643835223b7d733a343a2268617368223b733a36353a2238656333363737346439396536393131616537343130613933653864626438352d3439383234323564353430356139303061373135373136376662636662303561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31393a7b733a33323a226361383466363466366366366439326166373238643533343866383237353861223b733a33323a223735343336366431666538323834396132656165396436636561363937396161223b733a33323a226231386133343238316561373030303232363261656565626133653565383930223b733a33323a223862356239626530366634353639663966393839633831366335306435373861223b733a33323a226632366565663766623931343530353265633566333737616136303230306332223b733a33323a223838643638333166336632333531373537323765336638636136356132646564223b733a33323a226135663736656433613864303164326138623464363939336664616431623039223b733a33323a223639643338393337396463336264376663643035653264313234316664616633223b733a33323a226637656662616431656563383066343436303537653566373538313062366466223b733a33323a226634303530656566613332643566626261633963386262323436633938333961223b733a33323a226234323837396163306465326430336134646338323236613564656331643239223b733a33323a223738366331643261656534636461653861636236613264636533616338333666223b733a33323a226534363235653564643063643338363365616434346465613230326638663465223b733a33323a226231666665343565386438633433623132393537626562336265613338313762223b733a33323a223263343962313632623734623236323639666437306464613138393364383233223b733a33323a226562386132343362313836353331666536636335393765393762393564346631223b733a33323a226633306234386439363861663435386261646630386532393666346632326237223b733a33323a226631383632373638646435396131343132633430323230663431373238393236223b733a33323a226166653337373037613533383537326439356331326330393465383836343435223b733a33323a223033343663613564373739343630346339666537326339313566613139633639223b733a33323a226531363363613337373430656562386238666334643637633965353935356663223b733a33323a226234343264343139316539636563326634306630653730623432323637376463223b733a33323a223533326539306136376262363865363537313136363130313531396534383761223b733a33323a223436663637303531616636636231346562643365656361303537666266366561223b733a33323a226639373738373432383039363336303232313538316233326265633532633830223b733a33323a226466626635363566613162626136393362333436356566613336663435633361223b733a33323a223463313964313733376263646462313535373430343933353237653066333237223b733a33323a226363346165383231636134323830636265653566323831613633636434666436223b733a33323a226539316461336135616630316230393866393333316336326362373436396662223b733a33323a223630316634333562343735386265663866323835373863613862633330373864223b733a33323a226333343865626439356239313764346262626630643866323764373831363565223b733a33323a226362373562353936373831393136623330336639343862336531343666646634223b733a33323a223838396133376266336431346537336664346462343032623230623531393130223b733a33323a223738323834613931663462333365636265623539393431616636383064326235223b733a33323a223762386462393063366466373561663135343734343731646461383736363262223b733a33323a223335393532393164373833636537623433643835343132633735386634393933223b733a33323a223931663234346134313832306436306131663635633361333536353331373630223b733a33323a223734646635383565643734663736376635393835376665303931303332623330223b7d733a343a2268617368223b733a36353a2237346466353835656437346637363766353938353766653039313033326233302d3931663234346134313832306436306131663635633361333536353331373630223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730474339);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('de32dk3k3k3rmsulee2oaldlag', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733313334363630322e3633303032383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226863367331333968737070686f6d65623275766e6b6c30723033223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733313337353235323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733313338393739343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733313338393739343b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223638303336373336663031366136643566373463306334333062376235626263223b733a33323a223565393730383962333736363364643636303932393836633436633438666231223b7d733a343a2268617368223b733a36353a2235653937303839623337363633646436363039323938366334366334386662312d3638303336373336663031366136643566373463306334333062376235626263223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a226331666163643036636638336335313663626462643132653534653664646265223b733a33323a223334323561373634303861663739623639326539333335323532366165386239223b733a33323a226138623137383766393635383431643631363236633538643336666662386234223b733a33323a226635663233396236383338353732303432313133326238356431373332386662223b733a33323a223532666161666631333262663466643030313230313165326637366631303037223b733a33323a226438636664326332333830646238626261656439396637636439633033313035223b733a33323a223364363435333165353063623731353262313232653364623838306438386531223b733a33323a226661656332366536613434343934313632376336346232393433666666366639223b733a33323a223337306264376239343535663734626462666461376133613331653661636462223b733a33323a223663656334623637343538303366666662373865663361393232346564366362223b733a33323a226335626234386462616130343032366533646337356139636366636266643135223b733a33323a223737666162306230653832313236383535333330316331653461306432653836223b733a33323a223564323164626666376538333365613663343734636162343163353562663236223b733a33323a223165343634383138633535656436316635313832313035623236373464313432223b7d733a343a2268617368223b733a36353a2231653436343831386335356564363166353138323130356232363734643134322d3564323164626666376538333365613663343734636162343163353562663236223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35373a7b733a33323a226362326666623965393736626431373135316430383033306237323636373032223b733a33323a223433633731386636656233376232393238363837373232323733613334613433223b733a33323a223638303862633261653262616132363133313333636166306333343031373664223b733a33323a226632343238326339306363663635333939303631313630323566373631343138223b733a33323a226636356231643263623437366534363438333761313162613663373033653263223b733a33323a226332343539356266363662346534333338313139336563653766663964306431223b733a33323a226137386563643362666435636133663838373262646631636338666331636530223b733a33323a223130656464396239373262333339396661373232333931333739653437353964223b733a33323a226437626538323531326264303134663735333462636430633131376639633330223b733a33323a223262376261343738336666623463383163386462313164613664343938383638223b733a33323a223937346537356265346136666464616236636236383935633432323263623630223b733a33323a223162393432643834393937313830656264353762396135643263396233653631223b733a33323a226235333565663832653866393764313434336535393532366665356235616633223b733a33323a223637343530613031346664613134666539383763626632363835363632376635223b733a33323a223863633139333630646261616431626233383231353332343033663233663532223b733a33323a223266333762646463636534346434353166316462633639623537366330373530223b733a33323a226231333365366436383432656532656136323331636439366336316634306365223b733a33323a223765616136363561316234666334396461636538303864343065313936666537223b733a33323a223733336336386137626265636662623963616339343963336336303138633538223b733a33323a226562643536623637313937313838383832353939336363666565643934373662223b733a33323a223866656664636166633935616633353734643731623365323937643033333135223b733a33323a223439376361396638383663373332613561323761636131383631356166346632223b733a33323a223864666132323131353462303834396633313236643839626165346630343037223b733a33323a223665613662626266663865323461336234343438326363366162306666316236223b733a33323a226562326331656232643831633934326239316435373863333962653266623666223b733a33323a223336613064653638346537313265613762383937346132656537653630306262223b733a33323a223734363537383134346663633963316233373537383030623234303837623761223b733a33323a226239373634643961353035333933393763346363646466656565613332343639223b733a33323a223763373534626538306366356566323431643537366533343633616236623038223b733a33323a226236666633346133383934393333613330363532636431613364616432613835223b733a33323a223439393533313535343831643638613435613366626164323037386263313636223b733a33323a226166366263643964383233666439333763636237306636373836663536386162223b733a33323a226132636138663035653635346537633131656563343966396638376136313437223b733a33323a223930656138313935386231623938626366653830323364376134316635353836223b733a33323a223139346664653631643839393036626535363430386136336139353430646330223b733a33323a226463333063646138646131333365393863306231616532306364633534363735223b733a33323a223365353766356633373539353536313837623838656239393238313536343437223b733a33323a223534393339353434643831666366646561333065313735623264643766313935223b733a33323a223332643762336339616262353039636237336338313663376538666538343961223b733a33323a223466613666353433393833656364333532386663376261353436323062356532223b733a33323a223665323134653265376632613732336165393763323430333164326466396638223b733a33323a226363613034393035633830346632653766393963656461666132313437613863223b733a33323a223761643836616562663566393764326230363564323163336565346461623162223b733a33323a226363333136633433366266363134663661323234643466333737306236313365223b733a33323a223938306235346566323835353164356637333237336631373662626561316236223b733a33323a223738313862396262313933616130393261323038303866393234653665343630223b733a33323a223235396230353034333038383662663439616463643232316531613064336336223b733a33323a223465333931313537386666336232303263306638356335313137336262666166223b733a33323a226662343764333964653366646639616366646231643031653234653638353136223b733a33323a223836386134356131316633613061623465323635356562656238656234383162223b733a33323a223839343464386631663637356663393764373532383162373365613065663363223b733a33323a223263633264373631343533633137333866653962623135306432343731396234223b733a33323a223732303164373266306363333435376134633132633431663461323766323739223b733a33323a226439363364393630613034396635643332643130396261663138646335636433223b733a33323a223033393031323735346632623134323332303231666430643336353365646665223b733a33323a223739323066663961666363303834373339326538306134346365666163646436223b733a33323a226133633665613236386335303234363434626632653939343135326339353433223b733a33323a226139623239323263346631313134383938343839623136636237386664383536223b733a33323a223735386135383134613237633939313831383039613631303236633965346633223b733a33323a223061393234353764303666376363386164313734346165663336653530346266223b733a33323a223639653166353230373430653361356536353035643938386663396464346261223b733a33323a226335343935616239376362353131346639366633353835616565653266623532223b733a33323a226137313236356361613037633262363765626235366433383430383337313939223b733a33323a226432643232336331366236383430363962643032626334306561393637353266223b733a33323a223865383961626133313464383266313636613937653262666132616233643937223b733a33323a223030386134323566333937303762396163323132363031613861336233323831223b733a33323a223862646265386165633631393665626661373638613265643939343134366564223b733a33323a226136356466373665303564373362633062333139316637326539643631383931223b733a33323a226464333030623764613137643438643735336330616330353663363663376263223b733a33323a223830633161343132366233623436373531396661396637656534653365653762223b733a33323a223366353133303532653666623762666437623661313766393736653635646665223b733a33323a223034613637393463353664646339343337386565656135386334343439633337223b733a33323a226533323261376334333137303335623461336366623639623161346230626338223b733a33323a223763373936663366326633346131333962393333336637346236316664666530223b733a33323a223766386537653961616264353863613236323633636433646466643733633137223b733a33323a226466376636373630396462323437656238643062623036396233643762396633223b733a33323a223666343661623934306439643334313364623136663761663438383338393063223b733a33323a226236313935356663393735303564393466616134663337376632643535643431223b733a33323a226233653763363464363165373637333262383835666130386533346237656566223b733a33323a223663393633646139353663353637376636363434613034313334353764373166223b733a33323a226538303230343861396236626535313865306437626137633361663132653935223b733a33323a223633393431613461643437613836366335636433383738626662336639303230223b733a33323a226438623364643166346634383431636333656534386531306466663065343964223b733a33323a223434303135653934666664626666646532353132656337343237363539626464223b733a33323a226265343361616464326338663338343435616661346663393035653562616461223b733a33323a226430373437323764336266383264653462663137663435643734373032633261223b733a33323a223830313663363534663031316165386233303739613339396563626164353266223b733a33323a223334343936636635333638663233353032666461346662643661323162653963223b733a33323a223463356366353337313039613266653937346362346333343537366334666639223b733a33323a226264323735306164353930373232643236613533623931636139363331646338223b733a33323a223833623935626566386465616539343033346337633132646534623064336236223b733a33323a226261303062646465343535393130663539363862643063383864356662633130223b733a33323a226339353164646664303939656435313633626133313036643562613831373762223b733a33323a223838633738343439393735653761373661363466643764316162346563643363223b733a33323a223333363238666331643135653663363235343931393234613766626531323561223b733a33323a223732653164633763623930643465313737353539373339646131306563323639223b733a33323a223937373833636131333632613631306135306430363637643730303636653661223b733a33323a223637383332313932663365656432373966373832376132666430353963623932223b733a33323a226362386237343465636661616633663434306535666161653933613561643062223b733a33323a223464393631343666306364613535366435393536363763613339633631633639223b733a33323a226231346661303661613761363263343366323764316232366134313563396234223b733a33323a223665376165613563646362373831313862646365636636613365323638363365223b733a33323a223436316331353032316332386336626639333539313134653566623635643264223b733a33323a223962353530353033386433393962393666316136636334623761323061366634223b733a33323a223939626362366635623533373838623761626265376566343564663564383939223b733a33323a223533306639313564663435346134366530376237633266356138356239393336223b733a33323a223633373738633839383432623736346535633539326535323335396166316562223b733a33323a223931643135313731653036633535323632643236333762313430396365666234223b733a33323a226638363838396164653261346237663031363735646533646264613261313631223b733a33323a226361313162653535386133613534666239326161353963303761366234366235223b733a33323a223533316430316661653332356337653965303137636164336139356533363030223b733a33323a226238613330636330393938323664336438323766636162303466343366366531223b733a33323a226661353638333863396538646531656162643136616261653039326262626333223b733a33323a223534366162356338346236653964633663316566333262383637303561333765223b7d733a343a2268617368223b733a36353a2235343661623563383462366539646336633165663332623836373035613337652d6661353638333863396538646531656162643136616261653039326262626333223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1731346602),
('ehfv54r4q0as0ranf86uj2er6i', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383930323934392e3036333039333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e7464766f35726f7371716c3164356f38677470736272396e68223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383934353132383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383934363132303b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226336623139646433656265653431613938346231643439353936336561313365223b733a33323a226463663866306461643165636264613466306337333461343336646164646131223b7d733a343a2268617368223b733a36353a2264636638663064616431656362646134663063373334613433366461646461312d6336623139646433656265653431613938346231643439353936336561313365223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223466336434643237633434616163633932363334376562363637336432333166223b733a33323a223062383833656461373461653236666463336563663466636234316132323034223b733a33323a223730393831373335303562323362373139313562366230386233396664653064223b733a33323a223137386262353432643032336433383435313364393363323036376538386565223b7d733a343a2268617368223b733a36353a2231373862623534326430323364333834353133643933633230363765383865652d3730393831373335303562323362373139313562366230386233396664653064223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728902949),
('i0v1ti39vk71ov3mvrpe549nuc', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383839393339322e3631353832363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235713230726e3676376262733739346838317435356330767067223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383933333431313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383934323537353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383933343539333b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223031396461653761363238356237623931333266386532616637323737643137223b733a33323a226238336362383232366662313732633166356337616666643631303130386462223b7d733a343a2268617368223b733a36353a2262383363623832323666623137326331663563376166666436313031303864622d3031396461653761363238356237623931333266386532616637323737643137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223035323064343964386639383137303335396538306635343366323538386261223b733a33323a226334376630626537643236336566333564353130366162386235376563636562223b733a33323a223137366166356434383530376336616635656565383266646138366630653732223b733a33323a223037386430383239353933343239616131306633353430303764666332383263223b733a33323a223033346234623263633536396237646563383330623738633663623135316430223b733a33323a226437363062643537366334376361356335643934353639383135663534656463223b733a33323a223964323135363731366135363936366139643335343866323761633336653661223b733a33323a223566336263636532313636363835613361323361383263366532653265653936223b733a33323a226434626133356564303937643638653138393563633461636536366666353366223b733a33323a226637643336373031616133616561393334396262313039393866646237343238223b733a33323a223362623935616636373635383131666661303066353961353932346330646530223b733a33323a223533633937306337623930643034643933636466666366643431373738323737223b733a33323a223633306230356330633464663134303933393764643863373064326261326430223b733a33323a223633646532383930376261636231383036376130386435646132303434383737223b733a33323a226634626538326531613331353535343932613338363239343065636264323863223b733a33323a223734666134373766303862356230633036383665343131336137643064613039223b733a33323a223461396565643234303064636262376465653865663739316636366265306565223b733a33323a223738613239653031323465346562613063306632666334333239343732343130223b733a33323a226366373263376264303332316533393635623364613834616566663964313535223b733a33323a223663353232623537346563383638383435656330333764303633303061373637223b733a33323a226239306162633437653461643865353830333866373334343434646634383836223b733a33323a223562626130643535383731636232333936623539663061666333326238396238223b733a33323a223838303438336239623161316234346561313139393765666162396230336664223b733a33323a226534383866373663336263326635343636613861663137393662333162623061223b733a33323a226439343666333264363739323135653434616331376662303936393164326533223b733a33323a226230386166303366313037623134623866333232353363623037373332303761223b733a33323a223437303164646138656233633766633737653133363262316336363532623464223b733a33323a223632656132636131363936343634306564626338306333366361316365353732223b733a33323a223834353664666238653033643834323863613761626231623838636165613562223b733a33323a223336396562353965336630366566636238376232313836393930633436383037223b733a33323a223239623664323835333437653665613935386135343864373832623031323931223b733a33323a223063356466633739393464636562323538646164323766653738386135386531223b733a33323a226433613738316537663136646139643530303263333530396531363866333330223b733a33323a223665346464373263626633636565656432656333383536323461626135383731223b733a33323a223236323534343966353939633365613661353065636230653731373063323331223b733a33323a223832383861623132316464643238626332626630353236303638643135326634223b733a33323a223835663565353839353338626462366436633238306639373132346562366232223b733a33323a223634313734313336653032306536386232623835346135303135633833633132223b733a33323a223261313737663032336437323835336565663339666166653564623630306339223b733a33323a226165643739366665356231666166373466316636386334363732336638313865223b7d733a343a2268617368223b733a36353a2261656437393666653562316661663734663166363863343637323366383138652d3261313737663032336437323835336565663339666166653564623630306339223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223066383866653731646439363738323231303533343133316164343564313034223b733a33323a226563323535353230656131346639363435346564663535623661376466336166223b7d733a343a2268617368223b733a36353a2265633235353532306561313466393634353465646635356236613764663361662d3066383866653731646439363738323231303533343133316164343564313034223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728899392),
('i7oqpk3i09gl1g3b55a1k99qdv', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383831313937382e3538333136323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267713132746a39626275626c68313968306d6332653475373563223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383835353033343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383835353137383b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226533343237653762313164383465363163386333323030333432626563333733223b733a33323a223030313965653836376438643234303934303066346665396230333638346265223b7d733a343a2268617368223b733a36353a2230303139656538363764386432343039343030663466653962303336383462652d6533343237653762313164383465363163386333323030333432626563333733223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223836633530653862346432623136333137633339656262313539393939393238223b733a33323a223332623134666430656330303865663864643461346234303737313938393661223b733a33323a226639333764633830613366326430373238316631643837373633666134663232223b733a33323a226662316265383965313732326332373733663736353335383661636330306135223b733a33323a226433313064393661373066336165303865383931376137333932613336303338223b733a33323a223032336362323031373762353131316430393166613364386364393762623130223b733a33323a223864646666323462333261646464303264396431646430326631386563623335223b733a33323a223462353565333634616439643334383633323337663231356263303233633334223b7d733a343a2268617368223b733a36353a2234623535653336346164396433343836333233376632313562633032336333342d3864646666323462333261646464303264396431646430326631386563623335223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728811978),
('jkh8ul4gfemjqrvul17ejk20g9', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732393937323038332e3331313532343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22363464663070766635303274323565366f336d6c6f713539646d223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303031323039303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303031353136313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303031353138323b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303031343737313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303031353138323b7d733a36353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303031343738303b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223837643834643163613839313865643636336538383536623637663832653739223b733a33323a223930323530623066333564366536623433313330626364643365633665656239223b7d733a343a2268617368223b733a36353a2239303235306230663335643665366234333133306263646433656336656562392d3837643834643163613839313865643636336538383536623637663832653739223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a226637663231656564653565303532313164663730366337333434616139383134223b733a33323a226335326339613037623235306139666161613630333765303630313365333938223b733a33323a226130633038323033666134656461353033343564313830613465343432303631223b733a33323a226233656237363963343433343839346264383235356231323532336264633739223b733a33323a223262373766613534336463376535383765323636663037373139316665326438223b733a33323a223963313837346435613131363739343938343633623563616464393861343061223b733a33323a223836353533616534393230626130313966616332383230353134316232343762223b733a33323a223765643132353162666562666435363130373265323165346664363666393161223b733a33323a223261396130666334313565373031346437303634366131613963656434663863223b733a33323a223464656264353661376665386364663933363134343537356265623264383339223b733a33323a223233363337626262343339663334656465363633343163343830646636313936223b733a33323a226431643761343134326339356335313738663439636231346530316661316566223b733a33323a223763663562366533323662323638306466623137306339376434373135653839223b733a33323a226135616234633863653439326666623930376232616165386162346265623766223b7d733a343a2268617368223b733a36353a2261356162346338636534393266666239303762326161653861623462656237662d3763663562366533323662323638306466623137306339376434373135653839223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223738653463326235353063346339636662333633323466336632363964613831223b733a33323a223432656232636561373835626566646533313464383462333039636162633835223b733a33323a226564643736393232313732643562386461363834613933303334376565663163223b733a33323a226433653062386539366534623563636661383037313831663234643362646637223b733a33323a223539373230633934663937616533383266396263393464333165366131393031223b733a33323a223465666261313537316237653331623638336662646431303161346236666163223b733a33323a223332386538613462363863333963613466303564356135376434393632316434223b733a33323a223363303038313561343764366633353132383439346165386265373838356139223b733a33323a223839346233373139613734333966356434613232633262373766663133633561223b733a33323a226633343839643232646265356236353466386164393536373661313664643163223b733a33323a226364353764633532373034373763636263363764366536623835326131646363223b733a33323a226366646131646263376332613233393461643863303763323934663661626631223b733a33323a226333643863303863653366343134386231366561356361393934636134396465223b733a33323a226366356666636436353665353166663663393762663461303135343838383837223b733a33323a226332393665356564383337393636616439656132393564653736353863336263223b733a33323a223162336361383134646436396565626638393963363839383235353139613666223b733a33323a226166316562623136373534653339343962376362353234326135366239353839223b733a33323a223134383362373533373136356565373566356532346565633031333930383131223b733a33323a223061613161346335626231396264356162323333326437626437636666633061223b733a33323a226561373237383563613564636261323731643234383635613164313038353138223b733a33323a226263623031383666653230643363386637326531663036353962343539353461223b733a33323a223431656364666563343232376533326137643865653232613837313537636335223b733a33323a223263616531393438626139323234336434643662646432653031353637353965223b733a33323a226539626264663033353365363638653237343333623939396234613939386366223b7d733a343a2268617368223b733a36353a2265396262646630333533653636386532373433336239393962346139393863662d3263616531393438626139323234336434643662646432653031353637353965223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223438353630383130636336646537306165646262313832623438393364313064223b733a33323a223365663138656438636138643230653164356435666233353139353931323562223b733a33323a223365373963653033666630356562643230316332333935646562633338666265223b733a33323a223530373430616264333666316663373932663039653333373633356664323861223b733a33323a226362643532306335643131623536393639623764616430356561393261343762223b733a33323a223164626561623232353466616566313066623232353761383438646262353962223b733a33323a223766373263353736386664313433326436646335613763353132393164633662223b733a33323a226363343064663365343035303866626632643636323762646237323862346365223b733a33323a223035626261653530356433623834343965663865383038353233343464373061223b733a33323a226462353438656531326133613936386339313031366366376131633962333231223b7d733a343a2268617368223b733a36353a2264623534386565313261336139363863393130313663663761316339623332312d3035626261653530356433623834343965663865383038353233343464373061223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223937366233636335356533363438626131613231356262363431353833316236223b733a33323a223663653061613138373534313836306633396631613138626532616666333161223b733a33323a226438613131633862323032633438666535636465666130383565653230623137223b733a33323a223838616563313130353338326339333766623731663263313462626331356164223b733a33323a223136343763326234336162633338386236646333616531393465323535373464223b733a33323a223336646431643934313838383238393230383034353837623337356133336461223b733a33323a226137663065636662303435656438646639396230336239656366636239343762223b733a33323a223339636436376230663433366663653365666261346536313530376234316465223b733a33323a226665386337623838613930346233343838653362663163303566356130313332223b733a33323a223161336264386461316338303133336664316666353161313835653437626132223b733a33323a226335613762323964666134383830376337313936393738326135646565633866223b733a33323a226634336166313732343236313439623366386432386662626535303633633939223b733a33323a223039656236633032343335363630303063656532386464633937376234613337223b733a33323a223962356238646333663231346334333366303431663732333664333831636163223b733a33323a223365663439633438376564343132643233623936623432313665656139316535223b733a33323a223135366235306331653935643233333165646234346666376363636461326161223b733a33323a223333386262353234396237393162623232393065353963656534666362663739223b733a33323a223533633535366132313937656262666435346635646639666531636432343935223b7d733a343a2268617368223b733a36353a2235336335353661323139376562626664353466356466396665316364323439352d3333386262353234396237393162623232393065353963656534666362663739223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226639343733323932643031623564303632663463623864383632333637653866223b733a33323a223231313935326637353039363435653734333432313236623437613137313331223b733a33323a226562326633346330313861626665633833323338376535333137613966353163223b733a33323a223031663235383637336436393338666262643739643233643862646464353066223b733a33323a223134633636633433393738653063323262336562663239663739303335666331223b733a33323a223331636561383234396564643134363239616236343936356665633537653837223b7d733a343a2268617368223b733a36353a2233316365613832343965646431343632396162363439363566656335376538372d3134633636633433393738653063323262336562663239663739303335666331223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1729972083),
('kub2p9hhlg7fm1vd9temqndpmk', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732373730393732352e3332373938373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c70616c6f736736326b6630396574727430323174356932626c223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732373735323931343b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223036383364396132343961613061636437353865356365633565346235633262223b733a33323a223365366232633966383133316233656236633162346664383761326233363833223b7d733a343a2268617368223b733a36353a2233653662326339663831333162336562366331623466643837613262333638332d3036383364396132343961613061636437353865356365633565346235633262223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1727709725);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('p9vm9f9go1nukm37g8ugjn3r33', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303731353937342e3339373336343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22756864716a6d3366746f6b66626b6f34336e376d6d7467326270223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303735323339323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303735373835353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303735373732353b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226230366564373462653566626535626434383434663366393531303035316365223b733a33323a223163343337643834306363303533336434306563366234613636623132633636223b7d733a343a2268617368223b733a36353a2231633433376438343063633035333364343065633662346136366231326336362d6230366564373462653566626535626434383434663366393531303035316365223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a226334323838326533353732303332373134343165646561363439376165306136223b733a33323a223039343266366639613962396565656364336364663666643063366462303932223b733a33323a226561653133353735663830666338373531663865626366643033333038616232223b733a33323a223233613063333639303630663665393838313732616333636532346232366163223b733a33323a226265313034326165356466333661393166396561316233353136653238323734223b733a33323a226530646436663934353633383638653233633831616366623235333034303538223b733a33323a226432333162663163366462613731613539636464346665623064333931386261223b733a33323a223061376636356437376361636635313038393730623737386662636661316236223b733a33323a223230666362343465656234316136626365376432353662653636383436323564223b733a33323a223234373231353064303633396364626563626165653038653637366662343131223b733a33323a226536666662386534663532333031626232653632393037386130356135366339223b733a33323a223132653333373136653565393265343132303434613438343365633761376330223b733a33323a226266333164666333343061363966323734613662666138343062646563343564223b733a33323a223165316534646538653661373336396265386264393437636661343861663939223b7d733a343a2268617368223b733a36353a2231653165346465386536613733363962653862643934376366613438616639392d6266333164666333343061363966323734613662666138343062646563343564223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223763393036616231313864313635623632353439643837393238663863346630223b733a33323a223861633531343738336662663736383632643532646665613262343433326639223b733a33323a223136646166643764353662656537356661396636323433323932623561313530223b733a33323a226361626436383662616133393462666465323766643164666264626466303639223b733a33323a226436363337313233363539383734653832643235333438333336386464646161223b733a33323a223738373532373861376465383732386236663663363736653237613936633765223b733a33323a223661663939353366663732376362323136616531313162643534623761653962223b733a33323a226538356633303964643835666465373330376431313731336338313566653031223b7d733a343a2268617368223b733a36353a2265383566333039646438356664653733303764313137313363383135666530312d3661663939353366663732376362323136616531313162643534623761653962223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730715983),
('quml715np5uvc1244u3jiqk80p', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303130333638332e3334303731333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271756d6c3731356e70357576633132343475336a69716b383070223b7d7d, 1730103691),
('rev7vrgtmkap87tu825t20njqp', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383938323935392e3136363136373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746c6c6c6d736c7575336f6665313534686f3274316575677336223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393032353935373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393032353939313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393032353939323b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223939333634356139333134313835623963326666656435633339373462616235223b733a33323a226630396334376436363439626166643739646338316335323061663936336663223b733a33323a223332616130373439386463623431376435363239326431393966643136623135223b733a33323a223831323965363834363465643630383462663966346164313839366530626665223b7d733a343a2268617368223b733a36353a2238313239653638343634656436303834626639663461643138393665306266652d3332616130373439386463623431376435363239326431393966643136623135223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226662333865373864373331383338663237353335316363616639376337356430223b733a33323a223134653261323066373331613434303338346436636634633461306664303462223b7d733a343a2268617368223b733a36353a2231346532613230663733316134343033383464366366346334613066643034622d6662333865373864373331383338663237353335316363616639376337356430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226430363736636163376436656666313039613938636232393536663661343132223b733a33323a226265353533303037313966353164626534643439366431303736303665336264223b7d733a343a2268617368223b733a36353a2262653535333030373139663531646265346434393664313037363036653362642d6430363736636163376436656666313039613938636232393536663661343132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728982959),
('saia8n11m2r64v8p46j89m2bfc', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732373638343137342e3831323537383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261687335357533386f6f386a3162727076736c7536646f6e3376223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732373732373132313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226262346633666131613832616431353834626137616363643662386566643038223b733a33323a226561373762653438323762323339313466323839336639363530633835383536223b7d733a343a2268617368223b733a36353a2265613737626534383237623233393134663238393366393635306338353835362d6262346633666131613832616431353834626137616363643662386566643038223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1727684174),
('sc2o2cap82m3lq0si4iicaimq5', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303537333135352e3534383735363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2266726c7074636435676b31697174306f746a3165746e6d377636223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303631343933363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303631363131363b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303631363138383b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303631363130333b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303631363138373b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223262323636656661373032616163333831333430663562633265623061306233223b733a33323a223733343438353536633838643630323230326434656161613332343161383534223b7d733a343a2268617368223b733a36353a2237333434383535366338386436303232303264346561616133323431613835342d3262323636656661373032616163333831333430663562633265623061306233223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223862336638393862313333306335373364646135326464386666633039363539223b733a33323a226461373366666435623538336533666330666139333165643332303130376533223b733a33323a223738336435306630393331323764376531643136313739386633363436373864223b733a33323a226132626433336232643866333233636632663339336435376237363037373431223b733a33323a223537656239643434373431623861326565323336306433623230343165656265223b733a33323a226566316461653637393234633631666266623165343063303163383638643631223b733a33323a226264623465316537323430306636373334356535313362643338393464356138223b733a33323a223765306137356436643633393361346539366435393866363265616263313631223b733a33323a223536386636653663616435323663653534376236653761356663366566376635223b733a33323a223161343263663235336634306136346532393165633832373331336633653764223b7d733a343a2268617368223b733a36353a2231613432636632353366343061363465323931656338323733313366336537642d3536386636653663616435323663653534376236653761356663366566376635223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223939363433386666316131306565323136633265386333643832623037316138223b733a33323a223335323130316238313731616639646631623866396261653866376131616338223b733a33323a223563366161303331643664653330316163646633636432363630633538616338223b733a33323a223132613231316261636265363263393664393563343164323836663564336436223b733a33323a226461323261653134303433353236666661636438346430633535663839346236223b733a33323a223064323739386265626131633163366632353034316138613739623730376264223b733a33323a223465316336316436316661653739313434616363623931626161323262323962223b733a33323a223561646638316166623339333235303563356332353236383034306133646463223b733a33323a223764393464313731646239626436306565623239333263386434663161626666223b733a33323a223130646136363862666437323564373134323566393665636164373336326436223b733a33323a223638323163633233636437346431636431303233306665323265323932656135223b733a33323a223439356261643333303737653165313131653938376233303639353239383132223b733a33323a226530626137623664323265646462373830383865343037333634396637653038223b733a33323a223863343436656235373437393339386233613461663163663266356166623733223b733a33323a223232633932366366653432303639653563356166316232363534323237613565223b733a33323a226361366665373665626330643437636266643063336338353536383263653866223b733a33323a223835313766373663343265333732366634356330346635356531663663353635223b733a33323a223230383132393664343461363264333031646462636663386133656239626335223b7d733a343a2268617368223b733a36353a2232303831323936643434613632643330316464626366633861336562396263352d3835313766373663343265333732366634356330346635356531663663353635223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223430663866373435643031616536663765666530633561323361376336386561223b733a33323a223361313961663133326538643130326465656636623731653134363639303762223b7d733a343a2268617368223b733a36353a2233613139616631333265386431303264656566366237316531343636393037622d3430663866373435643031616536663765666530633561323361376336386561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226236663430336232316534623130616362303264623339316535616534346364223b733a33323a226136306366373066386237393730616632383732306137323732373165663235223b733a33323a226164333534313930666263643937613635643737653261333533393030393430223b733a33323a223561313336616566336632663361633665616634363331303038396665653035223b733a33323a226565616561656134313031663965353039363739313564646333326366663166223b733a33323a223464363465343637376234616163316632383736373437643031306336363730223b733a33323a223434636137336162646661626433303764363035366164373666376564663835223b733a33323a223131343166623664653132336564316165373964303364656666623130666339223b7d733a343a2268617368223b733a36353a2231313431666236646531323365643161653739643033646566666231306663392d3434636137336162646661626433303764363035366164373666376564663835223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730573155),
('vfad3t03p7udm8ng642d7hv1jq', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383337393739342e3934383734313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e6630736762367131703532337434676938636668733765646c223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383432323535323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383432323939353b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223632383530306633393733663863643737383962353233643131393135383332223b733a33323a223666306338633930306163623664336237353835313336303839653433646335223b7d733a343a2268617368223b733a36353a2236663063386339303061636236643362373538353133363038396534336463352d3632383530306633393733663863643737383962353233643131393135383332223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a223164376631373637343261393362636264333238636639643632623732373432223b733a33323a226330656336633461623238643332626362636666383662636233383538346264223b733a33323a223962393161663235333536346663656361636131373236326236363931346362223b733a33323a226334626433656165633365386430616434373062643763373236323365336332223b733a33323a226337383866356662623064636234306466646433386139356438626534376338223b733a33323a223835393166306261623334383434316237663962636462326165643138333731223b733a33323a226162643030636132343263323461653462303034636536353135663734363038223b733a33323a223836303936356430656639636438356132366666666662613639643936663036223b733a33323a223638626434306539333831636438373335363034353764633239353837623735223b733a33323a223761313464356130613338306162623836336536343461383135393366333737223b733a33323a223566373766326563343864366262636363353830623732616632383661353437223b733a33323a226166366133346338633864353364376362333962353661313831366161386565223b733a33323a223836633131303239363339633635306531393938626232353865616439336538223b733a33323a226239323436623836333230326361616566613265356136336632346436656130223b733a33323a223430383835633131356530373736646565363466646364363763326239376637223b733a33323a223566363733613066306533366437356230656537623834343531336264313062223b733a33323a226236623733616665653464343232633663366330633861643632336263313066223b733a33323a223136306132653866396163613664323935363735346130656637303536366466223b733a33323a223032633965363831356633653262616139343132656134336435336361376435223b733a33323a223736326633386235383266333032613165303535306132616430313665346461223b733a33323a223761646462643965643366316431613936343936336264383638666565623065223b733a33323a223637316234656537316236636433613665613431343862613839623533333461223b733a33323a223538623032366161363932636530373931333562393332393833343637323864223b733a33323a223761316236356366363966613961356539343931306132633362643961313464223b733a33323a223463636135366232623464373565323235613165666630366431313964343764223b733a33323a226561343637383231663634373732343835336630333835306164636530323931223b7d733a343a2268617368223b733a36353a2265613436373832316636343737323438353366303338353061646365303239312d3463636135366232623464373565323235613165666630366431313964343764223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728379795);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"nathan.benais@gmail.com\"'),
('default_site', '\"\"'),
('default_to_private', '\"0\"'),
('disable_file_validation', '\"0\"'),
('disable_jsonld_embed', '\"0\"'),
('disable_jsonld_reverse', '\"0\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('favicon', '\"\"'),
('installation_title', '\"Mobilit\\u00e9 Durable\"'),
('locale', '\"\"'),
('media_alt_text_property', '\"\"'),
('media_type_whitelist', '{\"0\":\"application\\/msword\",\"1\":\"application\\/ogg\",\"2\":\"application\\/pdf\",\"3\":\"application\\/rtf\",\"4\":\"application\\/vnd.ms-access\",\"5\":\"application\\/vnd.ms-excel\",\"6\":\"application\\/vnd.ms-powerpoint\",\"7\":\"application\\/vnd.ms-project\",\"8\":\"application\\/vnd.ms-write\",\"9\":\"application\\/vnd.oasis.opendocument.chart\",\"10\":\"application\\/vnd.oasis.opendocument.database\",\"11\":\"application\\/vnd.oasis.opendocument.formula\",\"12\":\"application\\/vnd.oasis.opendocument.graphics\",\"13\":\"application\\/vnd.oasis.opendocument.presentation\",\"14\":\"application\\/vnd.oasis.opendocument.spreadsheet\",\"15\":\"application\\/vnd.oasis.opendocument.text\",\"16\":\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"17\":\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"18\":\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"19\":\"application\\/x-gzip\",\"20\":\"application\\/x-ms-wmp\",\"21\":\"application\\/x-msdownload\",\"22\":\"application\\/x-shockwave-flash\",\"23\":\"application\\/x-tar\",\"24\":\"application\\/zip\",\"25\":\"audio\\/midi\",\"26\":\"audio\\/mp4\",\"27\":\"audio\\/mpeg\",\"28\":\"audio\\/ogg\",\"29\":\"audio\\/x-aac\",\"30\":\"audio\\/x-aiff\",\"31\":\"audio\\/x-ms-wma\",\"32\":\"audio\\/x-ms-wax\",\"33\":\"audio\\/x-realaudio\",\"34\":\"audio\\/x-wav\",\"35\":\"image\\/bmp\",\"36\":\"image\\/gif\",\"37\":\"image\\/jp2\",\"38\":\"image\\/jpeg\",\"39\":\"image\\/pjpeg\",\"40\":\"image\\/png\",\"41\":\"image\\/tiff\",\"42\":\"image\\/webp\",\"43\":\"image\\/x-icon\",\"44\":\"text\\/css\",\"45\":\"text\\/plain\",\"46\":\"text\\/richtext\",\"47\":\"video\\/divx\",\"48\":\"video\\/mp4\",\"49\":\"video\\/mpeg\",\"50\":\"video\\/ogg\",\"51\":\"video\\/quicktime\",\"52\":\"video\\/webm\",\"53\":\"video\\/x-ms-asf\",\"55\":\"video\\/x-msvideo\",\"56\":\"video\\/x-ms-wmv\"}'),
('pagination_per_page', '\"25\"'),
('property_label_information', '\"none\"'),
('recaptcha_secret_key', '\"\"'),
('recaptcha_site_key', '\"\"'),
('time_zone', '\"Europe\\/Paris\"'),
('use_htmlpurifier', '\"1\"'),
('value_languages', '[]'),
('version', '\"4.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'nathan.benais@gmail.com', 'Nathan', '2024-09-30 08:12:01', '2024-09-30 08:12:01', '$2y$10$so00bq1G0LpaahlPaJQhzubMhQ0cZIOKy25tkV3Qaz.9sK0c8cmwW', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel', '2024-11-25 09:02:14', '2024-11-25 09:03:26', '$2y$10$sl3gWgoJo.Fo4OhvijNNk.v5bC//wLGSTI/VTeeGbjhGJTMamBEF2', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('csv_import_automap_check_names_alone', 1, 'true'),
('csv_import_delimiter', 1, '\",\"'),
('csv_import_enclosure', 1, '\"\\\"\"'),
('csv_import_global_language', 1, '\"\"'),
('csv_import_identifier_property', 1, '\"\"'),
('csv_import_multivalue_separator', 1, '\",\"'),
('csv_import_rows_by_batch', 1, '20'),
('default_resource_template', 1, '\"\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"\"'),
('locale', 2, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(211, 23, 229, NULL, NULL, 'literal', '', 'Hugo', NULL, 1),
(212, 23, 230, NULL, NULL, 'literal', '', 'Martins', NULL, 1),
(213, 23, 231, NULL, NULL, 'literal', '', 'hugo.martins@gmail.com', NULL, 1),
(214, 23, 220, NULL, NULL, 'literal', '', 'test', NULL, 1),
(227, 29, 229, NULL, NULL, 'literal', NULL, '{\"p\":\"Prénom\",\"v\":\"Bastien\"}', NULL, 1),
(228, 29, 230, NULL, NULL, 'literal', NULL, '{\"p\":\"Nom\",\"v\":\"Boa\"}', NULL, 1),
(229, 29, 231, NULL, NULL, 'literal', NULL, '{\"p\":\"Email\",\"v\":\"bastien.boa@gmail.com\"}', NULL, 1),
(230, 29, 220, NULL, NULL, 'literal', NULL, '{\"p\":\"Possède trajet\",\"v\":\"Non\"}', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(7, 1, 'http://bilancarbone.org/ns#', 'fup8', 'Mobilite Durable', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Index pour la table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Index pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_84D382F4BE04EA9` (`job_id`);

--
-- Index pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  ADD UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`);

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Index pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Index pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Index pour la table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Index pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Index pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Index pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Index pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `is_public` (`is_public`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Index pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Index pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Index pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Index pour la table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Index pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
