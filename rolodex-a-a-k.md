Challenge: Rolodex
As a developer, I have been tasked with creating a database model that will be used in a rolodex application. I want to ensure that the database behaves as expected and the necessary actions can be performed on the database instances.

Set Up

Create a new Rails app named 'rolodex_challenge'.
```ruby
> rails new rolodex-athian-ari-kyle -d postgresql -T
```
Create the database. The output in the terminal should look like this:
Created database 'rolodex_development'
Created database 'rolodex_test'
Generate a model called Person with a first_name, last_name, and phone. All fields should be strings.
Run a migration to set up the database.
```ruby
> rails db:create
rails generate model Person first_name:string last_name:string phone:string
```
Open up Rails console.
```ruby
> rails c
```
Actions

Add five family members into the Person table in the Rails console.
```ruby
> Person.create(first_name: 'Thomas', last_name: 'Shelby', phone: '619-000-0000')
Person.create(first_name: 'John', last_name: 'Shelby', phone: '619-000-0001')
Person.create(first_name: 'Arthur', last_name: 'Shelby', phone: '619-000-0002')
Person.create(first_name: 'Finn', last_name: 'Gray', phone: '619-000-0003')
Person.create(first_name: 'Charlie', last_name: 'Gray', phone: '619-000-0004')
```
Retrieve all the items in the database.
```ruby
> Person.all
```
Add yourself to the Person table.
```ruby
> Person.create(first_name: 'Kyle', last_name: 'Le', phone: '619-000-0005')
```
Retrieve all the entries that have the same last_name as you.
```ruby
> Person.where last_name: 'Le'
```
Update the phone number of the last entry in the database.
```ruby
> Person.last 
newNum = Person.last
newNum.update(phone: '619-000-005')
```
Retrieve the first_name of the third Person in the database.
```ruby
> Person.third
findThirdName = Person.third
findThirdName.first_name
```
Stretch Challenges

Update all the family members with the same last_name as you, to have the same phone number as you.
```ruby
> lastName = Person.where last_name: 'Gray'
//lastName
lastName.update(phone: '619-000-0003')

```
Remove all family members that do not have your last_name.
```ruby
> lastNameLe = Person.where.not last_name: 'Le'
//lastNameLe
lastNameLe.destroy_all
//Person.all
```
