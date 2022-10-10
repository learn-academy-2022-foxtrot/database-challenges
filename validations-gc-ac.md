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
```

As a developer, I need each username to be unique.

As a developer, I need each password to be at least 6 characters long.

As a developer, I need each password to be unique.

As a developer, I want my Account model to have many associated Addresses.

As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.

As a developer, I want to validate the presence of all fields on Address.
