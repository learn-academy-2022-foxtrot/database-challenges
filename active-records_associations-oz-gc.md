# Setup
# Create a new rails application and database
Created database 'my_app_development'
Created database 'my_app_test'

# Create a model for owner
# An owner has a name and address, and can have multiple credit cards   
      invoke  active_record
      create    db/migrate/20221007174627_create_owners.rb
      create    app/models/owner.rb

# Create a model for credit card
# A credit card has a number, an expiration date, and an owner 
invoke  active_record
      create    db/migrate/20221007180356_create_credit_cards.rb
      create    app/models/credit_card.rb


Challenges

# Create three owners and save them in the database
[#<Owner:0x0000000112b1c430                                  
  id: 1,                                                     
  name: "John Sm",                                           
  address: "1098 Cr Street",                                 
  credit_card: "123456",                                     
  created_at: Fri, 07 Oct 2022 18:15:55.771821000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:15:55.771821000 UTC +00:00>,
 #<Owner:0x0000000112b1c278                                  
  id: 2,                                                     
  name: "John D",                                            
  address: "12345 Ot Street",                                
  credit_card: "56789",                                      
  created_at: Fri, 07 Oct 2022 18:18:11.281350000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:18:11.281350000 UTC +00:00>,
 #<Owner:0x0000000112b1c188
  id: 3,
  name: "JuleeN",
  address: "8976 HP Av",
  credit_card: "123098",
  created_at: Fri, 07 Oct 2022 18:19:16.977455000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:19:16.977455000 UTC +00:00>] 

# Create a credit card in the database for each owner
#<CreditCard:0x0000000112a9f138                                                                             
 id: 1,                                                                                                     
 number: 56789,                                                                                             
 an_expiration_date: "07/09/2022",                                                                          
 owner: "John D",                                                 
 created_at: Fri, 07 Oct 2022 18:31:32.951001000 UTC +00:00,      
 updated_at: Fri, 07 Oct 2022 18:31:32.951001000 UTC +00:00>      
3.0.0 :009 > CreditCard.create(number: "123098", an_expiration_date: "10/09/2023", owner: "JuleenN")
  TRANSACTION (0.2ms)  BEGIN
  CreditCard Create (0.4ms)  INSERT INTO "credit_cards" ("number", "an_expiration_date", "owner", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["number", 123098], ["an_expiration_date", "10/09/2023"], ["owner", "JuleenN"], ["created_at", "2022-10-07 18:34:05.599914"], ["updated_at", "2022-10-07 18:34:05.599914"]]
  TRANSACTION (0.2ms)  COMMIT
 => 
#<CreditCard:0x000000011156dc38
 id: 2,
 number: 123098,
 an_expiration_date: "10/09/2023",
 owner: "JuleenN",
 created_at: Fri, 07 Oct 2022 18:34:05.599914000 UTC +00:00,
 updated_at: Fri, 07 Oct 2022 18:34:05.599914000 UTC +00:00> 
3.0.0 :010 >  CreditCard.create(number: "123456", an_expiration_date: "10/09/2024", owner: "John Sm")
  TRANSACTION (0.2ms)  BEGIN
  CreditCard Create (0.7ms)  INSERT INTO "credit_cards" ("number", "an_expiration_date", "owner", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["number", 123456], ["an_expiration_date", "10/09/2024"], ["owner", "John Sm"], ["created_at", "2022-10-07 18:35:54.611107"], ["updated_at", "2022-10-07 18:35:54.611107"]]
  TRANSACTION (4.1ms)  COMMIT                                                                                      
 =>                                                                                                                
#<CreditCard:0x00000001129d33f8                                                                                    
 id: 3,                                                                                                            
 number: 123456,                                                                                                   
 an_expiration_date: "10/09/2024",                                                                                 
 owner: "John Sm",                                                                                                 
 created_at: Fri, 07 Oct 2022 18:35:54.611107000 UTC +00:00,                                                       
 updated_at: Fri, 07 Oct 2022 18:35:54.611107000 UTC +00:00>                                                       
3.0.0 :011 > 


Add two more credit cards to one of the owners

Stretch Challenge
Add a credit limit to each card
Find the total credit extended to the owner with multiple credit cards