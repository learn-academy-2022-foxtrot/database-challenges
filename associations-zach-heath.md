Setup

Create a new rails application and database
// rails new associations -d postgresql -T
// cd associations
// rails db:create

Create a model for owner
An owner has a name and address, and can have multiple credit cards
//rails g model Owner name:string address:string cards:string
//rails db:migrate

Create a model for credit card
A credit card has a number, an expiration date, and an owner
//rails g model Card name:string exp:string owner:string



Challenges

Create three owners and save them in the database
//Owner.create(name:"Heath", address: "513 Lime Street", cards:"0")
//Owner.create(name:"Zack", address:"327 Lemon street", cards:"0")
//Owner.create(name:"Denny", address:"411 Salty Dog Street", cards:"0")

Create a credit card in the database for each owner
Add two more credit cards to one of the owners



Stretch Challenge
Add a credit limit to each card
Find the total credit extended to the owner with multiple credit cards