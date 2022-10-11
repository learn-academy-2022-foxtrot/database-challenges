# home_controller.rb
```ruby
class HomeController < ApplicationController
    
    def pharaoh
        @pharaoh = 'Come and meet the Kings of Egypt!'
        @kings = ['Matthew', 'Nate']
    end
    
    def cubed
        @cubed = params[:number].to_i ** 3
    end

    def evenly
        @num1 = params[:num1].to_i
        @num2 = params[:num2].to_i
        if (@num1 % @num2 === 0)
           @output = "#{params[:num1]} is evenly divisible by #{params[:num2]}"
        else
           @output = "#{params[:num1]} is not divisible by #{params[:num2]}"
        end
    end
    
    def palindrome 
        @palindrome = params[:word]
        if (@palindrome.downcase === @palindrome.downcase.reverse)
            @output2 = "#{params[:word]} is a palindrome"
        else 
            @output2 = "#{params[:word]} is not a palindrome"
        end
    end

    def madlib
        @noun = params[:noun]
        @verb = params[:verb]
        @adj = params[:adj]
        @adv = params[:adv]

            @output3 = "It was a #{params[:adj]} day when a #{params[:noun]} was #{params[:adv]} #{params[:verb]}"
    end

end
```

# pharaoh.html.erb
```ruby
<h3>Hello!</h3>
<br>
<p> <%= @pharaoh %> </p>
<br>
<ul>
    <% @kings.each do |king| %>
    <% end %>
    <li><%= link_to 'Matthew', '/matthew' %></li>
    <li><%= link_to 'Nate', '/nate' %></li>
</ul>
<br>
<h5><%= link_to 'Learn the mystic cubes of Ancient Egypt ☥', '/cubed'%></h5>
<br>
<h5><%= link_to 'Do you dare check remainders?', '/evenly/6/4'%></h5>
<br>
<h5><%= link_to 'Can your mind comprehend the palindrome?', 'palindrome'%></h5>
<br>
<h5><%= link_to 'Hear the stories of the Pharaohs 𓁈'%></h5>
```

# cubed.html.erb
```ruby
<h3>Welcome To Cube World</h3>
<br>
<h4>Cube a number if you dare<h4>
<br>
<p> <%= @cubed%> </p>
```

# evenly.html.erb
```ruby
<h3>Welcome To Even World</h3>
<br>
<h4>Modulo Menace<h4>
<br>
<p> <%= @output%> </p>
```

# palindrome.html.erb
```ruby
<h3>Welcome To the Palindrome Parthenon</h3>
<br>
<h4>Test your mental might<h4>
<br>
<p> <%= @output2%> </p>
```

# madlib.html.erb
```ruby
<h3>Story Hall of Heroes</h3>
<br>
<h4>Stay a while and listen!<h4>
<br>
<p> <%= @output3%> </p>
```
# routes.rb
```ruby
Rails.application.routes.draw do

  get '/greeter' => 'home#greeter'
  # root to: 'home#greeter'

  get '/pharaoh' => 'home#pharaoh'
  root to: 'home#pharaoh'

  get '/matthew' => 'home#matthew'

  get '/nate' => 'home#nate'

  get '/cubed/:number' => 'home#cubed'

  get '/evenly/:num1/:num2' => 'home#evenly'

  get '/palindrome/:word' => 'home#palindrome'

  get '/madlib/:noun/:verb/:adj/:adv' => 'home#madlib'
end
```