

<!-- Setup
Create a new rails application and database
$ rails new bank_app -d postgresql -T
$ cd bank_app
$rails db:create
$rails db:migrate
$rails c
Create a model for owner
An owner has a name and address, and can have multiple credit cards
$rails g model Owner name:string address:string credit_card:string

class CreateOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :address
      t.string :credit_card

      t.timestamps
    end
  end
end


--Create a model for credit card
A credit card has a number, an expiration date, and an owner -->
$rails g model CreditCard number:string, exp_date:string owner_name:string

class CreateCreditCards < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :exp_date
      t.string :owner_name

      t.timestamps
    end
  end
end

%  Person.create name: "Joe", phone: "555-3456"
% Person.all
<!-- Challenges
Create three owners and save them in the database
>Owner.create name: "Joe", address: "123 sesame street", credit_card: "1234-6789-2678-9999"
>Owner.create name: "elmo", address: "321 sesame street", credit_card: "1234-6789-2678-9000"
>Owner.create name: "Big Bird", address: "345 sesame street", credit_card: "1234-6789-3378-9000"
>exit
$rails db:migrate
$rails c

Create a credit card in the database for each owner
>CreditCard.create number: "1234-6789-2678-9999", exp_date: "01/26", owner_name: "Joe"
>CreditCard.create number: "1234-6789-2678-9000", exp_date: "08/30", owner_name: "elmo" 
>CreditCard.create number: "1234-6789-3378-9000", exp_date: "04/19", owner_name: "Big Bird" 
>exit
$rails db:migrate
$rails c
Add two more credit cards to one of the owners


Stretch Challenge
Add a credit limit to each card
Find the total credit extended to the owner with multiple credit cards -->
<!-- $ rails generate model Person name:string phone:string -->

