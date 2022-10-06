Challenge: Rolodex
As a developer, I have been tasked with creating a database model that will be used in a rolodex application. I want to ensure that the database behaves as expected and the necessary actions can be performed on the database instances.

Set Up

Create a new Rails app named 'rolodex_challenge'.
Create the database. The output in the terminal should look like this:
Created database 'rolodex_development'
Created database 'rolodex_test'
Generate a model called Person with a first_name, last_name, and phone. All fields should be strings.
Run a migration to set up the database.

$ rails new rolo_challenege -d postgresql -T
$ cd rolo_challenege
$ rails db:create
$ rails server

$ rails g model Person first_name:string last_name:string phone:string
$ rails db:migrate
$ rails c

Open up Rails console.
Actions

Add five family members into the Person table in the Rails console.
Retrieve all the items in the database.
Add yourself to the Person table.
Retrieve all the entries that have the same last_name as you.
Update the phone number of the last entry in the database.
Retrieve the first_name of the third Person in the database.


Last login: Thu Oct  6 08:31:04 on ttys000
➜  rolodex_challenge git:(main) ✗ rails g model Person first_name:string last_name:string phone:string
      invoke  active_record
      create    db/migrate/20221006163510_create_people.rb
      create    app/models/person.rb
➜  rolodex_challenge git:(main) ✗ rails db:migrate
== 20221006163510 CreatePeople: migrating =====================================
-- create_table(:people)
   -> 0.0093s
== 20221006163510 CreatePeople: migrated (0.0094s) ============================

➜  rolodex_challenge git:(main) ✗ rails c
Loading development environment (Rails 7.0.4)

