```ruby
Create a new rails application and database
=> $ rails new banking_app -d postgresql -T

Create a model for owner
An owner has a name and address, and can have multiple credit cards
=> $ rails generate model Owner name:string address:string credit_cards:string

Create a model for credit card
A credit card has a number, an expiration date, and an owner
=> $ rails g model Credit_Card cc_number:string exp_date:date owner_id:integer 

Challenges
Create three owners and save them in the database
 id: 1,                                                     
  name: "Matthew",                                           
  address: "45960 Blah Way", 
 id: 2,                                                     
  name: "Elmo",                                              
  address: "1234 Sesame Street",   
 id: 3,
  name: "Scary Terry",
  address: "9456 Nightmare Lane",


Create a credit card in the database for each owner
Add two more credit cards to one of the owners
[#<CreditCard:0x000000011cdb3928                                  
  id: 1,                                                          
  cc_number: "54327-5432-5432-55432",                             
  exp_date: nil,                                                  
  owner_id: 1   
 #<CreditCard:0x000000012c701368                                  
  id: 2,                                                          
  cc_number: "54325-5765-7658-1435",                              
  exp_date: nil,                                                  
  owner_id: 2
 #<CreditCard:0x000000012c7012a0
  id: 3,
  cc_number: "4455-6159-1547-6325",
  exp_date: nil,
  owner_id: 3
 #<CreditCard:0x000000012c7011d8
  id: 4,
  cc_number: "4455-6159-1547-4879",
  exp_date: nil,
  owner_id: 1
 #<CreditCard:0x000000012c701110
  id: 5,
  cc_number: "4455-6159-2874-4879",
  exp_date: nil,
  owner_id: 1>] 


Stretch Challenge
Add a credit limit to each card

Find the total credit extended to the owner with multiple credit cards
```