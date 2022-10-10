Create a Rails application called company_contacts. The app will have a PostgreSQL database.
Generate a model called Account that has a username, a password, and an email.
All stories should have accompanying model specs.
Developer Stories

```ruby
    rails g model Account username:string password:string email:string
    rails db:migrate
```

As a developer, I need username, password, and email to be required.
```ruby
    RSpec.describe Account, type: :model do
  it 'needs username, password, and email' do
    account = Account.create(username:'Learn123', password:'123ABC', email:'123@learn.com')
    expect(account).to be_valid
  end
end
```

As a developer, I need every username to be at least 5 characters long.
```ruby
it 'is not valid without minimum 5 characters' do
    account = Account.create(username:'1234')
    expect(account.errors[:username]).to_not be_empty
  end
```

As a developer, I need each username to be unique.
```ruby
 it 'is does allow duplicate usernames' do
    Account.create(username:'Learn123', password:'123ABC', email:'123@learn.com')
    account = Account.create(username:'Learn123', password:'123ABC', email:'123@learn.com')
    # account = Account.create(username:'Learn123', password:'123ABC', email:'123@learn.com')
    expect(account.errors[:username]).to_not be_empty
  end
```

As a developer, I need each password to be at least 6 characters long.
```ruby
 it 'is not valid if under 6 characters' do
    account = Account.create(password:'12345')
    expect(account.errors[:password]).to_not be_empty
  end
```

As a developer, I need each password to be unique.
```ruby
it 'is does allow duplicate password' do
    Account.create(username:'Learn123', password:'123ABC', email:'123@learn.com')
    account = Account.create(username:'Learn123', password:'123ABC', email:'123@learn.com')
    # account = Account.create(username:'Learn123', password:'123ABC', email:'123@learn.com')
    expect(account.errors[:password]).to_not be_empty
  end
```

As a developer, I want my Account model to have many associated Addresses.
```ruby
RSpec.describe Address, type: :model do
  it 'needs street_number, street_name, city, state, and zip' do
    address = Address.create(street_number:123, street_name:'first ave', city:'San Diego', state:'CA', zip:92121)
    expect(address).to be_valid
  end
end
```

As a developer, I want Address to have street_number, street_name, city, state, and zip attributes.
 The street_number and zip should be integers.
```ruby
RSpec.describe Address, type: :model do
  it 'needs street_number, street_name, city, state, and zip' do
    address = Address.create(street_number:123, street_name:'first ave', city:'San Diego', state:'CA', zip:92121)
    expect(address).to be_valid
  end
end
```

As a developer, I want to validate the presence of all fields on Address.
```ruby
class Address < ApplicationRecord
    belongs_to :account
    validates :street_number, :street_name, :city, :state, presence: true
end
```

Stretch Challenges

As a developer, I need each Account password to have at least one number.
HINT: Read about custom validations in the Active Record validation docs.
As a developer, I want to validate that Address street_number, street_name, zip are unique for within an account.
HINT: Read about :scope in the Active Record validation docs.
As a developer, I want to validate that the Address street_number and zip are numbers.
HINT: Read about numericality in the Active Record validation docs.
As a developer, I want to see a custom error message that says "Please, input numbers only" if street_number or zip code are not numbers.
HINT: Read about message in the validation docs.
