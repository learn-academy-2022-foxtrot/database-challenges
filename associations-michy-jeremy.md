### Create a new rails application and database
```ruby
rails new banking -d postgresql -T
```
--- 

# Create a model for owner
```ruby
rails g model Owner name:string address:string
```
# An owner has a name and address, and can have multiple credit cards
# Create a model for credit card
# A credit card has a number, an expiration date, and an owner



## Challenges
## Create three owners and save them in the database
```ruby
Owner.create(name:'Joe', address:'123 Street lane')
Owner.create(name:'Ricky', address:'1313 Elm Street')
Owner.create(name:'Morty', address:'2000 PickleRick Street')
```
## Create a credit card in the database for each owner
```ruby
joe.credit_cards.create(number: '1234 5678 9101', expiration: '01/24')
ricky.credit_cards.create(number: '2468 1012 1416', expiration: '02/24')
morty.credit_cards.create(number: '6969 6969 6969', expiration: '03/24')
```
## Add two more credit cards to one of the owners
```ruby
morty.credit_cards.create(number: '000 000 000 ', expiration: '03/99')
morty.credit_cards.create(number: '700 800 900 ', expiration: '43/24')
```
# Stretch Challenge
## Add a credit limit to each card
```ruby
rails g migration add_credit_limit

cc1 = CreditCard.find(1)
cc1.credit_limit = 1000.00
cc1.save

cc2 = CreditCard.find(2)
cc2.credit_limit = 2000.00
cc2.save

cc3 = CreditCard.find(3)
cc3.credit_limit = 3000.00
cc3.save

cc4 = CreditCard.find(4)
cc4.credit_limit = 4000.00
cc4.save

cc5 = CreditCard.find(5)
cc5.credit_limit = 5000.00
cc5.save
```
## Find the total credit extended to the owner with multiple credit cards
Two ways of doing this:
```ruby
morty = Owner.find(3)
morty.credit_cards.sum(:credit_limit)
```
And
```ruby
 Owner.find(3).credit_cards.sum(:credit_limit)
 ```
