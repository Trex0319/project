-- Adminer 4.8.0 MySQL 5.5.5-10.5.17-MariaDB-1:10.5.17+maria~ubu2004 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `total_amount` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaction_id` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `orders` (`id`, `status`, `total_amount`, `created_at`, `transaction_id`, `user_id`) VALUES
(1,	'pending',	3500000,	'2023-01-29 09:33:20',	'61d9eqij',	2),
(2,	'pending',	3500000,	'2023-04-26 01:13:27',	'wckf1vwo',	3);

DROP TABLE IF EXISTS `orders_products`;
CREATE TABLE `orders_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orders_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `orders_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `orders_products` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(1,	1,	1,	1),
(2,	2,	1,	1);

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image_url` text NOT NULL,
  `detail` text NOT NULL,
  `class` text NOT NULL,
  `engine` text NOT NULL,
  `hp` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `products` (`id`, `name`, `price`, `image_url`, `detail`, `class`, `engine`, `hp`) VALUES
(1,	'Lamborghini Veneno',	3500000,	'https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Geneva_MotorShow_2013_-_Lamborghini_Veneno_1.jpg/1200px-Geneva_MotorShow_2013_-_Lamborghini_Veneno_1.jpg',	'The Veneno is Lamborghini\'s interpretation of a racing prototype built for the road. The front of the car is designed for maximum airflow and improved downforce. The redesigned front and rear arches direct air around the car in order to reduce excessive lift and aid in generating downforce. The smooth underbody ensures that the airflow is not interrupted. The large carbon-fibre rear wing connected to the car via an LMP-style central fin is three-way adjustable. The wheels of the car (measuring 20-inch at the front and 21-inch at the rear) have a turbine-like design and direct air to cool the car\'s carbon ceramic braking system. The center lock wheels allow for easy installation and removal. The car utilises Pirelli P-Zero tyres. The Veneno retains the carbon-fibre monocoque chassis with aluminium front and rear subframe from the Aventador along with the pushrod suspension system. The interior is based largely on the Aventador\'s interior, but now incorporates the \"carbon skin\" element introduced on the Aventador J. The 7-speed ISR automated manual transmission is also retained from the Aventador and includes a new \"track\" setting for improved performance on a race track.',	'Class: Sports Car\r\n',	'Engine 6.5 L L539 V12\r\n',	'HP 740'),
(2,	'Apollo IE',	2670000,	'http://cdn.carbuzz.com/gallery-images/1600/708000/700/708796.jpg',	'The exterior design is based on airflow and nature, insects and marine animals in particular. The interior is based entirely on the nature theme, with a cocoon-style carbon fiber tub cockpit, in the style of a leather-wrapped prototype race car. Apart from the natural thought, the car was also intended to have a design that would stand out from all other sports cars. The car is made almost entirely out of carbon fibre, but it does include high-strength steel, aluminium, and titanium components. The engine bay is left uncovered, to allow the air intake to operate with maximum efficiency. The entire chassis weighs only 105 kg (231 lb).',	'Class: Sports Car\r\n',	'Engine 6.3 L naturally-aspirated V12\r\n',	'HP 780'),
(3,	'McLaren Senna',	1399950,	'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/McLaren_Senna_Genf_2018.jpg/1200px-McLaren_Senna_Genf_2018.jpg',	'McLaren\'s main focus while designing the Senna was to achieve faster lap times. In order to do so, McLaren developed a lightweight design that incorporated aerodynamic elements.The car has many aerodynamic elements, there being a large adjustable double-element rear wing (that is operated electronically and has various settings in order to provide optimum performance while also acting as an airbrake), double-element diffuser, Formula One-inspired roof scoop, front and side air intakes, rear air louvres, and large front fenders. Inside the panel beside the intakes is a small set of mini-canards. Areas of low pressure are accompanied using high-performance radiators that ensure improved engine cooling. The car uses dihedral doors, like the previous offerings in the Ultimate Series, and also has optional windows applied on the lower area of its doors.',	'Class: Sports Car\r\n',	'Engine 4.0 L M840TR twin-turbocharged V8\r\n',	'HP 789'),
(4,	'Pagani Huayra',	2400000,	'https://upload.wikimedia.org/wikipedia/commons/3/36/Pagani%2C_GIMS_2019%2C_Le_Grand-Saconnex_%28GIMS0023%29.jpg',	'The Pagani Huayra uses a seven-speed sequential gearbox and a single disc clutch. The choice not to use a dual-clutch was due to the increase in weight of over 70 kg (154 lb), thus negating any advantage of the faster gear changes in a double-clutch transmission. As a result, the transmission weighs 96 kg (212 lb). The Pagani Huayra is different from its predecessor in that it incorporates active aerodynamics. It is capable of changing the height of the front from the ground and independently operating four flaps placed at the rear and front of the car. The behavior of the flaps is managed by a dedicated control unit that is fed information from systems such as the ABS and ECU, which pass on information about the car\'s speed, yaw rate, lateral acceleration, steering angle and throttle position. This is intended to achieve minimal drag coefficient or maximum downforce depending on the situation. The Huayra\'s designer Horacio Pagani states that it has a variable drag coefficient of between .31 and .37. The system also prevents excess body roll in the corners by raising the \"inside\" flaps, increasing the downforce on that side of the car. The rear flaps also act as an airbrake. Under hard braking, both the front suspension and the two rear flaps are raised to counter-act weight transfer to the front wheels and keep the whole car stable, for instance when entering a corner. Air from the radiator is extracted through an arch in the bonnet at an angle that is designed not to affect the streamline around the body. The side air intakes behind the front wheels create a low pressure zone, resulting in downforce.',	'Class: Sports Car\r\n',	'Engine 5.980 L twin-turbocharged Mercedes-AMG M158 V12\r\n',	'HP 791'),
(5,	'Bugatti La Voiture Noire',	13400000,	'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Bugatti_La_Voiture_Noire%2C_GIMS_2019%2C_Le_Grand-Saconnex_%28GIMS0951%29.jpg/420px-Bugatti_La_Voiture_Noire%2C_GIMS_2019%2C_Le_Grand-Saconnex_%28GIMS0951%29.jpg',	'The car has a hand-built body made from carbon fibre designed by Bugatti designer Etienne Salomé which has an elongated nose (similar to that on the Divo) and an elongated rear section. Other features include unique wing mirrors, LED taillight strip and wheels. Unlike the original, the car retains the mid-engine layout. A trim piece running from the front of the car to the rear spoiler recalls the dorsal fin present on the Type 57 SC. The car features a floating windscreen and has masked A pillars. Its neo-retro-futuristic fastback body is made from carbon fiber and is entirely handmade at the Bugatti factory in Molsheim, Alsace. The carbon backbone of the low roof, to the horseshoe grille recall those of the Bugatti Type SC57 Fireball Atlantic in 1930. Performance figures remain unknown but the company states that the car is likely to have a lower top speed and acceleration times as compared to the Chiron due to its Grand Touring nature. The car was sold for a price of €11 million, making it the most expensive car built to date.',	'Class: Sport Car',	'Engine 16-cylinder W quad - turbo',	'HP 1500'),
(6,	'Ferrari Roma',	225930,	'https://www.tuningblog.eu/wp-content/uploads/2022/10/Ferrari-Roma-Braun-Tailor-Made-Programm-3.jpg',	'The Roma is powered by the award-winning Ferrari type F154 engine. The engine is mated to the new 8-speed dual-clutch F1 transmission shared with the SF90 Stradale. This new unit translates into more acceleration in the intermediate gears with an extended tall top gear for motorway cruising. The transaxle is equipped with an electronic differential and a mechanical reverse gear which contrasts to the SF90\'s electric motor reverse. This design weighs 6 kg (13 lb) less than the 7-speed unit used in the Portofino and is claimed to provide quicker and smoother shifting. Much of the weight savings is due to the dry sump design and the primary alloy oil case that is compact and wrapped tightly around the various engine components. The Roma comes standard with Ferrari\'s F1-Trac traction control, side-slip control 6.0 technology, electronic stability control (ESC), launch control (Power Start), and the Ferrari Dynamic Enhancer. It also has a five position Manettino dial on the steering wheel allowing selection of the vehicle\'s driving mode between wet, comfort, sport, race and ESC-off. The Roma\'s electronic interior cockpit controls also represent a major deviation from recent Ferrari road cars. The human-machine interface (HMI) is largely a digital touch-screen control system (using Haptic technology) that is also shared with the SF90 Stradale. The touch-screen control extends to some functions on the steering wheel. Some driver assistance systems (ADAS) like front and rear radar with adaptive cruise control are also available options to aid during long drives.',	'Class: Grand tourer',	'Engine 3.9 L F154 BH twin-turbo V8',	'HP 612'),
(7,	'Aston Martin DBS',	333686,	'https://carnetwork.s3.ap-southeast-1.amazonaws.com/file/613f14540bb248298715b79bf7460b8f.jpg',	'The front of the DBS features a new front bumper with a large centre grille compared to the DB11 in order for improved engine cooling along with two air extractors on the sides to cool the brakes and two vents on the hood that aid in the engine cooling process. The DBS Superleggera features the new ZF 8HP95 transmission with a shorter final-drive ratio of 2.93:1, in contrast to the DB11\'s 2.70:1. Chassis-wise, it also comes with torque vectoring and a mechanical limited slip differential for more focused track performance. The car also features the same aerodynamics first seen on the DB11 including Aston Martin\'s innovative Aeroblade system, but refines aerodynamics with an F1-inspired double-diffuser that helps the car generate 397 lb (180 kg) of downforce – the highest figure ever for a series production Aston Martin. A new quad-pipe titanium exhaust system ensures improved engine sound while the usage of carbon fibre in major areas of the car lowers the weight down to 1,693 kg (3,732 lb).',	'Class: Grand tourer',	'Engine 5.2 L Aston Martin AM31 twin-turbocharged V12',	'HP 715'),
(8,	'Audi R8',	209700,	'https://photo-view.motorcloud.com/?img_url=aHR0cHM6Ly9waWN0dXJlcy5kZWFsZXIuY29tL2EvYXVkaWZyZW1vbnRhb2EvMTMyMi9hMWFlMjIyNWVkMDFhOGVhZTc5M2Q4MDc0ZjNmNWI0MXguanBn',	'The R8 body is lighter and stiffer, due to the substitution of several large aluminium parts in the shell by carbon fibre. Extra electronics are incorporated in the chassis as compared to the first generation to improve handling. The ‘Virtual Cockpit’ first introduced in the TT was also made available. The all-wheel-drive system and the 7-speed S-Tronic transmission are standard with no manual transmission available. The Quattro all-wheel-drive system used on the R8 is slightly rear-biased with power delivery to the wheels variable. A water-cooled front differential and a passive limited-slip rear differential along with an electromechanical power steering contribute to the agile handling of the car. The R8 is available with 19-inch wheels as standard with 20-inch wheels available as an option. Carbon-ceramic brakes are also optional equipment.',	'Class: Sport Car',	'Engine 5.2 L V10 FSI',	'HP 602'),
(9,	'Maserati MC20',	1800000,	'https://images.pistonheads.com/nimg/46347/blobid0.jpg',	'The MC20 Cielo, a drop-top variant of the MC20 halo sports car. It features the same 3.0 litre twin-turbo V6 and styling, but adds on the two-piece foldable hard-top that has an electrochromic glass roof. The roof system weighs an additional 65 kg, and the folding & unfolding of the roof sequence takes only 12 seconds. The interior features a steering wheel constructed mostly of carbon fiber, with Alcantara accents. There is a TFT 10.25 inch digital instrument cluster, and a 10.25 inch infotainment screen. The seats have leather seating surfaces on the bolsters and headrest, with the middle seating surface made from Alcantara.',	'Class: Sport Car',	'Engine 3.0 L Maserati Nettuno twin-turbocharged V6',	'HP 621');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `added_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `users` (`id`, `email`, `password`, `added_on`) VALUES
(2,	'piggy@gmail.com',	'$2y$10$ui68uOxg7b0vXdHP7nWD4.u2xqUPS9bu/cO9TxDQlLZZMHJjQ5zRS',	'2023-01-29 09:32:59'),
(3,	'denishfok@gmail.com',	'$2y$10$9RKVpB7y0kw4jhoKk6Rbxu9ZeEUqGBfmoiEV.8SZ0KMo52wZUhia2',	'2023-04-26 01:13:17');

-- 2023-05-25 05:04:11
