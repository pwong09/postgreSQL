CREATE TABLE shops (
  shop_id integer PRIMARY KEY,
  name varchar(55),
  address varchar(255),
  phone varchar(10),
  price varchar(4),
  rating decimal
 );
 
ALTER TABLE shops
ADD CHECK (phone ~ '^[0-9]*$');
ALTER TABLE shops
ADD CHECK (phone ~ '^\d{9}|\d{10}$');
 
 CREATE TABLE schedules (
  shop_id integer REFERENCES shops(shop_id),
  day varchar(3),
  open_time time,
  close_time time,
  PRIMARY KEY (shop_id, day)
 );
  
 CREATE TABLE menus (
   menu_id integer PRIMARY KEY,
   shop_id integer REFERENCES shops(shop_id) UNIQUE
 );
 
 CREATE TABLE drinks (
   drink_id integer PRIMARY KEY,
   drink_name varchar(75),
   description varchar(255)
 );
 
 CREATE TABLE toppings (
   topping_id integer PRIMARY KEY,
   topping_name varchar(75),
   description varchar(255)
 );
 
 CREATE EXTENSION IF NOT EXISTS citext;
 
 CREATE TABLE dairy_alternatives (
  dairy_id integer PRIMARY KEY,
  name citext UNIQUE
 );
 
 CREATE TABLE menu_drinks (
  menu_id integer REFERENCES menus(menu_id),
  drink_id integer REFERENCES drinks(drink_id)
  );

CREATE TABLE menu_toppings (
  menu_id integer REFERENCES menus(menu_id),
  topping_id integer REFERENCES toppings(topping_id)
  );
 
CREATE TABLE menu_dairy (
  menu_id integer REFERENCES menus(menu_id),
  dairy_id integer REFERENCES dairy_alternatives(dairy_id)
  );

 
 
 --inserting sample shops
 INSERT INTO shops VALUES (1, 'Bubble World', '1325 Robson St, Vancouver, BC V6E 1C6', '6046898987', '$', 4.0);
 INSERT INTO shops VALUES (2, 'Happy Lemon Robson', '1188 Robson St, Vancouver BC V6E 1C6', '6044281858', '$', 3.7);
 INSERT INTO shops VALUES (3, 'Teaspoons & Co', '1020 Howe St, Vancouver, BC V6Z 1P5', '6044286233', '$', 4.7);
 
 --inserting sample data for Bubble World (shop_id = 1)
 
 INSERT INTO schedules VALUES 
	  (1, 'Mon', '11:30', '02:30'),
  	(1, 'Tue', '11:30', '02:30'),
  	(1, 'Wed', '11:30', '02:30'),
  	(1, 'Thu', '11:30', '02:30'),
  	(1, 'Fri', '11:30', '02:30'),
  	(1, 'Sat', '11:30', '02:30'),
  	(1, 'Sun', '11:30', '02:30');
 
 INSERT INTO drinks VALUES 
	(1, 'Milky Tea'),
	(2, 'Milky Green Tea'),
	(3, 'Milky Honey Tea'),
	(4, 'Milky Honey Green Tea'),
	(5, 'Milky Almond Tea'),
	(6, 'Milky Taro Tea'),
	(7, 'Milky Honeydew Tea'),
	(8, 'Milky Chocolate Tea'),
	(9, 'Hokkaido Milky Tea'),
	(10, 'Okinawa Milky Tea');
  
 INSERT INTO toppings VALUES
	  (1, 'pearls'),
  	(2, 'agar jelly'),
  	(3, 'pudding'),
  	(4, 'coffee jelly'),
  	(5, 'red bean'),
  	(6, 'rainbow jelly'),
  	(7, 'mango stars'),
  	(8, 'lychee jelly'),
  	(9, 'grass jelly'),
  	(10, 'chia seeds');

INSERT INTO menus VALUES (1, 1);

-- inserting sample data for Happy Lemon Robson (shop_id = 2)

INSERT INTO schedules VALUES 
	  (2, 'Mon', '12:30', '22:00'),
  	(2, 'Tue', '12:30', '21:00'),
  	(2, 'Wed', '12:30', '22:00'),
  	(2, 'Thu', '12:30', '22:00'),
  	(2, 'Fri', '12:30', '22:00'),
  	(2, 'Sat', '12:30', '22:00'),
  	(2, 'Sun', '12:30', '22:00');
 
