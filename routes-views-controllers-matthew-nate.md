# home_controller.rb
```ruby
class HomeController < ApplicationController
    def greeter
        
    end

    def pharaoh
        @pharaoh = 'Come and meet the Kings of Egypt!'
        @kings = ['Matthew', 'Nate']
    end
end
```
# pharaoh.html.erb
```ruby
<h3>Hello!</h3>
<p> <%= @pharaoh %> </p>
<ul>
    <% @kings.each do |king| %>
    <li> <%= king %> </li>
    <% end %>
    <%= link_to 'Matthew', '/matthew' %>

</ul>
```
# matthew.html.erb
<ul>
    <li>Snowboarding</li>
    <li>Traveling</li>
    <li>Concerts/Festivals</li>
</ul> 

# routes.rb
```ruby
Rails.application.routes.draw do

  get '/greeter' => 'home#greeter'
  # root to: 'home#greeter'

  get '/pharaoh' => 'home#pharaoh'
  root to: 'home#pharaoh'

  get '/matthew' => 'home#matthew'

  get '/nate' => 'home#nate'
  
end
