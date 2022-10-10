# Setup

Create a new rails application and database

```ruby
> rails new KirbyKredit -d postgresql -T
> cd KirbyKredit
> rails db:create
> rails s # confirming it worked (it did!)
```

Create a model for owner
An owner has a name and address, and can have multiple credit cards

```ruby
> rails g model Owner name:string address:string
```

Create a model for credit card
A credit card has a number, an expiration date, and an owner

```ruby
> rails g model CreditCard number:integer expiration:date owner_id:integer
> rails db:migrate
```

# Challenges

Create three owners and save them in the database

```ruby
> rails c
> Owner.create(name: 'MetaKnight', address: '367 WaddleDee ln')
> Owner.create(name: 'Kirby', address: '123 Burger way')
> Owner.create(name: 'Prince Fluff', address: '698 Adeleine ct')
```

# Linking with has_many and belongs_to

```ruby
# owner.rb
class Owner < ApplicationRecord
  has_many :credit_cards
end

#credit_card.rb
class CreditCard < ApplicationRecord
  belongs_to :owner
end

```

Create a credit card in the database for each owner

```ruby
> metaknight = Owner.find(1)
> kirby = Owner.find(2)
> princefluff = Owner.find(3)

> metaknight.credit_cards.create(number:234567, expiration:'2027-04-04')
> kirby.credit_cards.create(number:123894, expiration:'2027-01-23')
> princefluff.credit_cards.create(number:928465, expiration:'2027-11-20')
```

Add two more credit cards to one of the owners

```ruby
> princefluff.credit_cards.create(number:234018, expiration:'2027-11-20')
> princefluff.credit_cards.create(number:294653, expiration:'2027-11-20')
> CreditCard.where(owner_id: 3)
# Shows all 3 of Prince Fluff's cards. (He doesn't have a credit problem.)
```

# Stretch Challenge

Add a credit limit to each card

```ruby
> rails g migration add_credit_limit_column_to_creditcard

# in migration instance
class AddCreditLimitColumnToCreditcard < ActiveRecord::Migration[7.0]
  def change
    add_column(:credit_cards, :credit_limit, :string)
  end
end

> rails db:migrate

> rails c
> CreditCard.update_all(credit_limit: '$2,000 coins')
> CreditCard.all

### We didn't have the foresight to glance down approximately a single inch to the next stretch challenge, so we're gonna fix that now...
> CreditCard.update_all(credit_limit: '2000')
> rails g migration change_value_of_credit_limit_to_integer

# in migration instance
class ChangeValueOfCreditLimitToInteger < ActiveRecord::Migration[7.0]
  def change
    change_column(:credit_cards, :credit_limit, :integer)
  end
end

> rails db:migrate
### Didn't work: ERROR:  column "credit_limit" cannot be cast automatically to type integer

> CreditCard.update_all(credit_limit: nil)
> rails db:migrate

### Tried to change values to nil to see if it would fix it, it didnt... 🙃 Going to delete and remake the column now.

# in migration instance
class ChangeValueOfCreditLimitToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column(:credit_cards, :credit_limit)
  end
end


> rails g migration fix_credit_limit_column_by_making_again

# in migration instance
class FixCreditLimitColumnByMakingAgain < ActiveRecord::Migration[7.0]
  def change
    add_column(:credit_cards, :credit_limit, :integer)
  end
end

> rails db:migrate
> rails c
> CreditCard.update_all(credit_limit: 2000)
```

Find the total credit extended to the owner with multiple credit cards

```ruby
> princefluff = CreditCard.where(owner_id: 3)
> total = princefluff.sum(:credit_limit)
# total => 6000
```
