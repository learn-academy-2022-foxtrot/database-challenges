<!-- input -->
$ rails generate model Person first_name:string last_name:string phone_number:string
<!-- output -->
      invoke  active_record
      create    db/migrate/20221006162516_create_people.rb
      create    app/models/person.rb


<!-- input -->
rails db:migrate
<!-- output -->
== 20221006162516 CreatePeople: migrating =====================================
-- create_table(:people)
   -> 0.0075s
== 20221006162516 CreatePeople: migrated (0.0076s) ============================


input
Person.create first_name:"Billy", last_name:"Bob", phone_number:"123-456-7890"
Person.create first_name:"Sally", last_name:"Bob", phone_number:"123-456-7891"
Person.create first_name:"Joey", last_name:"Bob", phone_number:"123-456-7892"
Person.create first_name:"Nelly", last_name:"Bob", phone_number:"123-456-7893"
Person.create first_name:"Jim", last_name:"Bob", phone_number:"123-456-7894"

Person.all
output

[#<Person:0x0000000113233840                                  
  id: 1,                                                      
  first_name: "Billy",                                        
  last_name: "Bob",                                           
  phone_number: "123-456-7890",                               
  created_at: Thu, 06 Oct 2022 16:40:35.953653000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:40:35.953653000 UTC +00:00>,
 #<Person:0x0000000113233700                                  
  id: 2,                                                      
  first_name: "Sally",                                        
  last_name: "Bob",                                           
  phone_number: "123-456-7891",                               
  created_at: Thu, 06 Oct 2022 16:40:54.321929000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:40:54.321929000 UTC +00:00>,
 #<Person:0x0000000113233638
  id: 3,
  first_name: "Joey",
  last_name: "Bob",
  phone_number: "123-456-7892",
  created_at: Thu, 06 Oct 2022 16:41:03.938767000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:41:03.938767000 UTC +00:00>,
 #<Person:0x0000000113233570
  id: 4,
  first_name: "Nelly",
  last_name: "Bob",
  phone_number: "123-456-7893",
  created_at: Thu, 06 Oct 2022 16:41:03.962107000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:41:03.962107000 UTC +00:00>,
 #<Person:0x00000001132334a8
  id: 5,
  first_name: "Jim",
  last_name: "Bob",
  phone_number: "123-456-7894",
  created_at: Thu, 06 Oct 2022 16:41:03.964122000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 16:41:03.964122000 UTC +00:00>] 
3.0.0 :009 > 


input

Person.create first_name:"David", last_name:"Thomas", phone_number:"111-222-3333"

output
#<Person:0x0000000141ff28e0
 id: 6,
 first_name: "David",
 last_name: "Thomas",
 phone_number: "111-222-3333",
 created_at: Thu, 06 Oct 2022 16:45:13.537359000 UTC +00:00,
 updated_at: Thu, 06 Oct 2022 16:45:13.537359000 UTC +00:00> 
3.0.0 :010 > 


input

Person.where last_name: "Thomas"

output

[#<Person:0x00000001131e32f0                                                    
  id: 6,                                                                        
  first_name: "David",                                                          
  last_name: "Thomas",                                                          
  phone_number: "111-222-3333",                                                 
  created_at: Thu, 06 Oct 2022 16:45:13.537359000 UTC +00:00, 
  updated_at: Thu, 06 Oct 2022 16:45:13.537359000 UTC +00:00>] 


  input

  david = Person.find 6
  david.phone_number = "222-333-4444"
  david.save

  output
   
  Person Update (1.0ms)  UPDATE "people" SET "phone_number" = $1, "updated_at" = $2 WHERE "people"."id" = $3  [["phone_number", "222-333-4444"], ["updated_at", "2022-10-06 16:51:24.363467"], ["id", 6]]                             
  TRANSACTION (0.5ms)  COMMIT                                         
 => true


input

Person.find 3

output

id: 3,                                                                         
 first_name: "Joey",                                                            
 last_name: "Bob",                                                              
 phone_number: "123-456-7892",                                
 created_at: Thu, 06 Oct 2022 16:41:03.938767000 UTC +00:00,  
 updated_at: Thu, 06 Oct 2022 16:41:03.938767000 UTC +00:00>  


 input

 bob = Person.where(last_name: "Bob")
 bob.update(phone_number: "123-456-7890")

 output

 TRANSACTION (0.2ms)  BEGIN
  Person Update (0.4ms)  UPDATE "people" SET "phone_number" = $1, "updated_at" = $2 WHERE "people"."id" = $3  [["phone_number", "123-456-7890"], ["updated_at", "2022-10-06 17:14:49.283974"], ["id", 2]]               
  TRANSACTION (1.0ms)  COMMIT                           
  TRANSACTION (0.1ms)  BEGIN                            
  Person Update (0.2ms)  UPDATE "people" SET "phone_number" = $1, "updated_at" = $2 WHERE "people"."id" = $3  [["phone_number", "123-456-7890"], ["updated_at", "2022-10-06 17:14:49.286841"], ["id", 3]]               
  TRANSACTION (0.3ms)  COMMIT                           
  TRANSACTION (0.1ms)  BEGIN                            
  Person Update (0.3ms)  UPDATE "people" SET "phone_number" = $1, "updated_at" = $2 WHERE "people"."id" = $3  [["phone_number", "123-456-7890"], ["updated_at", "2022-10-06 17:14:49.288788"], ["id", 4]]               
  TRANSACTION (0.3ms)  COMMIT                           
  TRANSACTION (0.1ms)  BEGIN
  Person Update (0.3ms)  UPDATE "people" SET "phone_number" = $1, "updated_at" = $2 WHERE "people"."id" = $3  [["phone_number", "123-456-7890"], ["updated_at", "2022-10-06 17:14:49.291039"], ["id", 5]]
  TRANSACTION (0.3ms)  COMMIT


input

bob.destroy_all