INSERT INTO drinks VALUES
	  (11, 'classic milk tea'),
  	(12, 'pearl milk tea'),
  	(13, 'milk tea w/ taro balls'),
  	(14, 'milk tea w/ oreo & puff cream'),
  	(15, 'pearl milk tea w/ oreo trifle'),
  	(16, 'roasted milk tea'),
  	(17, 'roasted milk tea w/ grass jelly'),
  	(18, 'taro milk tea w/ pearls'),
  	(19, 'pearl milk tea w/ puff cream');
 
INSERT INTO toppings VALUES
	  (11, 'aloe'),
  	(12, 'lychee jello'),
  	(13, 'oreo'),
  	(14, 'puff cream'),
  	(15, 'salted cheese'),
  	(16, 'taro ball'),
  	(17, 'yakult'),
  	(18, 'honey'),
  	(19, 'fresh milk'),
  	(20, 'mashed taro');

INSERT INTO menus VALUES (2, 2);

-- inserting sample data for Teaspoons & Co (shop_id = 3)

INSERT INTO schedules VALUES 
	  (3, 'Mon', null, null),
  	(3, 'Tue', '12:00', '18:00'),
  	(3, 'Wed', '12:00', '18:00'),
  	(3, 'Thu', '12:00', '18:00'),
  	(3, 'Fri', '12:00', '18:00'),
  	(3, 'Sat', '12:00', '18:00'),
  	(3, 'Sun', '12:00', '18:00');
  
INSERT INTO drinks VALUES
	  (20, 'kurozato', 'hojicha (roasted green tea) sweetened with black sugar'),
  	(21, 'uji matcha', 'premium matcha from Uji, Japan'),
  	(22, 'london fog', 'fragrant Earl Grey with vanilla bean infused sweetener'),
  	(23, 'thai', 'Thai tea with condensed milk'),
  	(24, 'jasmine', 'floral jasmine green tea, shaken with real milk'),
  	(25, 'ca phe', 'traditional roasted coffee beans with notes of chocolate. Sweetened with condensed milk.'),
  	(26, 'rooibos', 'South African tea, caffeine-free, choose from: Vanilla or Chai');
 
INSERT INTO toppings VALUES
	  (21, 'mango jelly'),
  	(22, 'coconut jelly');

INSERT INTO menus VALUES (3, 3);

--adding more shops, more data
INSERT INTO shops VALUES 
	(4, 'Boba Run', '102 West Hastings St, Vancouver, BC V6B 1G8', '6044235890', '$$', 4.7),
	(5, 'CoCo Fresh Tea & Juice', '655 W Pender St, Vancouver, BC V6C 1X6', '6043360929', '$', 4.2),
	(6, 'Gong Cha', '386 Robson St, Vancouver, BC V6G 2B2', '7783793806', '$', 3.8),
	(7, 'The Alley', '985 Hornby St, Vancouver, BC V6Z 1V3', '6043369893', '$$', 4),
	(8, 'Ben Gong''s Tea (English Bay)', '1112 Denman St, Vancouver, BC V6G 2MB', '6043369095', '$', 4.6),
	(9, 'Chun Fun How Vancouver', '1067 W Broadway, Vancouver, BC V6H 1E2', '6043366922', '$$', 4.4),
	(10, 'Sharetea', '1274 Robson St, Vancouver, BC V6E 3Z6', '6046999119', '$', 3.7);

