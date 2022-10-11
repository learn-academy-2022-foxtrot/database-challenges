# Challenges
## Routes, Views, Controllers

* As a user, I can visit a custom landing page at localhost:3000.
* As a user, I can see the names of my team members as hyperlinks on the landing page.
* As a user, I can click on each team member's name and be taken to a page that displays a list of that team member's top three things. (Could be top three restaurants, activities, books, video games, hiking locations, beaches, doughnut shoppes, movies, etc.)

## Params

* As a user, I can visit a page called cubed that takes a number as a param and displays that number cubed.
* As a user, I can visit a page called evenly that takes two numbers as params and displays whether or not the first number is evenly divisible by the second.
* As a user, I can visit a page called palindrome that takes a string as a param and displays whether it is a palindrome (the same word forward and backward).
* As a user, I can visit a page called madlib that takes params of a noun, verb, adjective, adverb, and displays a short silly story.

## main_controller.rb

```ruby

class MainController < ApplicationController
  def home
    render 'home'
  end

  def cubed
    @number = params[:num]
    @result = params[:num].to_i ** 3
  end

  def evenly
    @num1 = params[:num1].to_i 
    @num2 = params[:num2].to_i

    @result = if @num1 % @num2 === 0
                'is evenly divisble'
              else 
                'is not evenly divisble'
              end
    end

    def palindrome
      @word = params[:word]

      @result = if @word === @word.reverse
                  "#{@word} is a palindrome"
                else 
                  "#{@word} is not a palindrome"
                end
    end

    def madlib
      @noun = params[:noun]
      @verb = params[:verb]
      @adjective = params[:adjective]
      @adverb =  params[:adverb]

      @result = "The #{@adjective} #{@noun} is #{@adverb} #{@verb} along the golf course."
    end
end
```

## views/main/cubed.html.erb
```ruby
<h1> Cube Of <%= @number %> is <%= @result %> </h1> 
```

## views/main/evenly.html.erb
```ruby
<h1> <%= @result %> </h1>
```

## views/main/home.html.erb
```ruby
<h1> Main Page </h1>
<ul> 
<li> <%= link_to 'Jeremy', '/jeremy' %> </li>
<li> <%= link_to 'Zack', '/zack' %> </li>
</ul>
```

## views/main/jeremy.html.erb
```ruby
<h1> Top 3 Favorite Things </h1>
<ul> 
<li> Curry </li>
<li> Ramen </li>
<li> Mexican Food </li>
</ul>
<%= link_to 'home', '/' %> 
```

## views/main/zack.html.erb
```ruby
<h1> Top 3 Favorite Things </h1>
<ul> 
<li> Pasta </li>
<li> Pizza </li>
<li> Burritos </li>
</ul>
<%= link_to 'home', '/' %> 
```
## views/main/madlib.html.erb
```ruby
<h1> <%= @result %> </h1> 
```
## views/main/palindrome.html.erb
```ruby
<h1> <%= @result %> </h1>
```
## config/routes.rb
```ruby
Rails.application.routes.draw do
root 'main#home'
get '/jeremy' => 'main#jeremy'
get '/zack' => 'main#zack'
get '/cubed/:num' => 'main#cubed'
get '/evenly/:num1+:num2' => 'main#evenly'
get '/palindrome/:word' => 'main#palindrome'
get '/madlib/:adjective+:noun+:adverb+:verb' => 'main#madlib'
end
```
