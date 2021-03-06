# Boba Database Project
[Blog](https://dev.to/pwong09/boba-database-1b9p)

Codecademy Computer Science Pro track - Database Portfolio Project module

1.0 Off-Platform Project: Designing a Database From Scratch
  Build a database on a topic of your choice completely from scratch!

1.1 Database Module Portfolio Project

1.0 OBJECTIVES:
    To design a database schema on a topic of your choosing.
    To implement that schema on your own computer using Postbird.

Part 1 - Research
Part 2 - Turn diagram into a schema
Part 3 - Add data to tables
Part 4 - Edit schema as necessary

1.1 OBJECTIVES

- Create an entity relationship diagram
- Create schema using PostgreSQL
- Populate with data
- Update database to check if data stays intact - ex. add constraints & roles
- Update database to ensure database stays fast - ex. add indexes, normalize, actively monitor & maintain database

1.2 UPDATES
- 2022.01.10 - boba - contained ORIGINAL schema with 3 shops and corresponding data
- 2022.01.19 - boba_v1 contains both ORIGINAL schema (including menu_items) and line-by-line updates to NEW schema (no menu_items, separating menu_items into menu_drinks, menu_toppings, menu_dairy)
- 2022.01.19 - boba_v2 is written based on NEW schema to check for significant difference in database storage & speed compared to v1


-----
2.0 Data Tables

Main tables:
  
  shops - boba shop info
  schedules - boba shops' operating hours
  menus - boba shop's menus
  drinks - boba drinks
  toppings - boba toppings
  --REMOVED menu_items - contains menu id, drink id, and topping id
  dairy_alternatives - contains menu_id, dairy_id, name of dairy alternative
  menu_drinks - contains menu_id & drink_id
  menu_toppings - contains menu_id & topping_id
  menu_dairy - contains menu_id and dairy_id

2.1 shops

shop_id - integer unique - primary key
name - varchar(55) - name of boba shop
address - varchar(255) - shop's full address including postal code
phone - varchar(10) - shop's telephone number
price - varchar(4) - pricing range based on Google maps
rating - integer - google maps rating 
UPDATE constraint 1 - check phone string is 10 characters long
UPDATE constraint 2 - check phone string contains only numbers between 0-9

2.2 schedules
shop_id - integer - foreign key 
day - varchar(3) - shorthand day of the week
open_time - time - time shop opens
close_time - time - time shop closes
UPDATE - composite primary key (shop_id, day)

2.3 menus
menu_id - integer - primary key
shop_id - integer unique - foreign key - one-to-one relationship

2.4 drinks
drink_id - integer - primary key
drink_name - varchar(75) - name of the drink
description - varchar(255) - description of drink, if any

2.5 toppings
topping_id - integer - primary key
topping_name - varchar(75) - name of the topping

--removed table below
--2.6 menu_items
--menu_id - integer - foreign key from menus table
--drink_id - integer - foreign key from drinks table
--topping_id - integer - foreign key from toppings table
--composite primary keys - menu_id & drink_id

2.7 dairy_alternatives
dairy_id - integer - primary key
name - citext - unique

2.8 menu_drinks
menu_id - integer - foreign key from menus table
drink_id - integer - foreign key from drinks table
composite primary key - menu_id, drink_id

2.9 menu_toppings
menu_id - integer - foreign key from menus table
topping_id - integer - foreign key from toppings table
composite primary key - menu_id, topping_id

2.11 menu_dairy
menu_id - integer - foreign key from menus table
dairy_id - integer - foreign key from dairy_alternatives table
composite primary key - menu_id, dairy_id