--adding new shops' hours
INSERT INTO schedules VALUES
  (4, 'Mon', '10:00', '17:00'),
  (4, 'Tue', '10:00', '17:00'),
  (4, 'Wed', '10:00', '17:00'),
  (4, 'Thu', '10:00', '17:00'),
  (4, 'Fri', '10:00', '17:00'),
  (4, 'Sat', '10:00', '19:00'),
  (4, 'Sun', '10:00', '17:00'),
  (5, 'Mon', '11:30', '18:30'),
  (5, 'Tue', '11:30', '18:30'),
  (5, 'Wed', '11:30', '18:30'),
  (5, 'Thu', '11:30', '18:30'),
  (5, 'Fri', '11:30', '18:30'),
  (5, 'Sat', '11:30', '18:30'),
  (5, 'Sun', '11:30', '18:30'),
  (6, 'Mon', '11:30', '20:00'),
  (6, 'Tue', '11:30', '20:00'),
  (6, 'Wed', '11:30', '20:00'),
  (6, 'Thu', '11:30', '20:00'),
  (6, 'Fri', '11:30', '20:00'),
  (6, 'Sat', '11:30', '20:00'),
  (6, 'Sun', '11:30', '20:00'),
  (7, 'Mon', '12:00', '21:00'),
  (7, 'Tue', '12:00', '21:00'),
  (7, 'Wed', '12:00', '21:00'),
  (7, 'Thu', '12:00', '21:00'),
  (7, 'Fri', '12:00', '21:00'),
  (7, 'Sat', '12:00', '21:00'),
  (7, 'Sun', '12:00', '21:00'),
  (8, 'Mon', '12:00', '22:00'),
  (8, 'Tue', '12:00', '22:00'),
  (8, 'Wed', '12:00', '22:00'),
  (8, 'Thu', '12:00', '22:00'),
  (8, 'Fri', '11:00', '23:00'),
  (8, 'Sat', '11:00', '23:00'),
  (8, 'Sun', '11:00', '22:00'),
  (9, 'Mon', '11:00', '21:30'),
  (9, 'Tue', '11:00', '21:30'),
  (9, 'Wed', '11:00', '21:30'),
  (9, 'Thu', '11:00', '21:30'),
  (9, 'Fri', '11:00', '00:30'),
  (9, 'Sat', '11:00', '00:30'),
  (9, 'Sun', '11:00', '21:30'),
  (10, 'Mon', '14:30', '22:30'),
  (10, 'Tue', '14:30', '22:30'),
  (10, 'Wed', '14:30', '22:30'),
  (10, 'Thu', '14:30', '22:30'),
  (10, 'Fri', '13:00', '23:00'),
  (10, 'Sat', '13:00', '23:00'),
  (10, 'Sun', '13:00', '23:00');
  
