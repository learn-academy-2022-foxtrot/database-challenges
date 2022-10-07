Banking Challenge
Setup
Create a new rails application and database
Create a model for owner
An owner has a name and address, and can have multiple credit cards
Create a model for credit card
A credit card has a number, an expiration date, and an owner

```ruby
ActiveRecord::Schema[7.0].define(version: 2022_10_07_183600) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credit_cards", force: :cascade do |t|
    t.integer "number"
    t.string "expiration_date"
    t.string "owner_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
    t.integer "credit_limit"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "num_of_credit_cards"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
```
Challenges
Create three owners and save them in the database
```ruby
[#<Owner:0x00000001254e8dd0                                  
  id: 1,                                                     
  name: "Guan",                                              
  address: "2846 Johnston st Los Angeles CA",                
  num_of_credit_cards: 6,                                    
  created_at: Fri, 07 Oct 2022 17:38:16.897131000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 17:38:16.897131000 UTC +00:00>,
 #<Owner:0x00000001254e8d08                                  
  id: 2,                                                     
  name: "John",                                              
  address: "4839 Main st Los Angeles CA",                    
  num_of_credit_cards: 2,                                    
  created_at: Fri, 07 Oct 2022 17:39:37.716094000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 17:39:37.716094000 UTC +00:00>,
 #<Owner:0x00000001254e8c40
  id: 3,
  name: "Kyle",
  address: "2848 Broadway st Los Angeles CA",
  num_of_credit_cards: 4,
  created_at: Fri, 07 Oct 2022 17:40:34.712015000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 17:40:34.712015000 UTC +00:00>]
``` 
Create a credit card in the database for each owner
```ruby
[#<CreditCard:0x0000000107880b00                         
  id: 1,
  number: 76562376,
  expiration_date: nil,
  owner_name: nil,
  created_at: Fri, 07 Oct 2022 18:03:09.193144000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:03:09.193144000 UTC +00:00,
  owner_id: 1>,
 #<CreditCard:0x0000000107880a38
  id: 2,
  number: 23456784,
  expiration_date: nil,
  owner_name: nil,
  created_at: Fri, 07 Oct 2022 18:05:31.188069000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:05:31.188069000 UTC +00:00,
  owner_id: 2>,
 #<CreditCard:0x0000000107880970
  id: 3,
  number: 374659365,
  expiration_date: "feb 2022",
  owner_name: nil,
  created_at: Fri, 07 Oct 2022 18:08:36.855021000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:08:36.855021000 UTC +00:00,
  owner_id: 1>,
 #<CreditCard:0x00000001078808a8
  id: 4,
  number: 374659,
  expiration_date: "feb 2022",
  owner_name: nil,
  created_at: Fri, 07 Oct 2022 18:09:10.625743000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:09:10.625743000 UTC +00:00,
  owner_id: 1>,
 #<CreditCard:0x00000001078807e0
  id: 5,
  number: nil,
  expiration_date: nil,
  owner_name: "gchan",
  created_at: Fri, 07 Oct 2022 18:23:10.328192000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:23:10.328192000 UTC +00:00,
  owner_id: 1>,
 #<CreditCard:0x0000000107880718
  id: 6,
  number: 53647483,
  expiration_date: "Jan 2026",
  owner_name: "ghchan",
  created_at: Fri, 07 Oct 2022 18:24:27.651731000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:24:27.651731000 UTC +00:00,
  owner_id: 1>,
 #<CreditCard:0x0000000107880650
  id: 7,
  number: 34453245,
  expiration_date: "Dec 3030",
  owner_name: "John",
  created_at: Fri, 07 Oct 2022 18:33:11.803914000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:33:11.803914000 UTC +00:00,
  owner_id: 2>] 
```

Add two more credit cards to one of the owners

```ruby
[#<CreditCard:0x0000000116320980                                                
  id: 1,                                                                        
  number: 76562376,                                                             
  expiration_date: nil,                                                         
  owner_name: nil,                                                              
  created_at: Fri, 07 Oct 2022 18:03:09.193144000 UTC +00:00,                   
  updated_at: Fri, 07 Oct 2022 18:03:09.193144000 UTC +00:00,                   
  owner_id: 1>,                                                                 
 #<CreditCard:0x0000000116320818                                                
  id: 3,                                                                        
  number: 374659365,                                                            
  expiration_date: "feb 2022",                                                  
  owner_name: nil,
  created_at: Fri, 07 Oct 2022 18:08:36.855021000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:08:36.855021000 UTC +00:00,
  owner_id: 1>,
 #<CreditCard:0x00000001163206b0
  id: 4,
  number: 374659,
  expiration_date: "feb 2022",
  owner_name: nil,
  created_at: Fri, 07 Oct 2022 18:09:10.625743000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:09:10.625743000 UTC +00:00,
  owner_id: 1>,
 #<CreditCard:0x0000000116320548
  id: 5,
  number: nil,
  expiration_date: nil,
  owner_name: "gchan",
  created_at: Fri, 07 Oct 2022 18:23:10.328192000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:23:10.328192000 UTC +00:00,
  owner_id: 1>,
 #<CreditCard:0x00000001163203e0
  id: 6,
  number: 53647483,
  expiration_date: "Jan 2026",
  owner_name: "ghchan",
  created_at: Fri, 07 Oct 2022 18:24:27.651731000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:24:27.651731000 UTC +00:00,
  owner_id: 1>] 
```
Stretch Challenge

Add a credit limit to each card

guanc =CreditCard.where owner_id: 1
guanc.update(credit_limit: 100000)

```ruby
[#<CreditCard:0x000000012d7084f0
  id: 1,
  number: 76562376,
  expiration_date: nil,
  owner_name: nil,
  created_at: Fri, 07 Oct 2022 18:03:09.193144000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:49:49.825919000 UTC +00:00,
  owner_id: 1,
  credit_limit: 100000>,
 #<CreditCard:0x000000012d708428
  id: 3,
  number: 374659365,
  expiration_date: "feb 2022",
  owner_name: nil,
  created_at: Fri, 07 Oct 2022 18:08:36.855021000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:49:49.834180000 UTC +00:00,
  owner_id: 1,
  credit_limit: 100000>,
 #<CreditCard:0x000000012d708360
  id: 4,
  number: 374659,
  expiration_date: "feb 2022",
  owner_name: nil,
  created_at: Fri, 07 Oct 2022 18:09:10.625743000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:49:49.836369000 UTC +00:00,
  owner_id: 1,
  credit_limit: 100000>,
 #<CreditCard:0x000000012d708298
  id: 5,
  number: nil,
  expiration_date: nil,
  owner_name: "gchan",
  created_at: Fri, 07 Oct 2022 18:23:10.328192000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:49:49.838486000 UTC +00:00,
  owner_id: 1,
  credit_limit: 100000>,
 #<CreditCard:0x000000012d7081d0
  id: 6,
  number: 53647483,
  expiration_date: "Jan 2026",
  owner_name: "ghchan",
  created_at: Fri, 07 Oct 2022 18:24:27.651731000 UTC +00:00,
  updated_at: Fri, 07 Oct 2022 18:49:49.840551000 UTC +00:00,
  owner_id: 1,
  credit_limit: 100000>] 
  ```

Find the total credit extended to the owner with multiple credit cards
```ruby
> guanc.sum(:credit_limit)

 => Ð 500000  (baller)
 ```
