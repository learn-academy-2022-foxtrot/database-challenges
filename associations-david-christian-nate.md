Challenges

Create three owners and save them in the database
Owner.create(name:"Billy Bob", address:"123 1st ave", credit_card:"Visa")
Owner.create(name:"Jilly Bob", address:"124 1st ave", credit_card:"Visa")
Owner.create(name:"Nilly Bob", address:"125 1st ave", credit_card:"Visa")

Create a credit card in the database for each owner
billy.credit_cards.create(card_number:12345678, expiration_date:"09
/26", owner_id:"Billy Bob")

Add two more credit cards to one of the owners
billy.credit_cards.create(card_number:3434298, expiration_date:"02/
24", owner_id:"Billy Bob")


Stretch Challenge

Add a credit limit to each card
card1 = CreditCard.first
card1.credit_limit = "5,000"
card1.save

Find the total credit extended to the owner with multiple credit cards