--adding new drinks
INSERT INTO drinks VALUES
  (27, 'signature bubble tea', 'Our signature CoCo milk tea with sweet chewy tapioca.'),
  (28, 'lava milk tea', 'Black sugar coated tapioca with milk tea.'),
  (29, 'lava jasmine milk tea', 'Black sugar coated tapioca with Jasmine milk tea.'),
  (30, 'taro milk tea', 'Made from the purple Taro root. Caffeine-free.'),
  (31, 'jasmine milk tea', 'Made from our traditional Jasmine green tea.'),
  (32, 'caramel milk tea', 'Our milk tea infused with toasty caramel. Made with non dairy creamer.'),
  (33, 'vanilla milk tea', 'Our milk tea infused with sweet vanilla. Made with non dairy creamer.'),
  (34, 'ruby milk tea', NULL),
  (35, 'strawberry milk tea', NULL),
  (36, 'honeydew milk tea', NULL),
  (37, 'royal no. 9 milk tea', 'Blueberry black milk tea sweetened with cane sugar. (Dairy Free)'),
  (38, 'the alley trio milk tea', 'Assam black milk tea sweetened with cane sugar featuring our topping trifecta - boba, rainbellow jelly, coconut jelly. (Dairy Free)'),
  (39, 'the alley assam milk tea', 'Assam black milk tea sweetened with cane sugar. (Dairy Free)'),
  (40, 'jasmine green milk tea', 'Jasmine green milk tea sweetened with cane sugar. (Dairy Free)'),
  (41, 'peach oolong milk tea', NULL),
  (42, 'dahongpao bubble milk tea', NULL),
  (43, 'brown sugar bubble milk tea', NULL),
  (44, 'osmanthus boba milk tea', NULL),
  (45, 'oolong milk tea', NULL),
  (46, 'tofu pudding milk tea', NULL),
  (47, 'honey milk tea', NULL),
  (48, 'classic coffee', NULL),
  (49, 'ginger milk tea', NULL),
  (50, 'coffee milk tea', NULL),
  (51, 'hokkaido milk tea', NULL),
  (52, 'okinawa milk tea', NULL),
  (53, 'thai milk tea', NULL),
  (54, 'yin yang milk tea', 'A popular Hong Kong favorite combining the best of two worlds - tea(yin) + coffee(yang)! Freshly brewed Assam black tea topped off with a double shot of Prototype Espresso finishing off with a drizzle of evaporated milk.'),
  (55, 'cafe latte', 'Who loves Coffee AND Boba? This drink is for you! 2 shots of Espresso poured over your choice of dairy, using premium beans from Prototype Coffee.'),
  (56, 'assam black tea', 'A full-bodied tea with strong malty notes paired with our organic dairy. Served hot and cold.'),
  (57, 'hk style', 'A strongly brewed black tea beautifully balanced with the addition of evaporated milk. Served hot and cold.'),
  (58, 'genmaicha', 'A blend of organic sencha and toasted rice producing a fragrant and nutty flavour. Served hot and cold.'),
  (59, 'thai iced tea', 'A spiced black tea that is creamy, rich and sweet. A delicious Thai treat! Served cold only.'),
  (60, 'earl grey', 'Black tea infused with bergamot oil paired with our organic dairy. Served hot and cold.'),
  (61, 'hojicha', 'Organic roasted green tea from Uji, Japan. Rich and nutty sweetened with muscovado sugar. Served hot and cold.'),
  (62, 'horchata', 'A delicious cinnamon flavoured rice milk beverage with the addition of whole milk for extra creaminess! Served cold only.'),
  (63, 'vietnamese cafe sua da', 'A rich and flavourful Vietnamese style café latte sweetened with condensed milk. Served cold only.'),
  (64, 'korean oat ''n barley latte', 'Roasted Korean barley tea paired with oat milk. Creamy and nutty and utterly delightful! Served hot and cold.'),
  (65, 'honeycomb dalgona latte', 'Korean honeycomb toffee crumbs served over your choice of milk. The toffee melts into your drink creating a "caramelly" flavour. Served cold only.'),
  (66, 'jolly pong shake', 'Korea''s popular cereal snack in the form of a milkshake. It is truly a jolly good drink! Comes in 5 flavors: Chocolate, Matcha, Hojicha, Genmaicha and Soybean powder. Served cold only.'),
  (67, 'banana milk latte', 'Our take on the famous Bingrae''s Korean banana milk using fresh bananas and real milk! Served cold only.'),
  (68, 'roasted soy latte', 'A rich and creamy latte made from roasted soybean powder. Served hot and cold.'),
  (69, 'sparkling honey yu-ja tea', 'A refreshing and fizzy Korean citron drink. Served cold only.'),
  (70, 'korean strawberry milk', 'Sweet and tart fresh strawberry milk using house made strawberry puree. Served cold only.'),
  (71, 'sparkling korean strawberry', 'House made strawberry puree topped off with sparkling water. Served cold only.'),
  (72, 'strawberry pepero shake', 'Made with real strawberries, organic milk, vanilla ice cream, organic cane syrup and strawberry pepero sticks. It taste just like your favorite childhood strawberry pepero sticks!'),
  (73, 'black sesame latte', 'House made black sesame paste paired with our organic milk. Rich and nutty in flavour. Served hot and cold.'),
  (74, 'matcha latte', 'Organic hand whisked matcha paired with your choice of milk. Served hot and cold.'),
  (75, 'dalgona matcha', 'Korean honeycomb toffee crumbs served over our signature organic matcha latte. Served cold only.'),
  (76, 'red bean matcha', 'Organic matcha latte paired with our sweetened red bean topping. Served cold only.'),
  (77, 'matcha mud slush', 'Creamy chocolate slush poured over hand whisked organic matcha. Served cold only.'),
  (78, 'yu-ja matcha slush', 'Korean honey citron slush layered over our hand whisked organic matcha. Served cold only.'),
  (79, 'black sugar matcha latte', 'Organic matcha latte sweetened with Muscovado syrup. Served hot and cold.'),
  (80, 'strawberry matcha latte', 'Hand whisked organic matcha layered over fresh milk and house made strawberry puree. Served cold only.'),
  (81, 'blueberry matcha latte', 'Hand whisked organic matcha layered over fresh milk and house made blueberry juice.'),
  (82, 'pineapple matcha latte', 'Hand whisked Organic Matcha over fresh milk and house made pineapple purée.');


