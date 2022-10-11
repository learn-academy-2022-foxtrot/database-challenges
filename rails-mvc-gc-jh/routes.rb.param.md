```ruby
Rails.application.routes.draw do
  get '/number/:num1/:num2' => 'home#number'
  get '/evenly/:num1/:num2' => 'home#evenly'
  get '/palindrome/:str' => 'home#palindrome'
  get '/palindrome/:str' => 'home#palindrome'
  get '/madlib/:noun/:verb/:adj/:adv' => 'home#madlib'
end
```