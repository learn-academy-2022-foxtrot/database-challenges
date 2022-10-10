Create a Rails application called company_contacts. The app will have a PostgreSQL database.

```Ruby
-> rails new company_contacts -d postgresql -T
```

Generate a model called Account that has a username, a password, and an email.

```Ruby
-> rails generate model Account username:'string' password:'string' email:'string'
```

All stories should have accompanying model specs.

```Ruby
class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
end

```

===============================
Developer Stories

As a developer, I need username, password, and email to be required.

```Ruby
it 'is valid with valid attributes' do
    account = Account.create(username:'Mike', password:'password123', email:'thisis@fun.com')
    expect(account).to be_valid
  end
```

As a developer, I need every username to be at least 5 characte-rs long.

```Ruby
class Account < ApplicationRecord
    validates :username, :password, :email, presence: true
    validates :username, length: {in: 5..20}
end

  it 'username is at least 5 characters long' do
      account = Account.create(username:'Michael', password:'password123', email:'thisis@fun.com')
      expect(account).to be_valid
  end
```

As a developer, I need each username to be unique.

```Ruby
validates :username, uniqueness: true

it 'does not allow duplicate username' do
    Account.create(username:'Michael', password:'password123', email:'thisis@fun.com')
    account = Account.create(username:'Michael', password:'password123', email:'thisis@fun.com')
    expect(account.errors[:username]).to_not be_empty
  end

```

As a developer, I need each password to be at least 6 characters long.

```Ruby

 validates :password, length: {in: 6..20}

it 'password is at least 6 characters long' do
      account = Account.create(username:'Michael', password:'password123', email:'thisis@fun.com')
      expect(account).to be_valid
  end
```

As a developer, I need each password to be unique.

```Ruby
validates :password, uniqueness: true

 it 'does not allow duplicate password' do
    Account.create(username:'Michael', password:'password123', email:'thisis@fun.com')
    account = Account.create(username:'Michael2', password:'password123', email:'thisis2@fun.com')
    expect(account.errors[:password]).to_not be_empty
  end


```

As a developer, I want my Account model to have many associated Addresses.

```Ruby
class Address < ApplicationRecord
end

```

As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.

```Ruby
ActiveRecord::Schema[7.0].define(version: 2022_10_10_210204) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  create_table "accounts", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "street_number"
    t.string "street_name"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

```

As a developer, I want to validate the presence of all fields on Address.

```Ruby
class Address < ApplicationRecord
    validates :street_number, :street_name, :city, :state, :zip, presence: true
end

RSpec.describe Address, type: :model do
  it 'is valid with valid attributes' do
    address = Address.create(street_number:123, street_name:'Street D', city:'San Diego', state:'CA', zip:12345)
    expect(address).to be_valid
  end
end
```
