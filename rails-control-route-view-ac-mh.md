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



As a user, I can click on each team member's name and be taken to a page that displays a list of that team member's top three things. (Could be top three restaurants, activities, books, video games, hiking locations, beaches, doughnut shoppes, movies, etc.) -->

