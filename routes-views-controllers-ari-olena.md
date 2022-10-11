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