8'
  TRANSACTION (0.2ms)  BEGIN
  Person Create (1.1ms)  INSERT INTO "people" ("first_name", "last_name", "phone", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Joe"], ["last_name", "Dirt"], ["phone", "703-2918"], ["created_at", "2022-10-06 16:39:22.768505"], ["updated_at", "2022-10-06 16:39:22.768505"]]                                                                      
  TRANSACTION (0.7ms)  COMMIT                                                   
 =>                                                                             
#<Person:0x0000000107c7d1b8                                                     
 id: 1,                                                                         
 first_name: "Joe",                                                             
 last_name: "Dirt",                                                             
 phone: "703-2918",                                                             
 created_at: Thu, 06 Oct 2022 16:39:22.768505000 UTC +00:00,                    
 updated_at: Thu, 06 Oct 2022 16:39:22.768505000 UTC +00:00>                    
3.0.0 :002 > Person.create first_name: 'Ruby', last_name: 'Rails', phone: '222-3128'
  TRANSACTION (0.3ms)  BEGIN
  Person Create (1.2ms)  INSERT INTO "people" ("first_name", "last_name", "phone", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Ruby"], ["last_name", "Rails"], ["phone", "222-3128"], ["created_at", "2022-10-06 16:40:12.237060"], ["updated_at", "2022-10-06 16:40:12.237060"]]
  TRANSACTION (0.4ms)  COMMIT
 => 
#<Person:0x0000000110a983a8
 id: 2,
 first_name: "Ruby",
 last_name: "Rails",
 phone: "222-3128",
 created_at: Thu, 06 Oct 2022 16:40:12.237060000 UTC +00:00,
 updated_at: Thu, 06 Oct 2022 16:40:12.237060000 UTC +00:00> 
3.0.0 :003 > Person.create first_name: 'Java', last_name: 'Script', phone: '101-8594'
  TRANSACTION (0.2ms)  BEGIN
  Person Create (0.3ms)  INSERT INTO "people" ("first_name", "last_name", "phone", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Java"], ["last_name", "Script"], ["phone", "101-8594"], ["created_at", "2022-10-06 16:40:40.179783"], ["updated_at", "2022-10-06 16:40:40.179783"]]
  TRANSACTION (0.6ms)  COMMIT
 => 
#<Person:0x00000001276e9100
 id: 3,
 first_name: "Java",
 last_name: "Script",
 phone: "101-8594",
 created_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00,
 updated_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00> 
3.0.0 :004 > Person.create first_name: 'Mario', last_name: 'Brother', phone: '335-3353'
  TRANSACTION (0.3ms)  BEGIN
  Person Create (0.3ms)  INSERT INTO "people" ("first_name", "last_name", "phone", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Mario"], ["last_name", "Brother"], ["phone", "335-3353"], ["created_at", "2022-10-06 16:41:36.326426"], ["updated_at", "2022-10-06 16:41:36.326426"]]
  TRANSACTION (0.7ms)  COMMIT
 => 
#<Person:0x0000000126f51d20
 id: 4,
 first_name: "Mario",
 last_name: "Brother",
 phone: "335-3353",
 created_at: Thu, 06 Oct 2022 16:41:36.326426000 UTC +00:00,
 updated_at: Thu, 06 Oct 2022 16:41:36.326426000 UTC +00:00> 
3.0.0 :005 > Person.create first_name: 'Baby', last_name: 'Yoda', phone: '555-7328'
  TRANSACTION (0.2ms)  BEGIN
  Person Create (0.3ms)  INSERT INTO "people" ("first_name", "last_name", "phone", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Baby"], ["last_name", "Yoda"], ["phone", "555-7328"], ["created_at", "2022-10-06 16:42:04.738359"], ["updated_at", "2022-10-06 16:42:04.738359"]]
  TRANSACTION (0.7ms)  COMMIT
 => 
#<Person:0x0000000110961c78
 id: 5,
 first_name: "Baby",
 last_name: "Yoda",
 phone: "555-7328",
 created_at: Thu, 06 Oct 2022 16:42:04.738359000 UTC +00:00,
 updated_at: Thu, 06 Oct 2022 16:42:04.738359000 UTC +00:00> 
3.0.0 :006 > Person.all
  Person Load (0.6ms)  SELECT "people".* FROM "people"
 =>                                                           
[#<Person:0x0000000107b16298                                  
  id: 1,                                                      
  first_name: "Joe",                                          
  last_name: "Dirt",                                          
  phone: "703-2918",                                          
  created_at: Thu, 06 Oct 2022 16:39:22.768505000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:39:22.768505000 UTC +00:00>,
 #<Person:0x0000000107b16158                                  
  id: 2,                                                      
  first_name: "Ruby",                                         
  last_name: "Rails",                                         
  phone: "222-3128",                                          
  created_at: Thu, 06 Oct 2022 16:40:12.237060000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:40:12.237060000 UTC +00:00>,
 #<Person:0x0000000107b16090
  id: 3,
  first_name: "Java",
  last_name: "Script",
  phone: "101-8594",
  created_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00>,
 #<Person:0x0000000107b15fc8
  id: 4,
  first_name: "Mario",
  last_name: "Brother",
  phone: "335-3353",
  created_at: Thu, 06 Oct 2022 16:41:36.326426000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:41:36.326426000 UTC +00:00>,
 #<Person:0x0000000107b15f00
  id: 5,
  first_name: "Baby",
  last_name: "Yoda",
  phone: "555-7328",
  created_at: Thu, 06 Oct 2022 16:42:04.738359000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:42:04.738359000 UTC +00:00>] 
3.0.0 :007 > Person.create first_name: 'Jeremy', last_name: 'Duncan', phone: '839-3966'
  TRANSACTION (0.9ms)  BEGIN
  Person Create (0.4ms)  INSERT INTO "people" ("first_name", "last_name", "phone", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Jeremy"], ["last_name", "Duncan"], ["phone", "839-3966"], ["created_at", "2022-10-06 16:43:09.078445"], ["updated_at", "2022-10-06 16:43:09.078445"]]
  TRANSACTION (4.7ms)  COMMIT
 => 
#<Person:0x00000001277f9130
 id: 6,
 first_name: "Jeremy",
 last_name: "Duncan",
 phone: "839-3966",
 created_at: Thu, 06 Oct 2022 16:43:09.078445000 UTC +00:00,
 updated_at: Thu, 06 Oct 2022 16:43:09.078445000 UTC +00:00> 
3.0.0 :008 > Person.where last_name: 'Duncan'
  Person Load (0.3ms)  SELECT "people".* FROM "people" WHERE "people"."last_name" = $1  [["last_name", "Duncan"]]                                                   
 =>                                                           
[#<Person:0x00000001109a8e70                                  
  id: 6,                                                      
  first_name: "Jeremy",                                       
  last_name: "Duncan",                                        
  phone: "839-3966",                                          
  created_at: Thu, 06 Oct 2022 16:43:09.078445000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:43:09.078445000 UTC +00:00>] 
3.0.0 :009 > Person.last.update phone: '225-3000'
  Person Load (0.3ms)  SELECT "people".* FROM "people" ORDER BY "people"."id" DESC LIMIT $1  [["LIMIT", 1]]                                                         
  TRANSACTION (0.2ms)  BEGIN                                  
  Person Update (4.9ms)  UPDATE "people" SET "phone" = $1, "updated_at" = $2 WHERE "people"."id" = $3  [["phone", "225-3000"], ["updated_at", "2022-10-06 16:47:01.964640"], ["id", 6]]
  TRANSACTION (0.4ms)  COMMIT                                 
 => true                                                      
3.0.0 :010 > Person.all
  Person Load (0.7ms)  SELECT "people".* FROM "people"
 =>                                                           
[#<Person:0x0000000127468250                                  
  id: 1,                                                      
  first_name: "Joe",                                          
  last_name: "Dirt",                                          
  phone: "703-2918",                                          
  created_at: Thu, 06 Oct 2022 16:39:22.768505000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:39:22.768505000 UTC +00:00>,
 #<Person:0x00000001274680c0                                  
  id: 2,                                                      
  first_name: "Ruby",                                         
  last_name: "Rails",                                         
  phone: "222-3128",                                          
  created_at: Thu, 06 Oct 2022 16:40:12.237060000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:40:12.237060000 UTC +00:00>,
 #<Person:0x00000001274580f8
  id: 3,
  first_name: "Java",
  last_name: "Script",
  phone: "101-8594",
  created_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00>,
 #<Person:0x0000000127453fd0
  id: 4,
  first_name: "Mario",
  last_name: "Brother",
  phone: "335-3353",
  created_at: Thu, 06 Oct 2022 16:41:36.326426000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:41:36.326426000 UTC +00:00>,
 #<Person:0x0000000127453ad0
  id: 5,
  first_name: "Baby",
  last_name: "Yoda",
  phone: "555-7328",
  created_at: Thu, 06 Oct 2022 16:42:04.738359000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:42:04.738359000 UTC +00:00>,
 #<Person:0x0000000127453670
  id: 6,
  first_name: "Jeremy",
  last_name: "Duncan",
  phone: "225-3000",
  created_at: Thu, 06 Oct 2022 16:43:09.078445000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:47:01.964640000 UTC +00:00>] 
3.0.0 :011 > Person.find(3)
  Person Load (0.3ms)  SELECT "people".* FROM "people" WHERE "people"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]                                                 
 =>                                                           
#<Person:0x00000001108ca800                                   
 id: 3,                                                       
 first_name: "Java",                                          
 last_name: "Script",                                         
 phone: "101-8594",                                           
 created_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00,  
 updated_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00>  
3.0.0 :012 > Person.first_name.find(3)
/Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.4/lib/active_record/dynamic_matchers.rb:22:in `method_missing': undefined method `first_name' for Person:Class (NoMethodError) 
Did you mean?  sti_name                                                                 
3.0.0 :013 > Person.first_name.find 3
/Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.4/lib/active_record/dynamic_matchers.rb:22:in `method_missing': undefined method `first_name' for Person:Class (NoMethodError) 
Did you mean?  sti_name                                                                 
3.0.0 :014 > person = Person.find(3) 
  Person Load (0.4ms)  SELECT "people".* FROM "people" WHERE "people"."id" = $1 LIMIT $2  [["id", 3], ["LIMIT", 1]]                                                                           
 =>                                                                                     
#<Person:0x00000001114c7770                                                             
...                                                                                     
3.0.0 :015 > person.first_name
 => "Java" 
3.0.0 :016 > Person.create first_name: 'Type', last_name: 'Script', phone: '839-3966'
  TRANSACTION (0.2ms)  BEGIN
  Person Create (0.3ms)  INSERT INTO "people" ("first_name", "last_name", "phone", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["first_name", "Type"], ["last_name", "Script"], ["phone", "839-3966"], ["created_at", "2022-10-06 16:55:58.035616"], ["updated_at", "2022-10-06 16:55:58.035616"]]                                                                      
  TRANSACTION (1.1ms)  COMMIT                                                      
 =>                                                                                
#<Person:0x0000000116b906d8                                   
 id: 7,                                                       
 first_name: "Type",                                          
 last_name: "Script",                                         
 phone: "839-3966",                                           
 created_at: Thu, 06 Oct 2022 16:55:58.035616000 UTC +00:00,  
 updated_at: Thu, 06 Oct 2022 16:55:58.035616000 UTC +00:00>  
3.0.0 :017 > Person.where last_name: 'Script'
  Person Load (1.5ms)  SELECT "people".* FROM "people" WHERE "people"."last_name" = $1  [["last_name", "Script"]]                                                   
 =>                                                           
[#<Person:0x000000011152e6a0                                  
  id: 3,                                                      
  first_name: "Java",                                         
  last_name: "Script",                                        
  phone: "101-8594",                                          
  created_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00>,
 #<Person:0x000000011152e5d8                                  
  id: 7,                                                      
  first_name: "Type",                                         
  last_name: "Script",                                        
  phone: "839-3966",                                          
  created_at: Thu, 06 Oct 2022 16:55:58.035616000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:55:58.035616000 UTC +00:00>] 
3.0.0 :018 > Person.find_by(last_name: 'Script')
  Person Load (0.3ms)  SELECT "people".* FROM "people" WHERE "people"."last_name" = $1 LIMIT $2  [["last_name", "Script"], ["LIMIT", 1]]                                                  
 =>                                                                                 
#<Person:0x0000000126f50970                                                         
 id: 3,                                                                             
 first_name: "Java",                                                                
 last_name: "Script",                                                               
 phone: "101-8594",                                                                 
 created_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00,                        
 updated_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00>



Stretch Challenges

Update all the family members with the same last_name as you, to have the same phone number as you.
Remove all family members that do not have your last_name.


3.0.0 :019 > Person.phone = '111-1111'.where last_name: 'Script'
(irb):19:in `<main>': undefined method `where' for "111-1111":String (NoMethodError)
3.0.0 :020 > Person.where(last_name: 'Script').update_all(phone: '111-1111')
  Person Update All (2.3ms)  UPDATE "people" SET "phone" = $1 WHERE "people"."last_name" = $2  [["phone", "111-1111"], ["last_name", "Script"]]                                                             
 => 2                                                                                                 
3.0.0 :021 > Person.all
  Person Load (0.6ms)  SELECT "people".* FROM "people"
 =>                                                                                                   
[#<Person:0x00000001109e2ff8                                                                          
  id: 1,                                                                                              
  first_name: "Joe",                                                                                  
  last_name: "Dirt",                                                                                  
  phone: "703-2918",                                                                                  
  created_at: Thu, 06 Oct 2022 16:39:22.768505000 UTC +00:00,                                         
  updated_at: Thu, 06 Oct 2022 16:39:22.768505000 UTC +00:00>,                                        
 #<Person:0x00000001109e2f08                                                                          
  id: 2,                                                                                              
  first_name: "Ruby",                                         
  last_name: "Rails",                                         
  phone: "222-3128",                                          
  created_at: Thu, 06 Oct 2022 16:40:12.237060000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:40:12.237060000 UTC +00:00>,
 #<Person:0x00000001109e2df0
  id: 4,
  first_name: "Mario",
  last_name: "Brother",
  phone: "335-3353",
  created_at: Thu, 06 Oct 2022 16:41:36.326426000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:41:36.326426000 UTC +00:00>,
 #<Person:0x00000001109e2d28
  id: 5,
  first_name: "Baby",
  last_name: "Yoda",
  phone: "555-7328",
  created_at: Thu, 06 Oct 2022 16:42:04.738359000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:42:04.738359000 UTC +00:00>,
 #<Person:0x00000001109e2c10
  id: 6,
  first_name: "Jeremy",
  last_name: "Duncan",
  phone: "225-3000",
  created_at: Thu, 06 Oct 2022 16:43:09.078445000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:47:01.964640000 UTC +00:00>,
 #<Person:0x00000001109e2b48
  id: 3,
  first_name: "Java",
  last_name: "Script",
  phone: "111-1111",
  created_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00>,
 #<Person:0x00000001109e2a80
  id: 7,
  first_name: "Type",
  last_name: "Script",
  phone: "111-1111",
  created_at: Thu, 06 Oct 2022 16:55:58.035616000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:55:58.035616000 UTC +00:00>] 
3.0.0 :022 > Person.where.not(last_name: 'Script').delete
/Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.4/lib/active_record/persistence.rb:473:in `delete': wrong number of arguments (given 0, expected 1) (ArgumentError)                          
3.0.0 :023 > Person.where.not(last_name: 'Script').destroy
/Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.4/lib/active_record/persistence.rb:447:in `destroy': wrong number of arguments (given 0, expected 1) (ArgumentError)                         
3.0.0 :024 > Person.destroy(where.not(last_name: 'Script'))
(irb):24:in `<main>': undefined local variable or method `where' for main:Object (NameError)
Did you mean?  when                                                                                   
3.0.0 :025 > Person.destroy.where.not(last_name: 'Script')
/Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.4/lib/active_record/persistence.rb:447:in `destroy': wrong number of arguments (given 0, expected 1) (ArgumentError)                         
3.0.0 :026 > Person.where.not(last_name: 'Script').destroy_all
  Person Load (0.9ms)  SELECT "people".* FROM "people" WHERE "people"."last_name" != $1  [["last_name", "Script"]]                                                                                          
  TRANSACTION (0.2ms)  BEGIN                                                                          
  Person Destroy (0.3ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 1]]                  
  TRANSACTION (4.2ms)  COMMIT                                                                         
  TRANSACTION (0.1ms)  BEGIN                                                                          
  Person Destroy (0.4ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 2]]                  
  TRANSACTION (0.3ms)  COMMIT                                                                         
  TRANSACTION (0.1ms)  BEGIN                                                                          
  Person Destroy (0.2ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 4]]                  
  TRANSACTION (0.3ms)  COMMIT                                                                         
  TRANSACTION (0.1ms)  BEGIN                                                                          
  Person Destroy (0.2ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 5]]                  
  TRANSACTION (0.2ms)  COMMIT                                                                         
  TRANSACTION (0.1ms)  BEGIN                                                                          
  Person Destroy (0.2ms)  DELETE FROM "people" WHERE "people"."id" = $1  [["id", 6]]
  TRANSACTION (0.2ms)  COMMIT
 => 
[#<Person:0x00000001109db4d8
  id: 1,
  first_name: "Joe",
  last_name: "Dirt",
  phone: "703-2918",
  created_at: Thu, 06 Oct 2022 16:39:22.768505000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:39:22.768505000 UTC +00:00>,
 #<Person:0x00000001109db410
  id: 2,
  first_name: "Ruby",
  last_name: "Rails",
  phone: "222-3128",
  created_at: Thu, 06 Oct 2022 16:40:12.237060000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:40:12.237060000 UTC +00:00>,
 #<Person:0x00000001109db348
  id: 4,
  first_name: "Mario",
  last_name: "Brother",
  phone: "335-3353",
  created_at: Thu, 06 Oct 2022 16:41:36.326426000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:41:36.326426000 UTC +00:00>,
 #<Person:0x00000001109db258
  id: 5,
  first_name: "Baby",
  last_name: "Yoda",
  phone: "555-7328",
  created_at: Thu, 06 Oct 2022 16:42:04.738359000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:42:04.738359000 UTC +00:00>,
 #<Person:0x00000001109db0c8
  id: 6,
  first_name: "Jeremy",
  last_name: "Duncan",
  phone: "225-3000",
  created_at: Thu, 06 Oct 2022 16:43:09.078445000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:47:01.964640000 UTC +00:00>] 
3.0.0 :027 > Person.all
  Person Load (0.3ms)  SELECT "people".* FROM "people"
 =>                                                           
[#<Person:0x0000000107b4dbd0                                  
  id: 3,                                                      
  first_name: "Java",                                         
  last_name: "Script",                                        
  phone: "111-1111",                                          
  created_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00>,
 #<Person:0x0000000107b4d248                                  
  id: 7,                                                      
  first_name: "Type",                                         
  last_name: "Script",                                        
  phone: "111-1111",                                          
  created_at: Thu, 06 Oct 2022 16:55:58.035616000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:55:58.035616000 UTC +00:00>] 
3.0.0 :028 > clear
(irb):28:in `<main>': undefined local variable or method `clear' for main:Object (NameError)
Did you mean?  caller         
3.0.0 :029 > 
3.0.0 :030 > 
3.0.0 :031 > 
3.0.0 :032 > 
3.0.0 :033 > 
3.0.0 :034 > 
3.0.0 :035 > 
3.0.0 :036 > 
3.0.0 :037 > 
3.0.0 :038 > 
3.0.0 :039 > 
3.0.0 :040 > 
3.0.0 :041 > 
3.0.0 :042 > 
3.0.0 :043 > 
3.0.0 :044 > 
3.0.0 :045 > 
3.0.0 :046 > 
3.0.0 :047 > 
3.0.0 :048 > 
3.0.0 :049 > 
3.0.0 :050 > 
3.0.0 :051 > 
3.0.0 :052 > 
3.0.0 :053 > 
3.0.0 :054 > 
3.0.0 :055 > 
3.0.0 :056 > Person.all
  Person Load (0.5ms)  SELECT "people".* FROM "people"
 =>                                                  
[#<Person:0x0000000116f70758                         
  id: 3,
  first_name: "Java",
  last_name: "Script",
  phone: "111-1111",
  created_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:40:40.179783000 UTC +00:00>,
 #<Person:0x0000000116f70690
  id: 7,
  first_name: "Type",
  last_name: "Script",
  phone: "111-1111",
  created_at: Thu, 06 Oct 2022 16:55:58.035616000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:55:58.035616000 UTC +00:00>] 
3.0.0 :057 > Person.save
/Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.4/lib/active_record/dynamic_matchers.rb:22:in `method_missing': undefined method `save' for Person:Class (NoMethodError)
3.0.0 :058 > Person.all.save
  Person Load (0.3ms)  SELECT "people".* FROM "people" /* loading for inspect */ LIMIT $1  [["LIMIT", 11]]
  Person Load (0.4ms)  SELECT "people".* FROM "people" /* loading for inspect */ LIMIT $1  [["LIMIT", 11]]
/Users/learnacademy/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.4/lib/active_record/relation/delegation.rb:110:in `method_missing': undefined method `save' for #<ActiveRecord::Relation [#<Person id: 3, first_name: "Java", last_name: "Script", phone: "111-1111", created_at: "2022-10-06 16:40:40.179783000 +0000", updated_at: "2022-10-06 16:40:40.179783000 +0000">, #<Person id: 7, first_name: "Type", last_name: "Script", phone: "111-1111", created_at: "2022-10-06 16:55:58.035616000 +0000", updated_at: "2022-10-06 16:55:58.035616000 +0000">]> (NoMethodError)                                                      
3.0.0 :059 > Person.find_each
 => #<Enumerator: ...> 
3.0.0 :060 > Person.find_each(&:save)
  Person Load (0.4ms)  SELECT "people".* FROM "people" ORDER BY "people"."id" ASC LIMIT $1  [["LIMIT", 1000]]
 => nil                                                                                  
3.0.0 :061 > Person.find_each(first_name:save)
(irb):61:in `<main>': undefined local variable or method `save' for main:Object (NameError)
3.0.0 :062 > 
                                                                                                                         