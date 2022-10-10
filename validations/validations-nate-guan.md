# As a developer, I need username, password, and email to be required.

```ruby
RSpec.describe Account, type: :model do
  it "is valid with valid attributes" do
    account = Account.create(username: 'nathaniel', password: 'password2', email: 'nate@gmail.com')
    expect(account).to be_valid
  end

  validates :username, :password, :email, presence: true
```

# As a developer, I need every username to be at least 5 characters long.

```ruby
it "is not valid if username is less than 5 characters long" do
    account = Account.create(username: 'nate', password: 'pw2', email: 'nate@gmail.com')
    expect(account.errors[:username]).to_not be_empty
  end

validates :username, length: { minimum: 5 }
```
# As a developer, I need each username to be unique.

```ruby
it "is not valid if username is not unique" do
    account = Account.create(username: 'nate', password: 'pw2', email: 'nate@gmail.com')
    expect(account.errors[:username]).to_not be_empty
  end

validates :username, uniqueness: true
```
# As a developer, I need each password to be at least 6 characters long.

```ruby
it "is not valid if password is less than 6 characters long" do
    account = Account.create(username: 'nate', password: 'pw2', email: 'nate@gmail.com')
    expect(account.errors[:password]).to_not be_empty
  end

validates :password, length: { minimum: 6 }
```

# As a developer, I need each password to be unique.

```ruby
it "is not valid if password is not unique" do
    account = Account.create(username: 'nate', password: 'pw2', email: 'nate@gmail.com')
    expect(account.errors[:password]).to_not be_empty
  end

validates :password, uniqueness: true
```

# As a developer, I want my Account model to have many associated Addresses.

rails g model Addresses street_numer:integer street_name:string city:string state:string zip:integer

```ruby
class Address < ApplicationRecord
    belongs_to :account, optional: true
```

# As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.

```ruby
create_table "addresses", force: :cascade do |t|
    t.integer "street_numer"
    t.string "street_name"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
```
# As a developer, I want to validate the presence of all fields on Address.

```ruby
RSpec.describe Address, type: :model do
  it "is valid with valid attributes" do
    address = Address.create(street_numer: 2223, street_name: 'main st', city: 'San Diego', state: 'California', zip: 92154)
    expect(address).to be_valid
  end
end

validates :street_numer, :street_name, :city, :state, :zip, presence: true
```