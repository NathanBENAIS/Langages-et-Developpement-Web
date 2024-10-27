-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 27 oct. 2024 à 11:45
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
(1, 'items', 1, 1, NULL, 'TechMobility Inc\nStartup / Entreprise technologique\n25/09/2024 20:43:48\nAccès aux données pour développer des systèmes de gestion de flotte électrique.\nOui, collaboration avec des fournisseurs d\'énergie et des collectivités locales.\nEncourager l\'utilisation de véhicules partagés ou électriques\nSimplifier les réglementations pour favoriser l\'innovation.\nOui, développement d\'une plateforme de gestion de flotte électrique pour entreprises.\nSystèmes d\'intelligence artificielle pour l\'optimisation des trajets.\nOui\noui\ntest@gmail.com\nJoe\nDoe\n2 Rue de la Liberté, 93200 Saint-Denis'),
(2, 'items', 1, 1, NULL, 'safe dispose\nEntreprise de transport\n09/10/2024 16:06:07\nCréer un dépôt sécurisé pour les déchets toxiques\nPartenariats avec des municipalités : Nous collaborons avec des villes pour identifier les défis locaux en matière de mobilité et développer des solutions adaptées, comme l\'amélioration des infrastructures et l\'optimisation des services de transport en commun.\nRéduire les émissions de carbone\nCollaboration : Travailler avec des partenaires publics et privés pour développer des infrastructures adaptées et créer un écosystème favorable à la mobilité durable.\nPartenariats avec des municipalités : Nous collaborons avec des villes pour identifier les défis locaux en matière de mobilité et développer des solutions adaptées, comme l\'amélioration des infrastructures et l\'optimisation des services de transport en commun.\nMobilité intelligente : Intégrer des systèmes de transport intelligents (ITS) qui utilisent des capteurs, des données en temps réel et des algorithmes d\'intelligence artificielle pour optimiser les flux de trafic et améliorer l\'expérience des utilisateurs.\noui\noui\nimane0037@gmail.com\nimane\nel rhazi\n4 avenue Michel Debré, résidence Arpej'),
(3, 'items', 1, 1, NULL, 'Mobilité\nEntreprise de transport\n13/10/2024 20:55:32\nRéduire les émissions de carbone\nRéduire les émissions de carbone\nNon\nManque de données pour optimiser les flux\nApprofondir les recherches\nNon\nRéduire l’utilisation du Carbon\noui\nnon\nmelissaorb02@gmail.com\nMelissa\nOurabah\nNoisy le grand'),
(4, 'items', 1, 1, NULL, 'Moussaoui\nEntreprise de transport\n13/10/2024 22:51:15\nDéveloppement d\'infrastructures de recharge pour véhicules électriques\nRéduire les émissions de carbone\noui, Nous collaborons avec des collectivités locales pour la mise en place de zones de recharge électrique et avec des entreprises technologiques pour intégrer des systèmes de gestion de données de transport en temps réel.\nAccès limité aux infrastructures (pistes cyclables, bornes de recharge)\nTravailler avec des décideurs politiques pour accélérer la mise en place d\'infrastructures adaptées\noui, nous avons introduit des bus électriques dans certaines zones urbaines, équipé nos véhicules d’un système de suivi en temps réel pour optimiser les trajets et mis en place un service de covoiturage pour les trajets domicile-travail en collaboration avec des entreprises locales.\nNous souhaitons développer des partenariats avec des startups spécialisées dans les technologies de recharge rapide pour les véhicules électriques et intégrer l\'intelligence artificielle pour mieux prévoir les flux de passagers et adapter l’offre de transport en conséquence.\n\noui\noui\nmoussaoui.rania755@gmail.com\n\n\nRania\nMoussaoui\n17 Rue Vincent Compoint'),
(5, 'items', 1, 1, NULL, 'Univeristé\nInstitut de recherche / Université\n14/10/2024 08:12:52\nPromotion des plateformes de covoiturage et de partage de véhicules électriques.\nEncourager l\'utilisation de véhicules partagés ou électriques\nNon\nFinancement insuffisant\nCollaborer avec le secteur privé et la société civile\nNon\nAccélérer le développement et l’intégration de véhicules autonomes 100 % électriques, avec des infrastructures adaptées (bornes de recharge, systèmes de contrôle).\nOui\nOui\nnoureddineaitkhouya@gmail.com\nNoureddine \nAit khouya\nAnsieres sur seine'),
(6, 'items', 1, 1, NULL, 'Paris 8\nCitoyen / Usager\n14/10/2024 08:34:08\nLes solutions d’optimisation de parcours, basées sur les données en temps réel (trafic, retards), aident les usagers à gagner du temps et à choisir les meilleurs moyens de transport\nAméliorer l\'efficacité des transports publics\nnon\nFinancement insuffisant\nAméliorer la sécurité et le confort\nnon\nDévelopper et intégrer des véhicules autonomes (bus, voitures, taxis) dans les réseaux de transport urbain pour améliorer la fluidité du trafic, réduire les accidents et offrir des services de transport 24/7. Les véhicules autonomes peuvent être utilisés à la fois pour le transport public et pour des services de livraison, optimisant ainsi les trajets et réduisant les émissions de carbone.\noui\noui\noumaimaelelfazazi01@gmail.com\noumaima\nel elfazazi'),
(7, 'items', 1, 1, NULL, 'R10 LOCATION\nCollectivité locale\n12/10/2024 15:49:06\nLE FINANCEMENT\nAméliorer l\'efficacité des transports publics\nnon\nFinancement insuffisant\nacquisitions de matériel, équipement et travaux\nnon\nCréation d\'un site internet\noui\noui\nmassidireddy@gmail.com\nReddy\nMASSIDI SEMI \nAlfortville 94140, 5 sente de villiers'),
(8, 'items', 1, 1, NULL, 'mokrani islam\nFournisseur d\'énergie\n13/10/2024 17:06:21\nfavoriser l\'écologie\nRéduire les émissions de carbone\nnon\nFinancement insuffisant\ntrouver des partenariat\nnon\ndes technologies de ai\noui\noui\nmokraniislam998@gmail.com\nislam \nmokrani\n75002'),
(9, 'items', 1, 1, NULL, 'Énergies Futures\nCollectivité locale\n01/10/2024 23:37:54\nAccès à des subventions pour financer des infrastructures de recharge pour vélos et voitures électriques.\nDévelopper des infrastructures de mobilité douce (pistes cyclables, trottoirs)\noui, Nous travaillons avec des collectivités locales pour installer des bornes de recharge dans les zones rurales et avec des entreprises de transport pour alimenter leur flotte électrique.\nManque de données pour optimiser les flux\nRechercher des investisseurs privés pour financer des projets d\'infrastructure.\nNous avons déployé un réseau de bornes de recharge rapide dans les zones périurbaines et avons développé des batteries de stockage d\'énergie renouvelable pour alimenter les bornes.\nDéveloppement de solutions de recharge mobile pour véhicules électriques.\noui\noui\ntop@gmail.com\nPierre \nMartin\n10 avenue de la Liberté, 69003 Lyon');

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
(1, NULL),
(2, NULL),
(3, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL);

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
(22, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire.csv\",\"filesize\":\"9263\",\"filepath\":\"C:\\\\Users\\\\Nathan\\\\AppData\\\\Local\\\\Temp\\\\ome95AC.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":{\"12\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2024-10-14 18:50:56', NULL);

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
(185, 1, 5, 'Horodateur', 'Horodateur', NULL),
(186, 1, 5, 'Objectifs', 'Objectifs', NULL),
(187, 1, 5, 'Besoins', 'Besoins', NULL),
(188, 1, 5, 'NomOrganisation', 'Nom de l\'organisation / entité', NULL),
(189, 1, 5, 'Collaboration', 'Collaboration', NULL),
(190, 1, 5, 'Obstacles', 'Obstacles', NULL),
(191, 1, 5, 'Priorites', 'Priorités', NULL),
(192, 1, 5, 'SolutionsInnovantes', 'Solutions Innovantes', NULL),
(193, 1, 5, 'InnovationsFutures', 'Innovations Futures', NULL),
(194, 1, 5, 'Contact', 'Contact', NULL),
(195, 1, 5, 'Coordonnees', 'Coordonnées', NULL),
(196, 1, 5, 'Nom', 'Nom', NULL),
(197, 1, 5, 'Prenom', 'Prénom', NULL),
(198, 1, 5, 'Email', 'Email', NULL),
(199, 1, 5, 'Adresse', 'Adresse', NULL),
(200, NULL, 5, 'Role', 'Rôle', NULL);

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
(1, 1, 106, 4, NULL, NULL, 1, '2024-10-27 09:50:47', '2024-10-27 10:16:56', 'Omeka\\Entity\\Item'),
(2, 1, 106, 4, NULL, NULL, 1, '2024-10-27 10:20:10', '2024-10-27 10:20:10', 'Omeka\\Entity\\Item'),
(3, 1, 106, 4, NULL, NULL, 1, '2024-10-27 10:29:03', '2024-10-27 10:29:03', 'Omeka\\Entity\\Item'),
(4, 1, 106, 4, NULL, NULL, 1, '2024-10-27 10:31:00', '2024-10-27 10:31:00', 'Omeka\\Entity\\Item'),
(5, 1, 106, 4, NULL, NULL, 1, '2024-10-27 10:32:45', '2024-10-27 10:32:45', 'Omeka\\Entity\\Item'),
(6, 1, 106, 4, NULL, NULL, 1, '2024-10-27 10:34:07', '2024-10-27 10:34:07', 'Omeka\\Entity\\Item'),
(7, 1, 106, 4, NULL, NULL, 1, '2024-10-27 10:37:51', '2024-10-27 10:37:51', 'Omeka\\Entity\\Item'),
(8, 1, 106, 4, NULL, NULL, 1, '2024-10-27 10:39:52', '2024-10-27 10:39:52', 'Omeka\\Entity\\Item'),
(9, 1, 106, 4, NULL, NULL, 1, '2024-10-27 10:41:19', '2024-10-27 10:41:19', 'Omeka\\Entity\\Item');

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
(106, 1, 5, 'MobiliteDurable', 'Mobilité Durable', 'Classe représentant les informations sur les projets de mobilité durable.');

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
(4, 1, 106, NULL, NULL, 'Mobilité Durable');

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
(35, 4, 198, NULL, NULL, 13, NULL, 0, 0, NULL),
(36, 4, 199, NULL, NULL, 16, NULL, 0, 0, NULL),
(37, 4, 187, NULL, NULL, 4, NULL, 0, 0, NULL),
(38, 4, 189, NULL, NULL, 6, NULL, 0, 0, NULL),
(39, 4, 196, NULL, NULL, 15, NULL, 0, 0, NULL),
(40, 4, 194, NULL, NULL, 12, NULL, 0, 0, NULL),
(41, 4, 195, NULL, NULL, 11, NULL, 0, 0, NULL),
(42, 4, 185, NULL, NULL, 3, NULL, 0, 0, NULL),
(43, 4, 193, NULL, NULL, 10, NULL, 0, 0, NULL),
(44, 4, 188, NULL, NULL, 1, NULL, 0, 0, NULL),
(45, 4, 186, NULL, NULL, 5, NULL, 0, 0, NULL),
(46, 4, 192, NULL, NULL, 9, NULL, 0, 0, NULL),
(47, 4, 191, NULL, NULL, 8, NULL, 0, 0, NULL),
(48, 4, 197, NULL, NULL, 14, NULL, 0, 0, NULL),
(49, 4, 200, NULL, NULL, 2, NULL, 0, 0, NULL),
(50, 4, 190, NULL, NULL, 7, NULL, 0, 0, NULL);

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
('39e40dahh2smggmpkpqmk5ut21', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303032353735392e3435333938363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223332376c68697234363333376b34303376677276386a36397267223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303036353533393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303036383830383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303036383739353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303036373935313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303036373838383b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223334643435623561323332643832303962366565353631303466373565626430223b733a33323a223465316231616530643132646666373833326332363237313430356265303739223b7d733a343a2268617368223b733a36353a2234653162316165306431326466663738333263323632373134303562653037392d3334643435623561323332643832303962366565353631303466373565626430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32373a7b733a33323a223231386331323030333163353063393732383131663030666637366135353136223b733a33323a223433326462653362343161353730656361363933616463323164343938326662223b733a33323a223066333065353739393730323236303237373461646434613966323436376565223b733a33323a226133613665643531323331363762383637363531316164666632333732663163223b733a33323a226264316665353732323965346439623838613730366366376461326331616631223b733a33323a226230313561663562333836393763663263336664333138613536356439633236223b733a33323a223663313834343030356639616635313563643564373532376463653939626336223b733a33323a226261383530656666666462653037363731393430303134653865643062393038223b733a33323a223633613531353165633438313166613463613336333333383835636565636433223b733a33323a226430333430346135613731363466633337623263376234353639323139303938223b733a33323a226533313638393236616535353962393963316234316534633333663335333137223b733a33323a223562623363633430653062616565333335666634386339653264626163316237223b733a33323a223239613532346633313834613666346162323665636635666136343461613137223b733a33323a223330326264366232613432323932663532653938646264313864363965666463223b733a33323a223838626665326363666663326136333732313838666461333138663233386235223b733a33323a223161666564623433363030323330373934323163373131343762623431656338223b733a33323a223233383761636238633461646237623836643865353131666438643539383139223b733a33323a226231376637653661663636626433336264366138663839303030613435636236223b733a33323a223464663765626464386162386339323038613933396634666533333332613631223b733a33323a223863643234376537346636623066636633316335323434643763333636623962223b733a33323a223531386530356164306166333062326537313032643732346363656339363066223b733a33323a223530646163363664666166333464336633656432393938383566633536623637223b733a33323a223065316565363566306166396435313566393139316563336264636464333536223b733a33323a226132396265666461636534326530343330393635383839663031336535643361223b733a33323a223038366337663334623664643666336131653739386566346264666661643932223b733a33323a223139356630363963306261383233663535346437653631396666623830336237223b733a33323a226431616338353264663633373963393330393661633832323334373139646466223b733a33323a223764643033366461643663626138393731663931366436633765643033343639223b733a33323a223735383337633962653265313335663134323438633062316432326462653034223b733a33323a223730626630316564643438336434386631636332373134303033393030333035223b733a33323a226338363565613966663931336634363766376133653962316662373537623864223b733a33323a226566303366663234373233356234656230626638383738393231643562386465223b733a33323a226436363639356263373361636230326238623361313239643061306364386433223b733a33323a223032333233336632343037376566316262313766316462343132336139623939223b733a33323a226262613039636530353064303739306235633462373864623066613232653838223b733a33323a223035383164653438636336336234386138626530613734386230393036363538223b733a33323a223564333531636262376261643032353035396664376234386335313336633563223b733a33323a226136666565343662306431346534376538636236303632376438356232343562223b733a33323a226266343338376635396465616632643861616565393239623838636165383730223b733a33323a223638616238323037393235393265653261326462373565326638353038653161223b733a33323a223531373831643638333630336538383066633236326135626433356132626339223b733a33323a223164663662396566363837633664363732623834666239383033616536653463223b733a33323a223737643835363833636537376466313838626239303264616166363964376539223b733a33323a223865376362653162663166393338613836373662326133346536306431363762223b733a33323a226666373233663637326463373239623732636566633230393730386435333965223b733a33323a226439373032336134376335363237363636313962633031343931613062346364223b733a33323a223735613663616632363364363635616633363239333265396634303830633534223b733a33323a223930643330363663326230303862363332383133376266396235366361303836223b733a33323a223433346131373535663438363039633535383333323261356234383732376562223b733a33323a226539643235613635383734313365326237383635353639633761393765636265223b733a33323a223866383932623138613765653666343131396661333263373936396233636163223b733a33323a223230363963633064386531376366313831303130313235396164396236316538223b733a33323a226237636366336133336239393138656533326233363863616438303434333132223b733a33323a223965316135623465326265373362656335393434653964333039626565306335223b7d733a343a2268617368223b733a36353a2239653161356234653262653733626563353934346539643330396265653063352d6237636366336133336239393138656533326233363863616438303434333132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a35333a7b733a33323a226466646162383034373465343833393762346435626535383136663330313539223b733a33323a226130643233373731313666393530393961623733393930626261666136313363223b733a33323a223231383638393433376533616462373764326662356331313331636662393531223b733a33323a223566323839653863346361313431393038613139386564636432353832326132223b733a33323a226432343063363337383762623431383937396231623737333831393131666462223b733a33323a226234373630646230343561333636393562383762616363366232396165393161223b733a33323a223530336563306237653733396635343365633839363635366639333566663237223b733a33323a223263356663326236363739666433666230316366626338616636366236616463223b733a33323a226531323939366539316134333832323564666338313936363730386562376362223b733a33323a226135383664393239336364653636626538333735336435323736663639366239223b733a33323a223330613562396333656361613664386138626332386366396466313366623535223b733a33323a223137613134663338326662366639393730306138396638376462653866643234223b733a33323a223333383465343036316661626265303432376333383765326631653637393539223b733a33323a223665623363386531633330326631326433366262383334353538306565396634223b733a33323a223834386165386461306665313664616131336336386234326135636662313537223b733a33323a226135303763366239383032373933373330376632326363656238363266626135223b733a33323a223532623834306633643937353534656363303430656639373333626435323434223b733a33323a226361303331326536656639623633633739646638343462343863373538656536223b733a33323a223333316264343930623931663666613630633939383533626430656632643262223b733a33323a223634336338346261373231326366373362393462373731643866663863653539223b733a33323a223836316139393363666361363763396464663935643561633461353561356637223b733a33323a223930366461366231336334326430333066393435333938333566613461396562223b733a33323a223939373361383437626361373231653831306138613763373436646661303539223b733a33323a223139313962616364376530613564646464613039666465376462326238346663223b733a33323a223539343235303532663434613038313731633035636166396564326439633563223b733a33323a226334353931383265313264363034333833336138383865353734386638383939223b733a33323a223762303335306464643437623466333165306134373661346361343832613432223b733a33323a226565306131363832663065653766366230626138366136313264333734316130223b733a33323a223136353039396561306131663232316332323666653661393034653231613264223b733a33323a226636613661636335303039616166646663303236303364666638356262666139223b733a33323a223062653132323037336233366634343661336239616364363963643264306566223b733a33323a223836656233353735303335356165656265303039386634666339346563313236223b733a33323a223239636634646233643862343864633630646536636137343963393138333231223b733a33323a223332626431613766396336643365376565386638653338623234353431353563223b733a33323a223239326666313630613933633965633238373137356138633036656632313438223b733a33323a226438333065386234373863396338666465353030616531336539313834646430223b733a33323a223037656565633963383131373861353964623135316263366333363532613339223b733a33323a226339306131393038613530313766313963363038383161626533393735333364223b733a33323a226465643064323534316534663766656531393864336363316137633333396464223b733a33323a226665393363346330313466306537353535313631383835346465643534663936223b733a33323a223734303737383539363539376234663463363035663761323534626634353936223b733a33323a223537636466663933346132363561383332333231656333636462313061633262223b733a33323a226432326531303365633365636434306435616638643264353465353464626135223b733a33323a223438616431303930373563323038386164633130633066363334373138333563223b733a33323a223632323463323233363330656534616332663637333233383862393332323866223b733a33323a226439383265646564313266323762323835383334613331383763643032616263223b733a33323a226362633930333932303032636464393163303635356337353630303635303866223b733a33323a226131386466613165343739303032613234343839373234343439613431306462223b733a33323a223461303438666232383662306464616535616631363233333738353264333639223b733a33323a223361613331626431633634313963373062346361396130643239653537303330223b733a33323a223665303233376231623839383065386465623735653163393135363530396333223b733a33323a223235306431623039656636653934363232356638303336663566666138393738223b733a33323a226238306263396536336234343330396439653162633662386235623233383966223b733a33323a223539363732653231623335316133333333386535323561613766653664303930223b733a33323a223931386130613162353463356264303438633266653134623833313339393464223b733a33323a223637346261623033333364353666356133356532313839376530386164363364223b733a33323a223037333962643839383834653161336239643832386638353930333038313765223b733a33323a223262623836633961646165626161626464373334353438393163306232653039223b733a33323a223165366339393161656365663836666331663030663861646162386531376434223b733a33323a223531306538336638666165343737393638323733613434353031303362383837223b733a33323a226236386436623830366531323162373730616231386138663138623166306265223b733a33323a223363323865363232306465626339343562363633316362656365303630616635223b733a33323a223162326266646234393332356136336465396238373365386363376331386333223b733a33323a223739366637373137656364643161616232626233353866656265363261353631223b733a33323a223364646633396130376338633433616635623737383965333832633363623362223b733a33323a226561633033386161623964376561653139616333393932643262356231383236223b733a33323a226137666664616264303231613265353739623238343961376162373338353034223b733a33323a223161383766636633373764623730313533373133656433356434623665656464223b733a33323a223937366331663730636639343739663462646536326565383431613866303663223b733a33323a223264666531356532366566306237663866313032366132333538643832326561223b733a33323a223231333334636562306135663138383231626265393437666264383164656637223b733a33323a223737333031306465646661313232383432343766646263333865336466396263223b733a33323a223639636234373431613662363265326439393234623764613432333737336238223b733a33323a223763653033306133336563623532336237383163326239623137633333306266223b733a33323a223833663465386565626535353636636339653234356561666461323834396365223b733a33323a226138623161343334386161336361643930313162623032373436336162656166223b733a33323a223431616262616132373733343134373936663830633438663531613738623661223b733a33323a226237653637656439663030326331323361626330616561393465643935363236223b733a33323a223630326133303164356635326537396531366134303434306238353836393933223b733a33323a223232663063353533336561636235663337623765393436643338343561396562223b733a33323a223965396564363938346234316666326164393761373538653834623039376636223b733a33323a226661346333343134346630396462663537643764386530373135393032353864223b733a33323a223036326165323234396635633337646230633166353439323331643637316333223b733a33323a226364346131356236633938633164656539653563636562393061623661323665223b733a33323a223631326539383539353632396361653362336330333432613764643430383235223b733a33323a223131303665353232346166326333363936363539643335393763666638343665223b733a33323a226563623439343934636332346138313965323834343037653731613261323765223b733a33323a223464323839353734366633323863616461383631363666306262366630636661223b733a33323a223738653561393030333562626431393963663636343530613033663037356165223b733a33323a226163613938356361616331326233636563343563393732386265323839343461223b733a33323a223265323837336237636334636462343737353462343365396664666335623364223b733a33323a223335643437353032386566323363356365663061366638643634386636326637223b733a33323a223733653265376266613835666339393465383263373334383137643563643762223b733a33323a223265666233613431386465376337396430666236333934396666303734326534223b733a33323a223632336166316538383035613939363135356238343637666437666438336632223b733a33323a223539313465366162346433323034663739326136363062376237383063653131223b733a33323a223531343862386564376364353438376432373634343663313435363836643162223b733a33323a226664386136376630306235393334336562393961336336373830623763616334223b733a33323a223830363538643465333639653364613935363437396661636138623164323735223b733a33323a223562646662623939316235336563363233333164643661396662656264653930223b733a33323a223062613561393864336436626134646635643938373539613465363335326164223b733a33323a223535353238323232326133633331306362653664306434396333396535663731223b733a33323a223230373033663463633163643030613261316137623734396337663132373165223b733a33323a223065363338623238303035386232393465333235653665323735386566663430223b733a33323a226564343238633235373835333131643635633031373938323335363038613533223b733a33323a223365373166313030613436646435353532303435613861343338386638396536223b7d733a343a2268617368223b733a36353a2233653731663130306134366464353535323034356138613433383866383965362d6564343238633235373835333131643635633031373938323335363038613533223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223138353035353533353131373161303732383030373437333335316633376563223b733a33323a226438373831316662333062376533626230373331386633623330383862303031223b733a33323a223865323738346338343833386630643436353963396533393235303034343930223b733a33323a223433346166663837623438356436366333666638623563666464353238373430223b733a33323a226461333261343639613966336237373735626361623563656566356430623164223b733a33323a223236333666333864303737313034316431313131626537616432373334653265223b733a33323a223134373132343365306566646137613534306238346464376230303933646430223b733a33323a223639666664383536656666353762346239396531326363366664363166313938223b733a33323a223266363238343237626434633130633237326664633238613566633864323034223b733a33323a226361343434373163363961383265646138303730333030643765636237356264223b733a33323a223131663361323131653633626634313535613535366366346138366465396663223b733a33323a223831346236643239363631333236633762313630643163366162663363363034223b733a33323a223039626665343164333139643262343462643233383737633235346439323938223b733a33323a226332393232366534663732343065303932316563353035343266386236646330223b733a33323a226265333762383166616239326235303436383337363237386634636466616564223b733a33323a223139333236363265346263346633376465363761383466343939653338393362223b733a33323a226130653131373434313065343265373138316137353234356531396338333533223b733a33323a223738343866383466393662646134316132393361303762646635313562323665223b733a33323a226531626535343139353631316538356364646562363837663533323763383062223b733a33323a223166323363653263656631646464643339626630343464643961646461356232223b7d733a343a2268617368223b733a36353a2231663233636532636566316464646433396266303434646439616464613562322d6531626535343139353631316538356364646562363837663533323763383062223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f766f636162756c617279757064617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a383a7b733a33323a223666343661646133393265633435663330396631343334663564396561313530223b733a33323a226466656164653737633831633366626662323731656635343530616366386130223b733a33323a223132656133623832326265646430393733633864663130333133646136626662223b733a33323a226562366439316430396433636335646561346366636530356439303536336363223b733a33323a223566666463386463626635353462613461643731323333666466383664326538223b733a33323a223634373361333731336161333732316266646134333764643062643536343937223b733a33323a226431393838393734383165343963393239646666353237636665623164323663223b733a33323a226338313366613663326434366339363939393734626432306234376363323063223b733a33323a226361353333396232616435616335623762653631303230326362356330313134223b733a33323a223435633464663439343264353763386161323466616261346637393938313162223b733a33323a223730336565323363626165373836326637303033303234363832346261363634223b733a33323a226430646138303136343964663233616432396633656535353662356663396466223b733a33323a223831313665363366393736643330623835643365363566356135653866353132223b733a33323a226331623237303736396665343333623964323037343365333937636362343466223b733a33323a223566343738313366366561373231306137393263336336373631333032363733223b733a33323a223238356436363933393038386131396133653432666461366632663333613437223b7d733a343a2268617368223b733a36353a2232383564363639333930383861313961336534326664613666326633336134372d3566343738313366366561373231306137393263336336373631333032363733223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1730025759),
('42cbfqsb60reu8rl9lqsh5nj20', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383933313836302e3433343533393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2265616273346c74356e6371316d33643869656732726c746d3164223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383937343239303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383937353033303b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223061613632666461646165303231376362633931343537633939646438313861223b733a33323a223038376530613161656630313331623664633636366330393930383235346237223b7d733a343a2268617368223b733a36353a2230383765306131616566303133316236646336363663303939303832353462372d3061613632666461646165303231376362633931343537633939646438313861223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223331613632303133343463326336306432373766623533303064303662383437223b733a33323a226533363065396663326134343531353066373563643965623231346134633665223b733a33323a223738656664613037396463646635306437353233633433633137663130616639223b733a33323a223362383138653037626464656139343939343537376632663965326536393433223b733a33323a223364343863613537663037396564373430613637656135653935326362666636223b733a33323a223766343962646637643134333538326161303437333139643235353463336136223b733a33323a223730363636343536663863363332383431353266633035633966303566323535223b733a33323a226138633963363834373139393334663531393036343339353862303935373064223b7d733a343a2268617368223b733a36353a2261386339633638343731393933346635313930363433393538623039353730642d3730363636343536663863363332383431353266633035633966303566323535223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728931860),
('5fj4tr8t2ans588q2mfcbhlhem', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383930383636302e3831393431353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c69627664323262376e35716166627031637232376f6f316269223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383934363938313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383935313033323b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223439643463363231613132643763343635366236363033336466393637613165223b733a33323a226463393964636563613163373063336637613237623830646138643463633539223b7d733a343a2268617368223b733a36353a2264633939646365636131633730633366376132376238306461386434636335392d3439643463363231613132643763343635366236363033336466393637613165223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223535663038616633333639343163616637653561313736663931313532376363223b733a33323a223635626433323033323131326533303431366632323737636432316130356238223b733a33323a223364643266363063653766383563393539616266366566643865666364613063223b733a33323a226262356232386531396261343633306331313730363337396335376239343862223b733a33323a226639653138343766306339643030653430663735616337646235353064616564223b733a33323a223266396162333261643438303833363730313737653937346132643239643536223b733a33323a226631323737633661353733333230313636653166643632626566353339363039223b733a33323a223764353230373566666632303232346439363334383262643832343838636263223b733a33323a226161396664303761383835313361626263316363646439356530656235366462223b733a33323a226530633738613039393462383636386337616537653336396639366139346131223b733a33323a226432376464666238653438373961326233373739306532666164623236643730223b733a33323a223030393039613233363237623032653437373037373934353432613430626161223b733a33323a223532646362373535663136386631646166653163353333633031396539326531223b733a33323a226539316236373865656138373330623666623963333236313136623231323262223b733a33323a223338323136393230666261303435346637306534353965343930366266343239223b733a33323a223333303563353336323663346336373730396131663035323066656264636138223b733a33323a226434376130613366616230363538373039663564303463303236383963326132223b733a33323a223035326132393964356166313764376665656534616564636363646166383532223b733a33323a223630346337383761383165656332376131663039623138663135646162323363223b733a33323a223930323030626132353135616339306533366132353036626336316462366536223b733a33323a223465383630623930616238316331376139373861353137333738323366616338223b733a33323a223232333564363166376135366565653338663737376161346137313830393462223b733a33323a223638633637313430383337333038653932366362633331383832613238383736223b733a33323a226236333537316134636366316434396430313634356133643764313339623666223b733a33323a226338376235656232393539306363303061373336393434643230323563313432223b733a33323a226530323866326664316166656634373761323732636336346638313934313130223b733a33323a223530623431633661373338333630646339356337366339383237376561646238223b733a33323a226364363061643533396431346664623932613636633262616437623833616433223b733a33323a226434376633613638653133636634653438636265373931376461636432373133223b733a33323a223735386139396536636161363936653961333965326339613361303637613737223b733a33323a226332376664323637363930343537393930353038326536663337346536386534223b733a33323a223861303934346337333039393432306665633562656233306362346131393562223b733a33323a223562613163396266323261383564393763386531303738613661373235623231223b733a33323a223137336163343236303935303363653962636431663665366162613837386562223b733a33323a223961623837656637613066633265393638363632326335393365333432643034223b733a33323a223235666132623566313135396334636630393739396462336534353238366135223b733a33323a226165646433353831663739383733336561646333653263333663633461323235223b733a33323a226566623237656565636164373833343733633931623631366234303234323935223b733a33323a223634343632653833396233636162386638653262356236346236306238343432223b733a33323a223537336361633761383138376264313835646639643233356534623836343136223b7d733a343a2268617368223b733a36353a2235373363616337613831383762643138356466396432333565346238363431362d3634343632653833396233636162386638653262356236346236306238343432223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728908660),
('618d9ptn087dg8n1g3iol8kvph', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733303032323332322e3136373239313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22363138643970746e3038376467386e316733696f6c386b767068223b7d7d, 1730022330),
('6topaq9q1qh69djvjcapqej4b6', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383930323838332e3437393037393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226964636e316333386e73646b303630766c647162373761386a67223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383934353038343b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226535393864666539303063353061373338623436643662633163363861613939223b733a33323a223635333461623264626230663364643133356230366330646530323836666132223b7d733a343a2268617368223b733a36353a2236353334616232646262306633646431333562303663306465303238366661322d6535393864666539303063353061373338623436643662633163363861613939223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728902883),
('7gl886ui5kngl1svm496immd58', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732373730393639352e3137313739313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2237676c3838367569356b6e676c3173766d343936696d6d643538223b7d7d, 1727709702),
('bubd8hla7kaa0qis3sq801h28o', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383333313731362e323136353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22713373706130626770376a75766d6339647532746139726a756e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383337343533313b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223665626434323136333835323362623837383165333136636163386662376230223b733a33323a226233663133336132363239643661613031656236633634613161613437313365223b7d733a343a2268617368223b733a36353a2262336631333361323632396436616130316562366336346131616134373133652d3665626434323136333835323362623837383165333136636163386662376230223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728331716),
('ehfv54r4q0as0ranf86uj2er6i', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383930323934392e3036333039333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226e7464766f35726f7371716c3164356f38677470736272396e68223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383934353132383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383934363132303b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226336623139646433656265653431613938346231643439353936336561313365223b733a33323a226463663866306461643165636264613466306337333461343336646164646131223b7d733a343a2268617368223b733a36353a2264636638663064616431656362646134663063373334613433366461646461312d6336623139646433656265653431613938346231643439353936336561313365223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223466336434643237633434616163633932363334376562363637336432333166223b733a33323a223062383833656461373461653236666463336563663466636234316132323034223b733a33323a223730393831373335303562323362373139313562366230386233396664653064223b733a33323a223137386262353432643032336433383435313364393363323036376538386565223b7d733a343a2268617368223b733a36353a2231373862623534326430323364333834353133643933633230363765383865652d3730393831373335303562323362373139313562366230386233396664653064223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728902949);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('i0v1ti39vk71ov3mvrpe549nuc', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383839393339322e3631353832363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2235713230726e3676376262733739346838317435356330767067223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383933333431313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383934323537353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383933343539333b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223031396461653761363238356237623931333266386532616637323737643137223b733a33323a226238336362383232366662313732633166356337616666643631303130386462223b7d733a343a2268617368223b733a36353a2262383363623832323666623137326331663563376166666436313031303864622d3031396461653761363238356237623931333266386532616637323737643137223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223035323064343964386639383137303335396538306635343366323538386261223b733a33323a226334376630626537643236336566333564353130366162386235376563636562223b733a33323a223137366166356434383530376336616635656565383266646138366630653732223b733a33323a223037386430383239353933343239616131306633353430303764666332383263223b733a33323a223033346234623263633536396237646563383330623738633663623135316430223b733a33323a226437363062643537366334376361356335643934353639383135663534656463223b733a33323a223964323135363731366135363936366139643335343866323761633336653661223b733a33323a223566336263636532313636363835613361323361383263366532653265653936223b733a33323a226434626133356564303937643638653138393563633461636536366666353366223b733a33323a226637643336373031616133616561393334396262313039393866646237343238223b733a33323a223362623935616636373635383131666661303066353961353932346330646530223b733a33323a223533633937306337623930643034643933636466666366643431373738323737223b733a33323a223633306230356330633464663134303933393764643863373064326261326430223b733a33323a223633646532383930376261636231383036376130386435646132303434383737223b733a33323a226634626538326531613331353535343932613338363239343065636264323863223b733a33323a223734666134373766303862356230633036383665343131336137643064613039223b733a33323a223461396565643234303064636262376465653865663739316636366265306565223b733a33323a223738613239653031323465346562613063306632666334333239343732343130223b733a33323a226366373263376264303332316533393635623364613834616566663964313535223b733a33323a223663353232623537346563383638383435656330333764303633303061373637223b733a33323a226239306162633437653461643865353830333866373334343434646634383836223b733a33323a223562626130643535383731636232333936623539663061666333326238396238223b733a33323a223838303438336239623161316234346561313139393765666162396230336664223b733a33323a226534383866373663336263326635343636613861663137393662333162623061223b733a33323a226439343666333264363739323135653434616331376662303936393164326533223b733a33323a226230386166303366313037623134623866333232353363623037373332303761223b733a33323a223437303164646138656233633766633737653133363262316336363532623464223b733a33323a223632656132636131363936343634306564626338306333366361316365353732223b733a33323a223834353664666238653033643834323863613761626231623838636165613562223b733a33323a223336396562353965336630366566636238376232313836393930633436383037223b733a33323a223239623664323835333437653665613935386135343864373832623031323931223b733a33323a223063356466633739393464636562323538646164323766653738386135386531223b733a33323a226433613738316537663136646139643530303263333530396531363866333330223b733a33323a223665346464373263626633636565656432656333383536323461626135383731223b733a33323a223236323534343966353939633365613661353065636230653731373063323331223b733a33323a223832383861623132316464643238626332626630353236303638643135326634223b733a33323a223835663565353839353338626462366436633238306639373132346562366232223b733a33323a223634313734313336653032306536386232623835346135303135633833633132223b733a33323a223261313737663032336437323835336565663339666166653564623630306339223b733a33323a226165643739366665356231666166373466316636386334363732336638313865223b7d733a343a2268617368223b733a36353a2261656437393666653562316661663734663166363863343637323366383138652d3261313737663032336437323835336565663339666166653564623630306339223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223066383866653731646439363738323231303533343133316164343564313034223b733a33323a226563323535353230656131346639363435346564663535623661376466336166223b7d733a343a2268617368223b733a36353a2265633235353532306561313466393634353465646635356236613764663361662d3066383866653731646439363738323231303533343133316164343564313034223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728899392),
('i7oqpk3i09gl1g3b55a1k99qdv', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383831313937382e3538333136323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267713132746a39626275626c68313968306d6332653475373563223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732383835353033343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313732383835353137383b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226533343237653762313164383465363163386333323030333432626563333733223b733a33323a223030313965653836376438643234303934303066346665396230333638346265223b7d733a343a2268617368223b733a36353a2230303139656538363764386432343039343030663466653962303336383462652d6533343237653762313164383465363163386333323030333432626563333733223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223836633530653862346432623136333137633339656262313539393939393238223b733a33323a223332623134666430656330303865663864643461346234303737313938393661223b733a33323a226639333764633830613366326430373238316631643837373633666134663232223b733a33323a226662316265383965313732326332373733663736353335383661636330306135223b733a33323a226433313064393661373066336165303865383931376137333932613336303338223b733a33323a223032336362323031373762353131316430393166613364386364393762623130223b733a33323a223864646666323462333261646464303264396431646430326631386563623335223b733a33323a223462353565333634616439643334383633323337663231356263303233633334223b7d733a343a2268617368223b733a36353a2234623535653336346164396433343836333233376632313562633032336333342d3864646666323462333261646464303264396431646430326631386563623335223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728811978),
('jkh8ul4gfemjqrvul17ejk20g9', 0x5f5f4c616d696e61737c613a383a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732393937323038332e3331313532343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22363464663070766635303274323565366f336d6c6f713539646d223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303031323039303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733303031353136313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303031353138323b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303031343737313b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303031353138323b7d733a36353a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733303031343738303b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223837643834643163613839313865643636336538383536623637663832653739223b733a33323a223930323530623066333564366536623433313330626364643365633665656239223b7d733a343a2268617368223b733a36353a2239303235306230663335643665366234333133306263646433656336656562392d3837643834643163613839313865643636336538383536623637663832653739223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a226637663231656564653565303532313164663730366337333434616139383134223b733a33323a226335326339613037623235306139666161613630333765303630313365333938223b733a33323a226130633038323033666134656461353033343564313830613465343432303631223b733a33323a226233656237363963343433343839346264383235356231323532336264633739223b733a33323a223262373766613534336463376535383765323636663037373139316665326438223b733a33323a223963313837346435613131363739343938343633623563616464393861343061223b733a33323a223836353533616534393230626130313966616332383230353134316232343762223b733a33323a223765643132353162666562666435363130373265323165346664363666393161223b733a33323a223261396130666334313565373031346437303634366131613963656434663863223b733a33323a223464656264353661376665386364663933363134343537356265623264383339223b733a33323a223233363337626262343339663334656465363633343163343830646636313936223b733a33323a226431643761343134326339356335313738663439636231346530316661316566223b733a33323a223763663562366533323662323638306466623137306339376434373135653839223b733a33323a226135616234633863653439326666623930376232616165386162346265623766223b7d733a343a2268617368223b733a36353a2261356162346338636534393266666239303762326161653861623462656237662d3763663562366533323662323638306466623137306339376434373135653839223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a223738653463326235353063346339636662333633323466336632363964613831223b733a33323a223432656232636561373835626566646533313464383462333039636162633835223b733a33323a226564643736393232313732643562386461363834613933303334376565663163223b733a33323a226433653062386539366534623563636661383037313831663234643362646637223b733a33323a223539373230633934663937616533383266396263393464333165366131393031223b733a33323a223465666261313537316237653331623638336662646431303161346236666163223b733a33323a223332386538613462363863333963613466303564356135376434393632316434223b733a33323a223363303038313561343764366633353132383439346165386265373838356139223b733a33323a223839346233373139613734333966356434613232633262373766663133633561223b733a33323a226633343839643232646265356236353466386164393536373661313664643163223b733a33323a226364353764633532373034373763636263363764366536623835326131646363223b733a33323a226366646131646263376332613233393461643863303763323934663661626631223b733a33323a226333643863303863653366343134386231366561356361393934636134396465223b733a33323a226366356666636436353665353166663663393762663461303135343838383837223b733a33323a226332393665356564383337393636616439656132393564653736353863336263223b733a33323a223162336361383134646436396565626638393963363839383235353139613666223b733a33323a226166316562623136373534653339343962376362353234326135366239353839223b733a33323a223134383362373533373136356565373566356532346565633031333930383131223b733a33323a223061613161346335626231396264356162323333326437626437636666633061223b733a33323a226561373237383563613564636261323731643234383635613164313038353138223b733a33323a226263623031383666653230643363386637326531663036353962343539353461223b733a33323a223431656364666563343232376533326137643865653232613837313537636335223b733a33323a223263616531393438626139323234336434643662646432653031353637353965223b733a33323a226539626264663033353365363638653237343333623939396234613939386366223b7d733a343a2268617368223b733a36353a2265396262646630333533653636386532373433336239393962346139393863662d3263616531393438626139323234336434643662646432653031353637353965223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223438353630383130636336646537306165646262313832623438393364313064223b733a33323a223365663138656438636138643230653164356435666233353139353931323562223b733a33323a223365373963653033666630356562643230316332333935646562633338666265223b733a33323a223530373430616264333666316663373932663039653333373633356664323861223b733a33323a226362643532306335643131623536393639623764616430356561393261343762223b733a33323a223164626561623232353466616566313066623232353761383438646262353962223b733a33323a223766373263353736386664313433326436646335613763353132393164633662223b733a33323a226363343064663365343035303866626632643636323762646237323862346365223b733a33323a223035626261653530356433623834343965663865383038353233343464373061223b733a33323a226462353438656531326133613936386339313031366366376131633962333231223b7d733a343a2268617368223b733a36353a2264623534386565313261336139363863393130313663663761316339623332312d3035626261653530356433623834343965663865383038353233343464373061223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223937366233636335356533363438626131613231356262363431353833316236223b733a33323a223663653061613138373534313836306633396631613138626532616666333161223b733a33323a226438613131633862323032633438666535636465666130383565653230623137223b733a33323a223838616563313130353338326339333766623731663263313462626331356164223b733a33323a223136343763326234336162633338386236646333616531393465323535373464223b733a33323a223336646431643934313838383238393230383034353837623337356133336461223b733a33323a226137663065636662303435656438646639396230336239656366636239343762223b733a33323a223339636436376230663433366663653365666261346536313530376234316465223b733a33323a226665386337623838613930346233343838653362663163303566356130313332223b733a33323a223161336264386461316338303133336664316666353161313835653437626132223b733a33323a226335613762323964666134383830376337313936393738326135646565633866223b733a33323a226634336166313732343236313439623366386432386662626535303633633939223b733a33323a223039656236633032343335363630303063656532386464633937376234613337223b733a33323a223962356238646333663231346334333366303431663732333664333831636163223b733a33323a223365663439633438376564343132643233623936623432313665656139316535223b733a33323a223135366235306331653935643233333165646234346666376363636461326161223b733a33323a223333386262353234396237393162623232393065353963656534666362663739223b733a33323a223533633535366132313937656262666435346635646639666531636432343935223b7d733a343a2268617368223b733a36353a2235336335353661323139376562626664353466356466396665316364323439352d3333386262353234396237393162623232393065353963656534666362663739223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465726576696577696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226639343733323932643031623564303632663463623864383632333637653866223b733a33323a223231313935326637353039363435653734333432313236623437613137313331223b733a33323a226562326633346330313861626665633833323338376535333137613966353163223b733a33323a223031663235383637336436393338666262643739643233643862646464353066223b733a33323a223134633636633433393738653063323262336562663239663739303335666331223b733a33323a223331636561383234396564643134363239616236343936356665633537653837223b7d733a343a2268617368223b733a36353a2233316365613832343965646431343632396162363439363566656335376538372d3134633636633433393738653063323262336562663239663739303335666331223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1729972083),
('kub2p9hhlg7fm1vd9temqndpmk', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732373730393732352e3332373938373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c70616c6f736736326b6630396574727430323174356932626c223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732373735323931343b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223036383364396132343961613061636437353865356365633565346235633262223b733a33323a223365366232633966383133316233656236633162346664383761326233363833223b7d733a343a2268617368223b733a36353a2233653662326339663831333162336562366331623466643837613262333638332d3036383364396132343961613061636437353865356365633565346235633262223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1727709725),
('rev7vrgtmkap87tu825t20njqp', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732383938323935392e3136363136373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746c6c6c6d736c7575336f6665313534686f3274316575677336223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393032353935373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393032353939313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732393032353939323b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223939333634356139333134313835623963326666656435633339373462616235223b733a33323a226630396334376436363439626166643739646338316335323061663936336663223b733a33323a223332616130373439386463623431376435363239326431393966643136623135223b733a33323a223831323965363834363465643630383462663966346164313839366530626665223b7d733a343a2268617368223b733a36353a2238313239653638343634656436303834626639663461643138393665306266652d3332616130373439386463623431376435363239326431393966643136623135223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226662333865373864373331383338663237353335316363616639376337356430223b733a33323a223134653261323066373331613434303338346436636634633461306664303462223b7d733a343a2268617368223b733a36353a2231346532613230663733316134343033383464366366346334613066643034622d6662333865373864373331383338663237353335316363616639376337356430223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226430363736636163376436656666313039613938636232393536663661343132223b733a33323a226265353533303037313966353164626534643439366431303736303665336264223b7d733a343a2268617368223b733a36353a2262653535333030373139663531646265346434393664313037363036653362642d6430363736636163376436656666313039613938636232393536663661343132223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1728982959),
('saia8n11m2r64v8p46j89m2bfc', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313732373638343137342e3831323537383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2261687335357533386f6f386a3162727076736c7536646f6e3376223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313732373732373132313b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226262346633666131613832616431353834626137616363643662386566643038223b733a33323a226561373762653438323762323339313466323839336639363530633835383536223b7d733a343a2268617368223b733a36353a2265613737626534383237623233393134663238393366393635306338353835362d6262346633666131613832616431353834626137616363643662386566643038223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1727684174),
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
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"Installation title\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"Europe\\/Paris\"'),
('use_htmlpurifier', '\"1\"'),
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
(1, 'nathan.benais@gmail.com', 'Nathan', '2024-09-30 08:12:01', '2024-09-30 08:12:01', '$2y$10$so00bq1G0LpaahlPaJQhzubMhQ0cZIOKy25tkV3Qaz.9sK0c8cmwW', 'global_admin', 1);

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
('csv_import_automap_check_names_alone', 1, 'true'),
('csv_import_delimiter', 1, '\",\"'),
('csv_import_enclosure', 1, '\"\\\"\"'),
('csv_import_global_language', 1, '\"\"'),
('csv_import_identifier_property', 1, '\"\"'),
('csv_import_multivalue_separator', 1, '\",\"'),
('csv_import_rows_by_batch', 1, '20');

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
(1, 1, 188, NULL, NULL, 'literal', '', 'TechMobility Inc', NULL, 1),
(2, 1, 200, NULL, NULL, 'literal', '', 'Startup / Entreprise technologique', NULL, 1),
(3, 1, 185, NULL, NULL, 'literal', '', '25/09/2024 20:43:48', NULL, 1),
(4, 1, 187, NULL, NULL, 'literal', '', 'Accès aux données pour développer des systèmes de gestion de flotte électrique.', NULL, 1),
(5, 1, 189, NULL, NULL, 'literal', '', 'Oui, collaboration avec des fournisseurs d\'énergie et des collectivités locales.', NULL, 1),
(6, 1, 186, NULL, NULL, 'literal', '', 'Encourager l\'utilisation de véhicules partagés ou électriques', NULL, 1),
(7, 1, 191, NULL, NULL, 'literal', '', 'Simplifier les réglementations pour favoriser l\'innovation.', NULL, 1),
(8, 1, 192, NULL, NULL, 'literal', '', 'Oui, développement d\'une plateforme de gestion de flotte électrique pour entreprises.', NULL, 1),
(9, 1, 193, NULL, NULL, 'literal', '', 'Systèmes d\'intelligence artificielle pour l\'optimisation des trajets.', NULL, 1),
(10, 1, 195, NULL, NULL, 'literal', '', 'Oui', NULL, 1),
(11, 1, 194, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(12, 1, 198, NULL, NULL, 'literal', '', 'test@gmail.com', NULL, 1),
(13, 1, 197, NULL, NULL, 'literal', '', 'Joe', NULL, 1),
(14, 1, 196, NULL, NULL, 'literal', '', 'Doe', NULL, 1),
(15, 1, 199, NULL, NULL, 'literal', '', '2 Rue de la Liberté, 93200 Saint-Denis', NULL, 1),
(16, 2, 188, NULL, NULL, 'literal', '', 'safe dispose', NULL, 1),
(17, 2, 200, NULL, NULL, 'literal', '', 'Entreprise de transport', NULL, 1),
(18, 2, 185, NULL, NULL, 'literal', '', '09/10/2024 16:06:07', NULL, 1),
(19, 2, 187, NULL, NULL, 'literal', '', 'Créer un dépôt sécurisé pour les déchets toxiques', NULL, 1),
(20, 2, 189, NULL, NULL, 'literal', '', 'Partenariats avec des municipalités : Nous collaborons avec des villes pour identifier les défis locaux en matière de mobilité et développer des solutions adaptées, comme l\'amélioration des infrastructures et l\'optimisation des services de transport en commun.', NULL, 1),
(21, 2, 186, NULL, NULL, 'literal', '', 'Réduire les émissions de carbone', NULL, 1),
(22, 2, 191, NULL, NULL, 'literal', '', 'Collaboration : Travailler avec des partenaires publics et privés pour développer des infrastructures adaptées et créer un écosystème favorable à la mobilité durable.', NULL, 1),
(23, 2, 192, NULL, NULL, 'literal', '', 'Partenariats avec des municipalités : Nous collaborons avec des villes pour identifier les défis locaux en matière de mobilité et développer des solutions adaptées, comme l\'amélioration des infrastructures et l\'optimisation des services de transport en commun.', NULL, 1),
(24, 2, 193, NULL, NULL, 'literal', '', 'Mobilité intelligente : Intégrer des systèmes de transport intelligents (ITS) qui utilisent des capteurs, des données en temps réel et des algorithmes d\'intelligence artificielle pour optimiser les flux de trafic et améliorer l\'expérience des utilisateurs.', NULL, 1),
(25, 2, 195, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(26, 2, 194, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(27, 2, 198, NULL, NULL, 'literal', '', 'imane0037@gmail.com', NULL, 1),
(28, 2, 197, NULL, NULL, 'literal', '', 'imane', NULL, 1),
(29, 2, 196, NULL, NULL, 'literal', '', 'el rhazi', NULL, 1),
(30, 2, 199, NULL, NULL, 'literal', '', '4 avenue Michel Debré, résidence Arpej', NULL, 1),
(31, 3, 188, NULL, NULL, 'literal', '', 'Mobilité', NULL, 1),
(32, 3, 200, NULL, NULL, 'literal', '', 'Entreprise de transport', NULL, 1),
(33, 3, 185, NULL, NULL, 'literal', '', '13/10/2024 20:55:32', NULL, 1),
(34, 3, 187, NULL, NULL, 'literal', '', 'Réduire les émissions de carbone', NULL, 1),
(35, 3, 186, NULL, NULL, 'literal', '', 'Réduire les émissions de carbone', NULL, 1),
(36, 3, 189, NULL, NULL, 'literal', '', 'Non', NULL, 1),
(37, 3, 190, NULL, NULL, 'literal', '', 'Manque de données pour optimiser les flux', NULL, 1),
(38, 3, 191, NULL, NULL, 'literal', '', 'Approfondir les recherches', NULL, 1),
(39, 3, 192, NULL, NULL, 'literal', '', 'Non', NULL, 1),
(40, 3, 193, NULL, NULL, 'literal', '', 'Réduire l’utilisation du Carbon', NULL, 1),
(41, 3, 195, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(42, 3, 194, NULL, NULL, 'literal', '', 'non', NULL, 1),
(43, 3, 198, NULL, NULL, 'literal', '', 'melissaorb02@gmail.com', NULL, 1),
(44, 3, 197, NULL, NULL, 'literal', '', 'Melissa', NULL, 1),
(45, 3, 196, NULL, NULL, 'literal', '', 'Ourabah', NULL, 1),
(46, 3, 199, NULL, NULL, 'literal', '', 'Noisy le grand', NULL, 1),
(47, 4, 188, NULL, NULL, 'literal', '', 'Moussaoui', NULL, 1),
(48, 4, 200, NULL, NULL, 'literal', '', 'Entreprise de transport', NULL, 1),
(49, 4, 185, NULL, NULL, 'literal', '', '13/10/2024 22:51:15', NULL, 1),
(50, 4, 187, NULL, NULL, 'literal', '', 'Développement d\'infrastructures de recharge pour véhicules électriques', NULL, 1),
(51, 4, 186, NULL, NULL, 'literal', '', 'Réduire les émissions de carbone', NULL, 1),
(52, 4, 189, NULL, NULL, 'literal', '', 'oui, Nous collaborons avec des collectivités locales pour la mise en place de zones de recharge électrique et avec des entreprises technologiques pour intégrer des systèmes de gestion de données de transport en temps réel.', NULL, 1),
(53, 4, 190, NULL, NULL, 'literal', '', 'Accès limité aux infrastructures (pistes cyclables, bornes de recharge)', NULL, 1),
(54, 4, 191, NULL, NULL, 'literal', '', 'Travailler avec des décideurs politiques pour accélérer la mise en place d\'infrastructures adaptées', NULL, 1),
(55, 4, 192, NULL, NULL, 'literal', '', 'oui, nous avons introduit des bus électriques dans certaines zones urbaines, équipé nos véhicules d’un système de suivi en temps réel pour optimiser les trajets et mis en place un service de covoiturage pour les trajets domicile-travail en collaboration avec des entreprises locales.', NULL, 1),
(56, 4, 193, NULL, NULL, 'literal', '', 'Nous souhaitons développer des partenariats avec des startups spécialisées dans les technologies de recharge rapide pour les véhicules électriques et intégrer l\'intelligence artificielle pour mieux prévoir les flux de passagers et adapter l’offre de transport en conséquence.\n', NULL, 1),
(57, 4, 195, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(58, 4, 194, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(59, 4, 198, NULL, NULL, 'literal', '', 'moussaoui.rania755@gmail.com\n\n', NULL, 1),
(60, 4, 197, NULL, NULL, 'literal', '', 'Rania', NULL, 1),
(61, 4, 196, NULL, NULL, 'literal', '', 'Moussaoui', NULL, 1),
(62, 4, 199, NULL, NULL, 'literal', '', '17 Rue Vincent Compoint', NULL, 1),
(63, 5, 188, NULL, NULL, 'literal', '', 'Univeristé', NULL, 1),
(64, 5, 200, NULL, NULL, 'literal', '', 'Institut de recherche / Université', NULL, 1),
(65, 5, 185, NULL, NULL, 'literal', '', '14/10/2024 08:12:52', NULL, 1),
(66, 5, 187, NULL, NULL, 'literal', '', 'Promotion des plateformes de covoiturage et de partage de véhicules électriques.', NULL, 1),
(67, 5, 186, NULL, NULL, 'literal', '', 'Encourager l\'utilisation de véhicules partagés ou électriques', NULL, 1),
(68, 5, 189, NULL, NULL, 'literal', '', 'Non', NULL, 1),
(69, 5, 190, NULL, NULL, 'literal', '', 'Financement insuffisant', NULL, 1),
(70, 5, 191, NULL, NULL, 'literal', '', 'Collaborer avec le secteur privé et la société civile', NULL, 1),
(71, 5, 192, NULL, NULL, 'literal', '', 'Non', NULL, 1),
(72, 5, 193, NULL, NULL, 'literal', '', 'Accélérer le développement et l’intégration de véhicules autonomes 100 % électriques, avec des infrastructures adaptées (bornes de recharge, systèmes de contrôle).', NULL, 1),
(73, 5, 195, NULL, NULL, 'literal', '', 'Oui', NULL, 1),
(74, 5, 194, NULL, NULL, 'literal', '', 'Oui', NULL, 1),
(75, 5, 198, NULL, NULL, 'literal', '', 'noureddineaitkhouya@gmail.com', NULL, 1),
(76, 5, 197, NULL, NULL, 'literal', '', 'Noureddine ', NULL, 1),
(77, 5, 196, NULL, NULL, 'literal', '', 'Ait khouya', NULL, 1),
(78, 5, 199, NULL, NULL, 'literal', '', 'Ansieres sur seine', NULL, 1),
(79, 6, 188, NULL, NULL, 'literal', '', 'Paris 8', NULL, 1),
(80, 6, 200, NULL, NULL, 'literal', '', 'Citoyen / Usager', NULL, 1),
(81, 6, 185, NULL, NULL, 'literal', '', '14/10/2024 08:34:08', NULL, 1),
(82, 6, 187, NULL, NULL, 'literal', '', 'Les solutions d’optimisation de parcours, basées sur les données en temps réel (trafic, retards), aident les usagers à gagner du temps et à choisir les meilleurs moyens de transport', NULL, 1),
(83, 6, 186, NULL, NULL, 'literal', '', 'Améliorer l\'efficacité des transports publics', NULL, 1),
(84, 6, 189, NULL, NULL, 'literal', '', 'non', NULL, 1),
(85, 6, 190, NULL, NULL, 'literal', '', 'Financement insuffisant', NULL, 1),
(86, 6, 191, NULL, NULL, 'literal', '', 'Améliorer la sécurité et le confort', NULL, 1),
(87, 6, 192, NULL, NULL, 'literal', '', 'non', NULL, 1),
(88, 6, 193, NULL, NULL, 'literal', '', 'Développer et intégrer des véhicules autonomes (bus, voitures, taxis) dans les réseaux de transport urbain pour améliorer la fluidité du trafic, réduire les accidents et offrir des services de transport 24/7. Les véhicules autonomes peuvent être utilisés à la fois pour le transport public et pour des services de livraison, optimisant ainsi les trajets et réduisant les émissions de carbone.', NULL, 1),
(89, 6, 195, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(90, 6, 194, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(91, 6, 198, NULL, NULL, 'literal', '', 'oumaimaelelfazazi01@gmail.com', NULL, 1),
(92, 6, 197, NULL, NULL, 'literal', '', 'oumaima', NULL, 1),
(93, 6, 196, NULL, NULL, 'literal', '', 'el elfazazi', NULL, 1),
(94, 7, 188, NULL, NULL, 'literal', '', 'R10 LOCATION', NULL, 1),
(95, 7, 200, NULL, NULL, 'literal', '', 'Collectivité locale', NULL, 1),
(96, 7, 185, NULL, NULL, 'literal', '', '12/10/2024 15:49:06', NULL, 1),
(97, 7, 187, NULL, NULL, 'literal', '', 'LE FINANCEMENT', NULL, 1),
(98, 7, 186, NULL, NULL, 'literal', '', 'Améliorer l\'efficacité des transports publics', NULL, 1),
(99, 7, 189, NULL, NULL, 'literal', '', 'non', NULL, 1),
(100, 7, 190, NULL, NULL, 'literal', '', 'Financement insuffisant', NULL, 1),
(101, 7, 191, NULL, NULL, 'literal', '', 'acquisitions de matériel, équipement et travaux', NULL, 1),
(102, 7, 192, NULL, NULL, 'literal', '', 'non', NULL, 1),
(103, 7, 193, NULL, NULL, 'literal', '', 'Création d\'un site internet', NULL, 1),
(104, 7, 195, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(105, 7, 194, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(106, 7, 198, NULL, NULL, 'literal', '', 'massidireddy@gmail.com', NULL, 1),
(107, 7, 197, NULL, NULL, 'literal', '', 'Reddy', NULL, 1),
(108, 7, 196, NULL, NULL, 'literal', '', 'MASSIDI SEMI ', NULL, 1),
(109, 7, 199, NULL, NULL, 'literal', '', 'Alfortville 94140, 5 sente de villiers', NULL, 1),
(110, 8, 188, NULL, NULL, 'literal', '', 'mokrani islam', NULL, 1),
(111, 8, 200, NULL, NULL, 'literal', '', 'Fournisseur d\'énergie', NULL, 1),
(112, 8, 185, NULL, NULL, 'literal', '', '13/10/2024 17:06:21', NULL, 1),
(113, 8, 187, NULL, NULL, 'literal', '', 'favoriser l\'écologie', NULL, 1),
(114, 8, 186, NULL, NULL, 'literal', '', 'Réduire les émissions de carbone', NULL, 1),
(115, 8, 189, NULL, NULL, 'literal', '', 'non', NULL, 1),
(116, 8, 190, NULL, NULL, 'literal', '', 'Financement insuffisant', NULL, 1),
(117, 8, 191, NULL, NULL, 'literal', '', 'trouver des partenariat', NULL, 1),
(118, 8, 192, NULL, NULL, 'literal', '', 'non', NULL, 1),
(119, 8, 193, NULL, NULL, 'literal', '', 'des technologies de ai', NULL, 1),
(120, 8, 195, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(121, 8, 194, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(122, 8, 198, NULL, NULL, 'literal', '', 'mokraniislam998@gmail.com', NULL, 1),
(123, 8, 197, NULL, NULL, 'literal', '', 'islam ', NULL, 1),
(124, 8, 196, NULL, NULL, 'literal', '', 'mokrani', NULL, 1),
(125, 8, 199, NULL, NULL, 'literal', '', '75002', NULL, 1),
(126, 9, 188, NULL, NULL, 'literal', '', 'Énergies Futures', NULL, 1),
(127, 9, 200, NULL, NULL, 'literal', '', 'Collectivité locale', NULL, 1),
(128, 9, 185, NULL, NULL, 'literal', '', '01/10/2024 23:37:54', NULL, 1),
(129, 9, 187, NULL, NULL, 'literal', '', 'Accès à des subventions pour financer des infrastructures de recharge pour vélos et voitures électriques.', NULL, 1),
(130, 9, 186, NULL, NULL, 'literal', '', 'Développer des infrastructures de mobilité douce (pistes cyclables, trottoirs)', NULL, 1),
(131, 9, 189, NULL, NULL, 'literal', '', 'oui, Nous travaillons avec des collectivités locales pour installer des bornes de recharge dans les zones rurales et avec des entreprises de transport pour alimenter leur flotte électrique.', NULL, 1),
(132, 9, 190, NULL, NULL, 'literal', '', 'Manque de données pour optimiser les flux', NULL, 1),
(133, 9, 191, NULL, NULL, 'literal', '', 'Rechercher des investisseurs privés pour financer des projets d\'infrastructure.', NULL, 1),
(134, 9, 192, NULL, NULL, 'literal', '', 'Nous avons déployé un réseau de bornes de recharge rapide dans les zones périurbaines et avons développé des batteries de stockage d\'énergie renouvelable pour alimenter les bornes.', NULL, 1),
(135, 9, 193, NULL, NULL, 'literal', '', 'Développement de solutions de recharge mobile pour véhicules électriques.', NULL, 1),
(136, 9, 195, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(137, 9, 194, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(138, 9, 198, NULL, NULL, 'literal', '', 'top@gmail.com', NULL, 1),
(139, 9, 197, NULL, NULL, 'literal', '', 'Pierre ', NULL, 1),
(140, 9, 196, NULL, NULL, 'literal', '', 'Martin', NULL, 1),
(141, 9, 199, NULL, NULL, 'literal', '', '10 avenue de la Liberté, 69003 Lyon', NULL, 1);

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
(5, 1, 'https://nathanbenais.github.io/Langages-et-Developpement-Web/data.html#', 'fup8', 'Mobilite Durable', 'Vocabulaire sur les projets de mobilité durable, incluant des classes et propriétés spécifiques.');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
