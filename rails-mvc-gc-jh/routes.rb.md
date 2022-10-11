```ruby
Rails.application.routes.draw do
    get '/bank_landing' => 'bank#bank_landing'
    get '/sign_in' => 'bank#sign_in'
    get '/Guan' => 'bank#guans_best'
    get '/Joseph' => 'bank#josephs_best'
    root to: 'bank#bank_landing'
end
```