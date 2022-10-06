rails generate model Dog name:string breed:string age:integer
9:57
rails generate model Person first_name: "stanley" last_name:"squarepants" phone: 480-999-1234
9:57
$ rails db:migrate


Add five family members into the Person table in the Rails console.
Retrieve all the items in the database.
Add yourself to the Person table.
Retrieve all the entries that have the same last_name as you.
Update the phone number of the last entry in the database.
Retrieve the first_name of the third Person in the database.
10:25
rails generate model Person first_name: “Lavisha” last_name:“squarepants” phone: “8880907856” (put in in md file after)
10:27
db:migrate
10:28
rails generate model relative_two first_name: “Spongebob” last_name: “squarepants” phone: “8880907856”
10:29
db:migrate
10:32
rails generate model relative_friend first_name: “Athian” last_name: “squarepants” phone: “6665552894”
10:32
rails db:migrate