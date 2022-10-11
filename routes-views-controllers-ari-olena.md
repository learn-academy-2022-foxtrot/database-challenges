Challenges
Routes, Views, Controllers

---- STEP ONE - Setting up the application:

```ruby
> rails new routes_controllers_views_params -d postgresql -T
> cd routes_controllers_views_params
> rails db:create
> rails s
```

---- STEP TWO - Creating the MVC inside of our app:

1.) As a user, I can visit a custom landing page at localhost:3000.
2.) As a user, I can see the names of my team members as hyperlinks on the landing page.
3.) As a user, I can click on each team member's name and be taken to a page that displays a list of that team member's top three things. (Could be top three restaurants, activities, books, video games, hiking locations, beaches, doughnut shoppes, movies, etc.)

```ruby
> rails g controller Team

# ---- CONTROLLER
# FILE: app/controllers/team_controller.rb
class TeamController < ApplicationController
  def team_list
  end

  def olena
  end

  def ari
  end

  def hazel
  end

  def grant
  end

  def jeremy
  end

end

# ---- ROUTE
# FILE: config/routes.rb
Rails.application.routes.draw do
  get '/team_list' => 'team#team_list'
  get '/olena' => 'team#olena'
  get '/ari' => 'team#ari'
  get '/hazel' => 'team#hazel'
  get '/grant' => 'team#grant'
  get '/jeremy' => 'team#jeremy'
  root to: 'team#team_list'

end


# ---- VIEW

# FILE: app/views/team/team_list.html.erb
<h1>Team Members:</h1>
<%= link_to 'Olena', '/olena'%>
<%= link_to 'Ari', '/ari'%>
<%= link_to 'Hazel', '/hazel'%>
<%= link_to 'Grant', '/grant'%>
<%= link_to 'Jeremy', '/jeremy'%>


# FILE: app/views/team/olena.html.erb
<h1>Hi! My name is Olena.</h1>
<p>I like dogs and plants. (:</p>
<%= link_to 'Return to Home', '/team_list'%>


# FILE: app/views/team/ari.html.erb
<h1>Hi! My name is Ari.</h1>
<p>I like cats and snakes. (:</p>
<%= link_to 'Return to Home', '/team_list'%>


# FILE: app/views/team/hazel.html.erb
<h1>Hi! My name is Hazel.</h1>
<p>I'm a cat who loves bread. (:</p>
<%= link_to 'Return to Home', '/team_list'%>

# FILE: app/views/team/grant.html.erb
<h1>Hi! My name is Grant.</h1>
<h2>I am a Dog</h2>
<p>I like bones</p>
<%= link_to 'Return to Home', '/team_list'%>

# FILE: app/views/team/jeremy.html.erb
<h1>Hi! My name is Jeremy.</h1>
<p>I am a really good coder (:</p>
<%= link_to 'Return to Home', '/team_list'%>
```

# Params

As a user, I can visit a page called cubed that takes a number as a param and displays that number cubed.

```ruby
# ---- CONTROLLER
# FILE: app/controllers/team_controller.rb
  def cubed
    @num1 = params[:num1]
    @output = Math.sqrt(@num1.to_i)
  end

# ---- ROUTE
# FILE: config/routes.rb
 get '/cubed/:num1' => 'team#cubed'

# ---- VIEW
# FILE: app/views/team/cubed.html.erb
<h1>The square root of <%= @num1 %> is:</h1>
<h2><%= @output %></h2>

# URL: http://localhost:3000/cubed/24

```

As a user, I can visit a page called evenly that takes two numbers as params and displays whether or not the first number is evenly divisible by the second.

```ruby
# ---- CONTROLLER
# FILE: app/controllers/team_controller.rb
  def evenly
    @num1 = params[:num1]
    @num2 = params[:num2]
     if @num1.to_i % @num2.to_i == 0
      @output = "#{@num1} is divisible by #{@num2}"
     else
      @output = "#{@num1} is not divisible by #{@num2}"
     end
  end

# ---- ROUTE
# FILE: config/routes.rb
  get '/evenly/:num1/:num2' => 'team#evenly'

# ---- VIEW
# FILE: app/views/team/evenly.html.erb
<h1> The result:</h1>
<h2><%= @output %></h2>

# URL: http://localhost:3000/evenly/10/2

```

As a user, I can visit a page called palindrome that takes a string as a param and displays whether it is a palindrome (the same word forward and backward).

```ruby
# ---- CONTROLLER
# FILE: app/controllers/team_controller.rb
  def palindrome
    @string = params[:string]
    if @string.downcase == @string.downcase.reverse
      @output = "#{@string} is a palindrome!"
    else
      @output = "#{@string} is NOT a palindrome."
    end
  end

# ---- ROUTE
# FILE: config/routes.rb
 get '/palindrome/:string' => 'team#palindrome'

# ---- VIEW
# FILE: app/views/team/palindrome.html.erb
<h1>Palindrome Checker:</h1>
<h2><%= @output %></h2>

# URL: http://localhost:3000/palindrome/kayak
```

As a user, I can visit a page called madlib that takes params of a noun, verb, adjective, adverb, and displays a short silly story.

```ruby
# ---- CONTROLLER
# FILE: app/controllers/team_controller.rb
  def madlib
    @noun = params[:noun]
    @verb = params[:verb]
    @adjective = params[:adjective]
    @adverb = params[:adverb]
      @output = "Once upon a time a #{@noun} lived in a #{@adjective} kingdom. He always #{@verb} his dinner #{@adverb}."
  end

# ---- ROUTE
# FILE: config/routes.rb
  get '/madlib/:noun/:verb/:adjective/:adverb' => 'team#madlib'

# ---- VIEW
# FILE: app/views/team/madlib.html.erb
<h1> Here is our story</h1>
<h2><%= @output %></h2>

# URL: http://localhost:3000/madlib/prince/ate/beautiful/quickly

```
