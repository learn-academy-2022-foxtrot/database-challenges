Create a new Rails app named 'rolodex_challenge'.

Create the database. The output in the terminal should look like this:
Created database 'rolodex_development'
Created database 'rolodex_test'

Generate a model called Person with a first_name, last_name, and phone. All fields should be strings.
```ruby
rails generate model Person first_name:string last_name:string phone:string
```

Run a migration to set up the database.

Open up Rails console.


Add five family members into the Person table in the Rails console.
```ruby
Person.create first_name: 'Black', last_name: 'Panther', phone: '1234567890'
Person.create first_name: 'Albert', last_name: 'Einstein', phone: '5469871230'
Person.create first_name: 'Elon', last_name: 'Musk', phone: '9876543210'
Person.create first_name: 'Justin', last_name: 'Rhodes', phone: '0123541524'
Person.create first_name: 'John', last_name: 'Chan', phone: '4561274159'
```
Retrieve all the items in the database.
```ruby
Person.all
```
Add yourself to the Person table.
```ruby
Person.create first_name: 'Matthew', last_name: 'Rhodes', phone: '7148558051'

Person.create first_name: 'Guan', last_name: 'Chan', phone: '5103842663'
```

Retrieve all the entries that have the same last_name as you.
```ruby
Person.where last_name: 'Rhodes'
Person.where last_name: 'Chan'
```
Update the phone number of the last entry in the database.
3.0.0 :015 > john.phone = '0000000000'
 => "0000000000" 
3.0.0 :016 > john.save

Retrieve the first_name of the third Person in the database.
```ruby
bp = Person.find 3
bp.first_name
 => "Black" 
```
Stretch Challenges
Update all the family members with the same last_name as you, to have the same phone number as you.
```ruby
Person.where(last_name: 'Chan').update_all phone:'5103842663'
```
Remove all family members that do not have your last_name.