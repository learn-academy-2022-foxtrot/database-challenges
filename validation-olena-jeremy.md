# account.rb

``` ruby
class Account < ApplicationRecord
    has_many :addresses

    validates :username, :email, :password, presence: true
    validates :username, length: {minimum: 5}
    validates :username, :password, uniqueness: true
    validates :password, length: {minimum: 6}
    validates :password, format: { with: /\A(?=.*\d)/x, message: 'Must contain at least 1 number' }

end

```
# address.rb

```ruby

class Address < ApplicationRecord
    belongs_to :account

    validates :street_number, :street_name, :city, :state, :zip, presence: true
    validates :street_name, :street_number, :zip,  uniqueness: true
    validates :street_number, :zip, numericality: { message: 'Please, input numbers only', only_integer: true }
end

```
# account_spec.rb

``` ruby
require 'rails_helper'

RSpec.describe Account, type: :model do
 it 'is not valid without a username' do
  test = Account.create password:'139Ys', email:'ozjd@dmail.come'
  expect(test.errors[:username]).to_not be_empty
 end

 it 'is not valid without a password' do
  test = Account.create username:'Cho', email:'ozjd@dmail.come'
  expect(test.errors[:password]).to_not be_empty
 end

 it 'is not valid without an email' do
  test = Account.create username:'Cho', password: '139Ts'
  expect(test.errors[:email]).to_not be_empty
 end

 it 'is not valid if username has less than 5 characters' do
  test = Account.create username:'Cho', email:'ozjd@dmail.come', password: '139Ts'
  expect(test.errors[:username]).to_not be_empty
 end 

 it 'must contain a unique username' do
  Account.create username:'Choguuun', email:'ozjd@dmail.come', password: '139Ts0987'
  test = Account.create username:'Choguuun', email:'ozjd@dmail.come', password: '139Ts0987'
  expect(test.errors[:username]).to_not be_empty
 end 

 it 'is not valid if password has less than 6 characters' do
  test = Account.create username:'Choco', email:'ozjd@dmail.come', password: '139Ts'
  expect(test.errors[:password]).to_not be_empty
 end 

 it 'must contain a unique password' do
  Account.create username:'Choguuun', email:'ozjd@dmail.come', password: '139Ts0987'
  test = Account.create username:'Choguuun', email:'ozjd@dmail.come', password: '139Ts0987'
  expect(test.errors[:password]).to_not be_empty
 end 

 it 'password must contain at least one number' do
  test = Account.create username:'Samantha', email:'ozjd@dmail.come', password:'passwordA'
  expect(test.errors[:password]).to_not be_empty
 end

end

```

# address_spec.rb

```ruby

require 'rails_helper'

RSpec.describe Address, type: :model do
 it 'is not valid without street number' do
    new_user = Account.create username: 'Samantha', password: 'Password123',
    email: 'ert@gmail.com'

    new_address = new_user.addresses.create street_name: 'South Atr', city: 'San Diego', state: 'CA', zip: 123987

    expect(new_address.errors[:street_number]).to_not be_empty
  end

  it 'is not valid without street_name' do
    new_user = Account.create username: 'Samantha', password: 'Password123',
    email: 'ert@gmail.com'
  
    new_address = new_user.addresses.create street_number: 10123, city: 'San Diego', state: 'CA', zip: 123987
  
    expect(new_address.errors[:street_name]).to_not be_empty
  end

  it 'is not valid without city' do
    new_user = Account.create username: 'Samantha', password: 'Password123',
    email: 'ert@gmail.com'
  
    new_address = new_user.addresses.create street_number: 10123, street_name: 'South Str', state: 'CA', zip: 123987
  
    expect(new_address.errors[:city]).to_not be_empty
  end

  it 'is not valid without state' do
    new_user = Account.create username: 'Samantha', password: 'Password123',
    email: 'ert@gmail.com'
  
    new_address = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', zip: 123987
  
    expect(new_address.errors[:state]).to_not be_empty
  end

  it 'is not valid without zip' do
    new_user = Account.create username: 'Samantha', password: 'Password123',
    email: 'ert@gmail.com'
  
    new_address = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', state: 'CA'
  
    expect(new_address.errors[:zip]).to_not be_empty
  end

  it 'street name is unique' do
    new_user = Account.create username: 'Samantha', password: 'Password123',
    email: 'ert@gmail.com'
  
    new_address = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', state: 'CA', zip: 987345, account_id: 1

    new_address2 = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', state: 'CA', zip: 987345, account_id: 1

    new_address3 = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', state: 'CA', zip: 987345, account_id: 1
    expect(new_address3.errors[:street_name]).to_not be_empty
  end


  it 'street number is unique ' do
    new_user = Account.create username: 'Samantha', password: 'Password123',
    email: 'ert@gmail.com'
  
    new_address = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', state: 'CA', zip: 987345, account_id: 1

    new_address2 = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', state: 'CA', zip: 987345, account_id: 1

    new_address3 = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', state: 'CA', zip: 987345, account_id: 1
    expect(new_address3.errors[:street_number]).to_not be_empty
  end


  it 'zip is unique ' do
    new_user = Account.create username: 'Samantha', password: 'Password123',
    email: 'ert@gmail.com'
  
    new_address = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', state: 'CA', zip: 987345, account_id: 1

    new_address2 = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', state: 'CA', zip: 987345, account_id: 1

    new_address3 = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', state: 'CA', zip: 987345, account_id: 1
    expect(new_address3.errors[:zip]).to_not be_empty
  end

  
  it 'street number is an integer' do
    new_user = Account.create username: 'Samantha', password: 'Password123',
    email: 'ert@gmail.com'
  
    new_address = new_user.addresses.create street_number: 'five', street_name: 'South Str', city: 'San Diego', state: 'CA', zip: 987345, account_id: 1

    expect(new_address.errors[:street_number]).to_not be_empty
  end

  it 'street  zip is an integer' do
    new_user = Account.create username: 'Samantha', password: 'Password123',
    email: 'ert@gmail.com'
  
    new_address = new_user.addresses.create street_number: 10123, street_name: 'South Str', city: 'San Diego', state: 'CA', zip: 'tenten', account_id: 1

    expect(new_address.errors[:zip]).to_not be_empty
  end

end

```