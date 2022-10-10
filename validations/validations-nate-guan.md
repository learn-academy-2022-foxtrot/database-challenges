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

# As a developer, I need each Account password to have at least one number

```ruby
it "is not valid if password does not contain a digit" do
    account = Account.create(username: 'nate', password: 'password', email: 'nate@gmail.com')
    expect(account.errors[:password]).to_not be_empty
  end

validates :password, format: {with: /\d+/}
```

# As a developer, I want to validate that Address street_number, street_name, zip are unique for within an account.

```ruby
RSpec.describe Address, type: :model do
  it "is valid with valid attributes" do
    guan = Account.create(username: 'guanchan', password: 'password123', email: 'guan@gmail.com')
    guanaddress = guan.addresses.create(street_numer: 2223, street_name: 'main st', city: 'San Diego', state: 'California', zip: 92154)
    expect(guanaddress).to be_valid
  end
  
  it "is not valid if the street_name is not unique" do
    guan = Account.create(username: 'guanchan', password: 'password123', email: 'guan@gmail.com')
    guanaddress = guan.addresses.create(street_numer: 2223, street_name: 'main st', city: 'San Diego', state: 'California', zip: 92154)
    guanaddress1 = guan.addresses.create(street_numer: 2223, street_name: 'main st', city: 'San Diego', state: 'California', zip: 92154)
    expect(guanaddress1.errors[:street_numer]).to_not be_empty
    expect(guanaddress1.errors[:street_name]).to_not be_empty
    expect(guanaddress1.errors[:zip]).to_not be_empty
  end

end

validates :street_numer, uniqueness: { scope: :account_id }
validates :street_name, uniqueness: { scope: :account_id }
validates :zip, uniqueness: { scope: :account_id }
```

# As a developer, I want to validate that the Address street_number and zip are numbers.

```ruby
it "is not valid if street_number and zip are not numbers" do
    guan = Account.create(username: 'guanchan', password: 'password123', email: 'guan@gmail.com')
    guanaddress = guan.addresses.create(street_numer: 'numbers', street_name: 'main st', city: 'San Diego', state: 'California', zip: 'zipcode')
    expect(guanaddress.errors[:street_numer]).to_not be_empty
    expect(guanaddress.errors[:zip]).to_not be_empty
  end

validates :zip, numericality: { only_integer: true }
validates :street_numer, numericality: { only_integer: true }
```

# As a developer, I want to see a custom error message that says "Please, input numbers only" if street_number or zip code are not numbers.

```ruby
validates :zip, numericality: { only_integer: true, message: 'Please, input numbers only' }
validates :street_numer, numericality: { only_integer: true, message: 'Please, input numbers only' }
```
