# account.rb

``` ruby
class Account < ApplicationRecord
    validates :username, :email, :password, presence: true
    validates :username, length: {minimum: 5}
    validates :username, uniqueness: true
    validates :password, length: {minimum: 6}

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
end

```