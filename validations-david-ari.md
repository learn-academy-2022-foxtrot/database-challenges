Validations Challenges

Create a Rails application called company_contacts. The app will have a PostgreSQL database.
```ruby
rails new company_contacts -d postgresql -T
cd company_contacts
rails db:create
bundle add rspec-rails
rails generate rspec:install
rails db:migrate
```
Generate a model called Account that has a username, a password, and an email.
```ruby
rails g model Account username:string password:string email:string
rails db:migrate
```
All stories should have accompanying model specs.
Developer Stories

As a developer, I need username, password, and email to be required.
```ruby
# account_spec.rb
require 'rails_helper'

RSpec.describe Account, type: :model do
  it "is not valid without a username" do
    user = Account.create(password:"coolPassword", email:"coolperson@gmail.com")
    expect(user.errors[:username]).to_not be_empty
  end
  it "is not valid without a password" do
    user = Account.create(username:"cooldude", email:"coolperson@gmail.com")
    expect(user.errors[:password]).to_not be_empty
  end
  it "is not valid without a email" do
    user = Account.create(username:"cooldude", password:"coolstuff")
    expect(user.errors[:email]).to_not be_empty
  end
end

# account.rb
class Account < ApplicationRecord
  validates :username, :password, :email, presence: true
end


```
As a developer, I need every username to be at least 5 characters long.
```ruby
# account_spec.rb
  it "is not valid if password is less than five characters" do
    user = Account.create(username:"cool" , password:"coolguy", email:"coolperson@gmail.com")
    expect(user.errors[:username]).to_not be_empty
  end

  # account.rb
class Account < ApplicationRecord
  validates :username, :password, :email, presence: true
  validates :username, length: {minimum: 5}
end


```
As a developer, I need each username to be unique.
```ruby
# account_spec.rb
  it "is not valid if each username is not unique" do
    Account.create(username:"cooldude" , password:"coolguy", email:"coolperson@gmail.com")
    user = Account.create(username:"cooldude" , password:"coolguy", email:"coolperson@gmail.com")
    expect(user.errors[:username]).to_not be_empty
  end
end

 # account.rb
  validates :username, uniqueness: true

```
As a developer, I need each password to be at least 6 characters long.
```ruby
# account_spec.rb
  it "is not valid if the password is less than 6 characters" do
    user = Account.create(username:"cooldude", password:"cool", email:"coolperson@gmail.com")
    expect(user.errors[:password]).to_not be_empty
  end

 # account.rb
validates :password, length: {minimum: 6} 
```
As a developer, I need each password to be unique.
```ruby
# account_spec.rb
  it "is not valid if each password is not unique" do
    Account.create(username:"cooldude1" , password:"coolguy", email:"coolperson@gmail.com")
    user = Account.create(username:"cooldude" , password:"coolguy", email:"coolperson@gmail.com")
    expect(user.errors[:password]).to_not be_empty
  end

# account.rb
validates :password, uniqueness: true
```
As a developer, I want my Account model to have many associated Addresses.
As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
```ruby
rails g model Addresses street_number:integer street_name:string city:string state:string zip:integer account_id:integer 
rails db:migrate
```

As a developer, I want to validate the presence of all fields on Address.
```ruby
# address_spec.rb
RSpec.describe Address, type: :model do
  it "is not valid without a street number" do
    user = Account.create(username:'coolguy', password:'coolpassword', email:'coolguy@gmail.com')
    address = user.addresses.create(street_name:'cool court', city:'cool town', state:'cool', zip: 12345)
    expect(address.errors[:street_number]).to_not be_empty
  end
  it "is not valid without a street name" do
    user = Account.create(username:'coolguy', password:'coolpassword', email:'coolguy@gmail.com')
    address = user.addresses.create(street_number: 123, city:'cool town', state:'cool', zip: 12345)
    expect(address.errors[:street_name]).to_not be_empty
  end
  it "is not valid without a city" do
    user = Account.create(username:'coolguy', password:'coolpassword', email:'coolguy@gmail.com')
    address = user.addresses.create(street_number: 123, street_name: "cool court", state:'cool', zip: 12345)
    expect(address.errors[:city]).to_not be_empty
  end
  it "is not valid without a state" do
    user = Account.create(username:'coolguy', password:'coolpassword', email:'coolguy@gmail.com')
    address = user.addresses.create(street_number: 123, street_name: 'cool court', city:'cool town', zip: 12345)
    expect(address.errors[:state]).to_not be_empty
  end
  it "is not valid without a zip" do
    user = Account.create(username:'coolguy', password:'coolpassword', email:'coolguy@gmail.com')
    address = user.addresses.create(street_number: 123, street_name: 'cool court', city:'cool town', state:'cool')
    expect(address.errors[:zip]).to_not be_empty
  end
end

# address.rb

class Address < ApplicationRecord
  belongs_to :account
  validates :street_number, :street_name, :city, :state, :zip, presence: true
end
```

Stretch Challenges

As a developer, I need each Account password to have at least one number.
```ruby
# account_spec.rb
  it "is not valid unless the password contains at least 1 number" do
    user = Account.create(username:"cooldude", password:"coolpass", email:"coolperson@gmail.com")
    expect(user.errors[:password]).to_not be_empty
  end

  # account.rb
  # validates :password, format: {with: /\A(?=.*\d)/x}
  
  validate :validate_pass

  def validate_pass
    if password.nil?
      errors.add(:password, "you need a password")
    else 
      errors.add(:password, "Password must contain at least one number.") unless password.match(/[0-9]/)
    end
  end
```

As a developer, I want to validate that Address street_number, street_name, zip are unique for within an account.
HINT: Read about :scope in the Active Record validation docs.
```ruby

```
As a developer, I want to validate that the Address street_number and zip are numbers.
HINT: Read about numericality in the Active Record validation docs.
```ruby

```
As a developer, I want to see a custom error message that says "Please, input numbers only" if street_number or zip code are not numbers.
HINT: Read about message in the validation docs.
```ruby

```
