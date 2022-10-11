The routes.rb file defines all the possible urls to which your application is 
prepared to respond. It's like the address book of your Rails app.

Each route will point to a method on in the controller file.

The controller method will ultimately do the work you require and send the appropriate view response.

params is a method returning a ActionController::Parameters which is a hash of parameters submitted in the request.


Challenges

Routes, Views, Controllers

As a user, I can visit a custom landing page at localhost:3000.
 ```ruby
  def landing
        
    end
end

get '/landing' => 'main#landing'---route
  root to: 'main#landing'

  <h1>Welcome to our Frist Rails Site!</h1> html.erb
```
As a user, I can see the names of my team members as hyperlinks on the landing page.
```ruby
 def goran -------methods
        @Goran = 'Goran'
        
        
    end
    def christian
        @Christian = 'Christian'
       
    end

    <%= link_to 'Goran', '/goran' %>
<%= link_to 'Christian', '/christian' %> -----landing

 get '/goran' => 'main#goran'
  get '/christian' => 'main#christian'----routes

```
As a user, I can click on each team member's name and be taken to a page that displays a list of that team member's top three things. (Could be top three restaurants, activities, books, video games, hiking locations, beaches, doughnut shoppes, movies, etc.)
```ruby
<ul> 
<% @fun.each do |e| %>
 <li><%= e %><li>
 <% end %>
 </ul>

   def goran
        @Goran = 'Goran'
        @fun =['Bull fighting', 'ding dong ditching', 'Stealing candy from babies']
        
    end
    def christian
        @Christian = 'Christian'
        @fun = ['MMA', 'Cooking', 'Family']
    end
```

Params

As a user, I can visit a page called cubed that takes a number as a param and displays that number cubed.
```ruby
def cubed
                 @num = params[:num].to_i 
            @output = @num * @num * @num

     end
    get '/cubed/:num' => 'main#cubed'---route
    
    <h1>Enter a number above in URL</h1>
<h3> Cubed number is <%= @output %></h3>---html

<%= link_to 'Cubed', '/cubed/:num' %> -----landing
```

As a user, I can visit a page called evenly that takes two numbers as params and 
displays whether or not the first number is evenly divisible by the second.
```ruby
 def number----method
        @num1 = params[:num1].to_i
        @num2 = params[:num2].to_i

        if (@num1 % @num2 == 0)
            @output = 'is evenly divisible'
        else
            @output = 'is NOT evenly divisible'
        end
    end
    <h1> Is it divisivble?<h1>
<h3>My numbers <%= @output %>
  get '/number/:num1/:num2' => 'main#number'---route
  <%= link_to 'Number', '/number/:num1/:num2' %>---landing
```
As a user, I can visit a page called palindrome that takes a string as a param and displays whether it is a palindrome (the same word forward and backward).

As a user, I can visit a page called madlib that takes params of a noun, verb, adjective, adverb, and displays a short silly story.
