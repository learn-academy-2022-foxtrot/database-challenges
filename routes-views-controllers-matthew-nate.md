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
    <% end %>
    <li><%= link_to 'Matthew', '/matthew' %></li>
    <li><%= link_to 'Nate', '/nate' %></li>
</ul>
```
# matthew.html.erb
<h3>About King Matthew</h3>
<ul>
    <li>Snowboarding</li>
    <li>Traveling</li>
    <li>Concerts/Festivals</li>
</ul> 

# nate.html.erb
<h3>About King Nate</h3>
<ul>
    <li>Chargers Football</li>
    <li>Gaming</li>
    <li>Pizza</li>
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
```
