# account_spec.rb
```ruby
require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is not valid without a username' do
    scully = Account.create password:'Foxtrot2022', email: 'foxtrot@learn.com'
    expect(scully.errors[:username]).to_not be_empty
  end

  it 'is not valid unless username is at least 5 characters long' do
    scully = Account.create username:'user', password:'Foxtrot2022', email:'foxtrot@learn.com'
    expect(scully.errors[:username]).to_not be_empty
  end

  it 'does not allow duplicate usernames' do
    Account.create(username: 'user', password: 'Foxtrot2022', email: 'foxtrot@learn.com')
    scully = Account.create username:'user', password:'Foxtrot2022', email:'foxtrot@learn.com'
    expect(scully.errors[:username]).to_not be_empty
  end

  it 'is not valid without a password' do
    scully = Account.create username:'Foxtrot2022', email:'foxtrot@learn.com'
    expect(scully.errors[:password]).to_not be_empty
  end

  it 'is not valid unless password is at least 6 characters long' do
    scully = Account.create username:'Foxtrot2022', password:'foxtr', email:'foxtrot@learn.com'
    expect(scully.errors[:password]).to_not be_empty
  end

  it 'does not allow duplicate passwords' do
    Account.create(username: 'userb', password: 'Foxtrot2022', email: 'foxtrot@learn.com')
    scully = Account.create username:'userb', password:'Foxtrot2022', email:'foxtrot@learn.com'
    expect(scully.errors[:password]).to_not be_empty
  end

  it 'is not valid without a emails' do
    scully = Account.create username:'Foxtrot2022', password: 'foxtrot@learn.com'
    expect(scully.errors[:email]).to_not be_empty
  end
end
```

# account.rb
```ruby
class Account < ApplicationRecord
    has_many  :addresses
    validates :username, presence: true
    validates :username, length: {minimum:5}
    validates :username, uniqueness:true
    validates :password, presence: true
    validates :password, length: {minimum:6}
    validates :password, uniqueness:true
    validates :email, presence: true
end
```

# address_spec.rb
```ruby
require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'is not valid without a street number' do
    scully = Address.create street_name:'Main Street', city:'San Diego', state: 'CA', zip_code:92115
    expect(scully.errors[:street_number]).to_not be_empty
  end

  it 'is not valid without a street name' do
    scully = Address.create street_number:123, city:'San Diego', state: 'CA', zip_code:92115
    expect(scully.errors[:street_name]).to_not be_empty
  end

  it 'is not valid without a city name' do
    scully = Address.create street_number:123, state: 'CA', zip_code:92115
    expect(scully.errors[:city]).to_not be_empty
  end

  it 'is not valid without a state name' do
    scully = Address.create street_number:123, city:'San Diego', zip_code:92115
    expect(scully.errors[:street_name]).to_not be_empty
  end

  it 'is not valid without a zip code' do
    scully = Address.create street_number:123, city:'San Diego'
    expect(scully.errors[:zip_code]).to_not be_empty
  end

end
```

# address.rb
```ruby
class Address < ApplicationRecord
    belongs_to :account
    validates :street_number, presence: true
    validates :street_name, presence: true
    validates :city, presence: true
    validates :state, presence: true
    validates :zip_code, presence: true
end