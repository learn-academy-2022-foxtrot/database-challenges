Validations Challenges
```ruby
Create a Rails application called company_contacts. The app will have a PostgreSQL database.
> rails new validations -d postgresql -T
> cd validations
> rails db:create
> bundle add rspec-rails
> rails g rspec:install

Generate a model called Account that has a username, a password, and an email.
> rails g model Account username:string password:string email:string
> rails db:migrate

All stories should have accompanying model specs.
Developer Stories

As a developer, I need username, password, and email to be required.
> RSpec.describe Account, type: :model do
>  it 'is valid with valid attributes' do
>    account = Account.create(username: 'Heath', password: 'password123', email: 'something@gmail.com')
>    expect(account).to be_valid
>  end
> end

As a developer, I need every username to be at least 5 characters long.
> class Account < ApplicationRecord
>    validates :username, :password, :email, presence: true
>    validates :username, length: { in: 5..20 }
> end


As a developer, I need each username to be unique.
> validates :username, uniqueness: true

As a developer, I need each password to be at least 6 characters long.
> validates :password, length: { in: 6..20 }

As a developer, I need each password to be unique.
> validates :password, uniqueness: true

As a developer, I want my Account model to have many associated Addresses.
> address.rb
> belongs_to :account

> account.rb
> has_many :addresses

As a developer, I want Address to have street_number, street_name, city, state, and zip attributes. The street_number and zip should be integers.
> rails c
> kyyle.addresses.create street_number: 3, street_name:"green street", city:"sd", state:"California", zip:92555

As a developer, I want to validate the presence of all fields on Address.
>RSpec.describe Address, type: :model do
>
>  kyyle = Account.create(username:"Kyyle", password:"password123", email:"something@gmail.com")
>
>  it "is valid with valid attributes" do
>    address = kyyle.addresses.create(street_number:3, street_name:"green street", city:"sd", state:"California", zip:92555)
>    expect(address).to be_valid
>  end
>
>  it 'is not valid without a street number' do
>    address = Address.create(street_name:"green street", city:"sd", state:"California", zip:92555)
>    expect(address.errors[:street_number]).to_not be_empty
>  end
>
>  it 'is not valid witout a street name' do
>    address = Address.create(street_number:3, city:"sd", state:"California", zip:92555)
>    expect(address.errors[:street_name]).to_not be_empty
>  end
>
>  it 'is not valid witout a city' do
>    address = Address.create(street_number:3, street_name:"green", state:"California", zip:92555)
>    expect(address.errors[:city]).to_not be_empty
>  end
>
>  it 'is not valid witout a state' do
>    address = Address.create(street_number:3, street_name:"green", city:"sd", zip:92555)
>    expect(address.errors[:state]).to_not be_empty
>  end
>
>  it 'is not valid witout a zip code' do
>    address = Address.create(street_number:3, street_name:"green", city:"sd", state:"California")
>    expect(address.errors[:zip]).to_not be_empty
>  end
>
>end


Stretch Challenges

As a developer, I need each Account password to have at least one number.
HINT: Read about custom validations in the Active Record validation docs.
As a developer, I want to validate that Address street_number, street_name, zip are unique for within an account.
HINT: Read about :scope in the Active Record validation docs.
As a developer, I want to validate that the Address street_number and zip are numbers.
HINT: Read about numericality in the Active Record validation docs.
As a developer, I want to see a custom error message that says "Please, input numbers only" if street_number or zip code are not numbers.
HINT: Read about message in the validation docs.
```