--adding new toppings
INSERT INTO toppings VALUES
  (23, 'brown sugar pearls'),
  (24, 'sago'),
  (25, 'macchiato'),
  (26, 'qq'),
  (27, 'kanten jelly'),
  (28, 'house foam'),
  (29, 'strawberry bits'),
  (30, 'watermelon bits'),
  (31, 'crystal deerioca'),
  (32, 'green tea jelly'),
  (33, 'konjac jelly'),
  (34, 'brulee'),
  (35, 'purple rice'),
  (36, 'orange bits'),
  (37, 'tea cube'),
  (38, 'peach'),
  (39, 'lemon'),
  (40, 'tofu pudding'),
  (41, 'mini pearl'),
  (42, 'ice cream'),
  (43, 'herb jelly'),
  (44, 'aiyu jelly'),
  (45, 'creama'),
  (46, 'lychee pearl'),
  (48, 'crystal boba'),
  (49, 'organic chia'),
  (50, 'honeycomb dalgona'),
  (51, 'banana milk pudding');
  
INSERT INTO menus VALUES
	(4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

INSERT INTO dairy_alternatives VALUES
  (1, 'almond milk'),
  (2, 'coconut milk'),
  (3, 'lactose-free'),
  (4, 'oat milk'),
  (5, 'rice milk'),
  (6, 'soy milk');

INSERT INTO menu_drinks VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (1, 5),
  (1, 6),
  (1, 7),
  (1, 8),
  (1, 9),
  (1, 10),
  (2, 11),
  (2, 12),
  (2, 13),
  (2, 14),
  (2, 15),
  (2, 16),
  (2, 17),
  (2, 18),
  (2, 19),
  (3, 20),
  (3, 21),
  (3, 22),
  (3, 23),
  (3, 24),
  (3, 25),
  (3, 26),
  (4, 54),
  (4, 55),
  (4, 56),
  (4, 57),
  (4, 58),
  (4, 59),
  (4, 60),
  (4, 61),
  (4, 62),
  (4, 63),
  (4, 64),
  (4, 65),
  (4, 66),
  (4, 67),
  (4, 68),
  (4, 69),
  (4, 70),
  (4, 71),
  (4, 72),
  (4, 73),
  (4, 74),
  (4, 75),
  (4, 76),
  (4, 78),
  (4, 79),
  (4, 80),
  (4, 81),
  (4, 82),
  (5, 27),
  (5, 28),
  (5, 29),
  (5, 30),
  (5, 31),
  (5, 32),
  (5, 33),
  (6, 34),
  (6, 30),
  (6, 35),
  (6, 36),
  (6, 11),
  (6, 12),
  (7, 37),
  (7, 38),
  (7, 39),
  (7, 40),
  (8, 41),
  (8, 42),
  (8, 43),
  (8, 44),
  (8, 30),
  (9, 12),
  (9, 45),
  (9, 46),
  (10, 11),
  (10, 47),
  (10, 48),
  (10, 49),
  (10, 50),
  (10, 51),
  (10, 52),
  (10, 53);
  
INSERT INTO menu_toppings VALUES 
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (1, 5),
  (1, 6),
  (1, 7),
  (1, 8),
  (1, 9),
  (1, 10),
  (2, 1),
  (2, 3),
  (2, 5),
  (2, 8),
  (2, 9),
  (2, 11),
  (2, 12),
  (2, 13),
  (2, 14),
  (2, 15),
  (2, 16),
  (2, 17),
  (2, 18),
  (2, 19),
  (2, 20),
  (3, 1),
  (3, 8),
  (3, 9),
  (3, 21),
  (3, 22),
  (4, 1),
  (4, 8),
  (4, 11),
  (4, 48),
  (4, 49),
  (4, 51),
  (5, 1),
  (5, 3),
  (5, 5),
  (5, 9),
  (5, 22),
  (5, 23),
  (5, 24),
  (5, 25),
  (5, 26),
  (6, 1),
  (6, 3),
  (6, 4),
  (6, 5),
  (6, 9),
  (6, 27),
  (6, 28),
  (6, 46),
  (7, 1),
  (7, 11),
  (7, 16),
  (7, 22),
  (7, 23),
  (7, 29),
  (7, 30),
  (7, 31),
  (7, 32),
  (7, 33),
  (7, 34),
  (7, 35),
  (7, 36),
  (8, 1),
  (8, 22),
  (8, 23),
  (8, 37),
  (8, 38),
  (8, 39),
  (9, 1),
  (9, 9),
  (9, 11),
  (9, 22),
  (9, 40),
  (10, 1),
  (10, 3),
  (10, 5),
  (10, 8),
  (10, 11),
  (10, 41),
  (10, 42),
  (10, 43),
  (10, 44),
  (10, 45);

INSERT INTO menu_dairy VALUES
  (3, 2),
  (3, 3),
  (3, 4),
  (1, 1),
  (1, 6),
  (4, 1),
  (4, 4);
 
 
 --storage analysis
SELECT pg_size_pretty(pg_total_relation_size('shops')) as shops,
  pg_size_pretty(pg_total_relation_size('toppings')) as toppings,
  pg_size_pretty(pg_total_relation_size('drinks')) as drinks, 
  pg_size_pretty(pg_total_relation_size('menu_drinks')) as menu_drinks,
  pg_size_pretty(pg_total_relation_size('menu_toppings')) as menu_toppings,
  pg_size_pretty(pg_total_relation_size('menu_dairy')) as menu_dairy,
  pg_size_pretty(pg_total_relation_size('menus')) as menus,
  pg_size_pretty(pg_total_relation_size('schedules')) as schedules,
  pg_size_pretty(pg_total_relation_size('dairy_alternatives')) as dairy_alternatives;
--32 kB, 24 kB, 56 kB, 8192 bytes, 8192 bytes, 8192 bytes, 40 kB, 24 kB, 48 kB = 249 kB

VACUUM FULL;

SELECT pg_size_pretty(pg_total_relation_size('shops')) as shops,
  pg_size_pretty(pg_total_relation_size('toppings')) as toppings,
  pg_size_pretty(pg_total_relation_size('drinks')) as drinks, 
  pg_size_pretty(pg_total_relation_size('menu_drinks')) as menu_drinks,
  pg_size_pretty(pg_total_relation_size('menu_toppings')) as menu_toppings,
  pg_size_pretty(pg_total_relation_size('menu_dairy')) as menu_dairy,
  pg_size_pretty(pg_total_relation_size('menus')) as menus,
  pg_size_pretty(pg_total_relation_size('schedules')) as schedules,
  pg_size_pretty(pg_total_relation_size('dairy_alternatives')) as dairy_alternatives;
--32 kB, 24 kB, 32 kB, 8192 bytes, 8192 bytes, 8192 bytes, 40 kB, 24 kB, 48 kB = 225 kB
--SAME END STORAGE RESULT AS boba_v1.sql


--indexing
EXPLAIN ANALYZE SELECT 
	DISTINCT drinks.drink_name,
  	shops.name as shop_name
FROM drinks
JOIN menu_drinks
	ON drinks.drink_id = menu_drinks.drink_id
JOIN menus
	ON menu_drinks.menu_id = menus.menu_id
JOIN shops
	ON menus.shop_id = shops.shop_id
WHERE drinks.drink_name = 'kurozato';
--19 lines, Planning Time: 2.000 ms, Execution Time: 0.339 ms

CREATE INDEX drink_name_idx ON drinks (drink_name);

--after index, 19 lines, Planning Time: 0.994 ms, Execution Time: 0.179 ms

ALTER TABLE menu_dairy
ADD PRIMARY KEY (menu_id, dairy_id);

ALTER TABLE menu_drinks
ADD PRIMARY KEY (menu_id, drink_id);

ALTER TABLE menu_toppings
ADD PRIMARY KEY (menu_id, topping_id);
