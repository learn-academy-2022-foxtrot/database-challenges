<!-- Validations Challenges

Create a Rails application called company_contacts. The app will have a PostgreSQL database.

Generate a model called Account that has a username, a password, and an email.

All stories should have accompanying model specs. -->

$ rails g model Account username:string password:string email:string

$ rails s

As a developer, I need username, password, and email to be required.
As a developer, I need every username to be at least 5 characters long.
As a developer, I need each username to be unique.
As a developer, I need each password to be at least 6 characters long.
As a developer, I need each password to be unique.
As a developer, I want my Account model to have many associated Addresses.
As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
As a developer, I want to validate the presence of all fields on Address.

Account.rspec
require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is valid with a username, password, and email' do
    account = Account.create(username:'scullyd', password:'scullyistheman', email:'scullydisel@gmail.com')
  expect(account).to be_valid
  end

  it 'is not valid without a username' do
    account = Account.create(password:'scullyistheman', email:'scullydisel@gmail.com')
    expect(account.errors[:username]).to_not be_empty
  end

  it 'is not valid without a password' do
    account = Account.create(username:'scullyd', email:'scullydisel@gmail.com')
    expect(account.errors[:password]).to_not be_empty
  end

  it 'is not valid without a email' do
    account = Account.create(username:'scullyd', password:'scullyistheman')
    expect(account.errors[:email]).to_not be_empty
  end

  it 'is not valid if username is less than 5 characters' do
    account = Account.create(username:'scul', password:'scullyistheman', email:'scullydisel@gmail.com')
    expect(account.errors[:username]).to_not be_empty
  end

  it 'does not allow duplicate usernames' do
    Account.create(username:'scullyd', password:'scullyistheman', email:'scullydisel@gmail.com') 
    account = Account.create(username:'scullyd', password:'scullyistheman', email:'scullydisel@gmail.com')
    expect(account.errors[:username]).to_not be_empty
  end

  it 'is not valid if password is less than 6 characters' do
    account = Account.create(username:'scully', password:'scull', email:'scullydisel@gmail.com')
    expect(account.errors[:password]).to_not be_empty
  end

  it 'does not allow duplicate passwords' do
    Account.create(username:'scullyd', password:'scullyistheman', email:'scullydisel@gmail.com') 
    account = Account.create(username:'scullyd', password:'scullyistheman', email:'scullydisel@gmail.com')
    expect(account.errors[:password]).to_not be_empty
  end
end

Address.rspec
require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'is valid with a street_number, street_name, city, state, and zip' do
    address = Address.create(street_number: 123, street_name: "gang ave", city: "compton", state: "california", zip: 91100)
  expect(address).to be_valid
  end
end