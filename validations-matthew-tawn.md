# account_spec.rb
```ruby
RSpec.describe Account, type: :model do
  it "is not valid without a username" do
    matthew = Account.create username:""
    expect(matthew.errors[:username]).to_not be_empty
  end
end

RSpec.describe Account, type: :model do
  it "is not valid without a password" do
    matthew = Account.create password:""
    expect(matthew.errors[:password]).to_not be_empty
  end
end

RSpec.describe Account, type: :model do
  it "is not valid without a email" do
    matthew = Account.create email:""
    expect(matthew.errors[:email]).to_not be_empty
  end
end

RSpec.describe Account, type: :model do
  it "is not valid if username is less than 5 characters" do
    matthew = Account.create username:""
    expect(matthew.errors[:username]).to_not be_empty
  end
end

RSpec.describe Account, type: :model do
  it "does not allow duplicate username" do
    matthew = Account.create username:""
    expect(matthew.errors[:username]).to_not be_empty
  end
end

RSpec.describe Account, type: :model do
  it "is not valid if password is less than 6 characters" do
    matthew = Account.create password:""
    expect(matthew.errors[:password]).to_not be_empty
  end
end

RSpec.describe Account, type: :model do
  it "is not allow duplicate passwords" do
    matthew = Account.create password:""
    expect(matthew.errors[:password]).to_not be_empty
  end
end
```

# account.rb
```ruby
class Account < ApplicationRecord
    validates :username, presence: true
    validates :username, length: {minimum: 5}
    validates :username, uniqueness: true

    validates :password, presence: true
    validates :password, length: {minimum: 6}
    validates :password, uniqueness: true

    validates :email, presence: true
    
end

```