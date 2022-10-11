# Set Up

# Create a new Rails app named 'rolodex_challenge'. 

# Create the database. The output in the terminal should look like this:
# Created database 'rolodex_development'
# Created database 'rolodex_test'

# Generate a model called Person with a first_name, last_name, and phone. All fields should be strings.


`$ rails generate model Person first_name:string last_name:string phone:integer`


# Run a migration to set up the database.
rails db:migrate

# Open up Rails console.
rails c


# Actions

# Add five family members into the Person table in the Rails console.

> Person.all 
> Person.create(first_name: 'Michy', last_name: 'H', phone: 911-911-9111)
> Person.create(first_name: 'Heath', last_name: 'H', phone: 911-911-9112)
> Person.create(first_name: 'Harry', last_name: 'Styles', phone: 909-311-4111)
> Person.create(first_name: 'Denny', last_name: 'W', phone: 636-734-7791)
> Person.create(first_name: 'Nala', last_name: 'H', phone: 805-411-9111)


# Retrieve all the items in the database.
> Person.all



# Add yourself to the Person table.
> Person.create(first_name: 'Jerry', last_name: 'Garcia', phone: 522-333-7777)
> Person.create(first_name: 'Taylor', last_name: 'Swift', phone: 888-555-4111)

# Retrieve all the entries that have the same last_name as you.
> Person.where(last_name: 'H')

# Update the phone number of the last entry in the database.
phone = Person.last 
phone.update(phone: 636-6363-6363)

# Retrieve the first_name of the third Person in the database.

Person.find(3)
=> harry styles


# Stretch Challenges

# Update all the family members with the same last_name as you, to have the same phone number as you.

Person.find(last_name: 'H')


# Remove all family members that do not have your last_name.
