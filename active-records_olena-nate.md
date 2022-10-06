Set Up

Create a new Rails app named 'rolodex_challenge'.
Create the database. The output in the terminal should look like this:
Created database 'rolodex_development'
Created database 'rolodex_test'
Generate a model called Person with a first_name, last_name, and phone. All fields should be strings.

# rails generate model Person first_name:string last_name:string phone:string 

  rolodex_challenge git:(main) ✗ rails generate model Person first_name:string last_name:string phone:string
      invoke  active_record
      create    db/migrate/20221006163202_create_people.rb
      create    app/models/person.rb

Run a migration to set up the database.
# rails db:migrate

OUTPUT
➜  rolodex_challenge git:(main) ✗ rails db:migrate
== 20221006163202 CreatePeople: migrating =====================================
-- create_table(:people)
   -> 0.0100s
== 20221006163202 CreatePeople: migrated (0.0101s) ============================


Open up Rails console.
# rails c
➜  rolodex_challenge git:(main) ✗ rails c
Loading development environment (Rails 7.0.4)
3.0.0 :001 > 

Actions

Add five family members into the Person table in the Rails console.
# > Person.all
  Person Load (1.1ms)  SELECT "people".* FROM "people"
 => []                                                        
3.0.0 :002 > 

# Person.create(first_name: 'Olena', last_name: 'Zheliabina', phone: '55555555')
# Person.create(first_name: 'Nate', last_name: 'Ross', phone: '444444444')
# Person.create(first_name: 'Cho', last_name: 'Ron', phone: '111111111')
# Person.create(first_name: 'Yun', last_name: 'Smith', phone: '3333333333')
# Person.create(first_name: 'John', last_name: 'Dohe', phone: '222222222')

Retrieve all the items in the database.
# Person.all

Add yourself to the Person table.

# Person.create(first_name: 'Alex', last_name: 'Zheliabina', phone: '22222200000')

Retrieve all the entries that have the same last_name as you.
# Person.where(last_name: 'Zheliabina')

Update the phone number of the last entry in the database.
# phone_number = Person.find 6
# phone_number.phone = '77777777777'
# phone_number.save

Retrieve the first_name of the third Person in the database.
# Person.where(id: 3).select(:id, :first_name)


Stretch Challenges

Update all the family members with the same last_name as you, to have the same phone number as you.
# Person.where(last_name: 'Zheliabina').update(phone: '55555555')

Remove all family members that do not have your last_name


Person.where.not(last_name: 'Zheliabina')
