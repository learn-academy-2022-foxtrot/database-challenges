<!-- Routes, Views, Controllers
As a user, I can visit a custom landing page at localhost:3000.
--routes.rb
get '/greeter' => 'home#greeter'
 get '/team_mates' => 'home#team_mates'
end
--class home_controller.rb 
def greeter 
        render html: "hi welcome to home page"
    end
end
def team_mates 
    @team_mates = ['Michy', 'Lyssa', 'Ari']
end


#As a user, I can see the names of my team members as hyperlinks on the landing page.


--routes.rb
get '/greeter' => 'home#greeter'
  get '/team_mates' => 'home#team_mates'
  get '/michy' => 'home#michy'
  get '/lyssa' => 'home#lyssa'
  get '/ari' => 'home#ari'
  get '/landing' => 'home#landing'
  root to: 'home#landing'
end
--team_mates.html.erb
<p> <%= @team_mates %> </p>
<ul>
    <%= @team_mates.each do | team_mate | %>
        <li> <%= team_mate %> </li>
    <%  end %>
 </ul>
 


As a user, I can click on each team member's name and be taken to a page that displays a list of that team member's top three things. (Could be top three restaurants, activities, books, video games, hiking locations, beaches, doughnut shoppes, movies, etc.) -->
--home_controller.rb 
 def michy
        render html: 'likes: cats, taylor swift, pasta'
    end
    def lyssa
        render html: 'Likes: Music, walking on the beach, japan'
    end
    def ari
        render html: 'Likes: cats, when her coding works, the color blue'

    end
end

<!-- Params

As a user, I can visit a page called cubed that takes a number as a param and displays that number cubed.

def cubed
        @num1 = params[:num1]
        if @num1.to_i > 0
            @output = @num1.to_i**3
        end
    end
    --cubed.html.erb
    <h1> your number has been cubed</h2>
<br>
<h3>this is your new number: <%= @num1%> </h3>
<br>
<h2> <%= @output%>  </h2>
--routes.rb 
get '/cubed/:num1' => 'home#cubed'

As a user, I can visit a page called evenly that takes two numbers as params and displays whether or not the first number is evenly divisible by the second.
--home_controller.rb
def evenly
        @num1 = params[:num1]
        @num2 = params[:num2]
        if @num1.to_i % @num2.to_i == 0
            @output = "#{@num1} is divisible by #{@num2}"
        else
            @output = 'your numbers are not divisible'
        end
    end
<h1>numbers have been received </h1>
--evenly.html.erb
<br>
<h2> <%= @output%>  </h2>
--routes.rb   get '/evenly/:num1/:num2' => 'home#evenly'
As a user, I can visit a page called palindrome that takes a string as a param and displays whether it is a palindrome (the same word forward and backward).

As a user, I can visit a page called madlib that takes params of a noun, verb, adjective, adverb, and displays a short silly story. -->
--home_uncontroller.rb
def madlib
         @noun = params[:noun]
         @verb = params[:verb]
         @adverb = params[:adverb]
         @adjective = params[:adjective]
         @output = "the #{@noun} #{@verb} #{@adverb} and it was very #{@adjective}"
    end
end
--routes.rb
get '/madlib/:noun/:verb/:adverb/:adjective' => 'home#madlib'

--madlub.html.erb
--<h1>words has been received </h1>

<br>

<h2> <%= @output %>  </h2>





