Challenges
Routes, Views, Controllers


As a user, I can visit a custom landing page at localhost:3000.
  # main_controller.rb
  def custom
    render html: "This is an awesome custom page"
  end

  # routes.rb
    def custom
    render html: "This is an awesome custom page"
  end

As a user, I can see the names of my team members as hyperlinks on the landing page.
 # main_controller.rb
 def David
    render html: "Hello"
  end
  def Lyssa
    render html: "Sweet"
  end

# routes.rb  
  root 'main#custom'
  get '/custom' => 'main#custom'
  get '/David' => 'main#David'
  get '/Lyssa' => 'main#Lyssa'
end


As a user, I can click on each team member's name and be taken to a page that displays a list of that team member's
top three things. (Could be top three restaurants, activities, books, video games, hiking locations, beaches, doughnut shoppes, movies, etc.)

# Lyssa.html.erb

<h1>These are my favorite things</h1>

<ul>
  <li>Coffee</li>
  <li>Cats</li>
  <li>Cookies</li>
</ul>

# David.html.erb
<h1>These are my favorite things</h1>

<ul>
  <li>Food</li>
  <li>Travel</li>
  <li>Sports</li>
</ul>

# main_controller.rb
  def David
  end
  def Lyssa
  end

  Params

As a user, I can visit a page called cubed that takes a number as a param and displays that number cubed.

# main_controller.rb
def cubed 
    @cubed = params[:cubed]
    @results = params[:cubed].to_i * params[:cubed].to_i * params[:cubed].to_i
    
  end

# custom.html.erb 
<h1> Wanna play a game? </h1>
<%= link_to "cubed", "/cubed" %>

# routs.rb
get '/cubed/:cubed' => 'main#cubed'

# cubed.html.erb
<h1> This is Cubed</h1>

<%= @cubed %>

<p> Your number cubed is <%= @results %> </p>

As a user, I can visit a page called evenly that takes two numbers as params and displays whether or not the first number is evenly divisible by the second.
# main_controller.rb
def evenly 
    @evenly = params[:num1], params[:num2]
    if params[:num1].to_i % params[:num2].to_i == 0
      @is_even = "Is evenly divisable"
    else 
      @is_even = "Is NOT evenly divisable"
    end
  end

# custom.html.erb 
<%= link_to "evenly", "/evenly" %>

# routs.rb
get '/evenly/:num1/:num2' => 'main#evenly'

# evenly.html.erb
<h1> This is Evenly</h1>

<%= @num1 %>
<%= @num2 %>

<%= @is_even %>
As a user, I can visit a page called palindrome that takes a string as a param and displays whether it is a palindrome (the same word forward and backward).

# main_controller.rb
def palindrome
    @palindrome = params[:str]
    if params[:str].downcase == params[:str].downcase.reverse
      @is_palindrome = 'This is a palindrome'
    else 
      @is_palindrome = 'This is NOT a palindrome'
    end
  end

# palindrome.html.erb
  <h1> This is Palindrome</h1>

<%= @str %>

<%= @is_palindrome %> 

# routes.rb
  get '/palindrome/:str' => 'main#palindrome'


As a user, I can visit a page called madlib that takes params of a noun, verb, adjective, adverb, and displays a short silly story.

# main_controller.rb
  def madlib
    @mablib = params[:noun], params[:verb], params[:adj], params[:adv]
    @noun = params[:noun]
    @verb = params[:verb]
    @adj = params[:adj]
    @adv = params[:adv]
  end

# custom.html.erb
<%= link_to "madlib", "/madlib" %>


# madlib.html.erb
<h1> This is madlib</h1>

<%= @madlib %>

<p> There once was a <%= @noun %> who was doing <%= @verb %>. She loved <%= @adj %> ponies. The ponies were jumping <%= @adv %>.</p>

# route.html.erb

  get '/madlib/:noun/:verb/:adj/:adv' => 'main#madlib'