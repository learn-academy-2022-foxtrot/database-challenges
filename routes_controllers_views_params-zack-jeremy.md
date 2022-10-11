As a user, I can visit a custom landing page at localhost:3000.
As a user, I can see the names of my team members as hyperlinks on the landing page.
As a user, I can click on each team member's name and be taken to a page that displays a list of that team member's top three things. 
(Could be top three restaurants, activities, books, video games, hiking locations, beaches, doughnut shoppes, movies, etc.)

<h1> Main Page </h1>

<ul> 
<li> <%= link_to 'Jeremy', '/jeremy' %> </li>
<li> <%= link_to 'Zack', '/zack' %> </li>
</ul>

root 'main#home'
get '/jeremy' => 'main#jeremy'
get '/zack' => 'main#zack'

<!-- Jeremy -->
<h1> Top 3 Favorite Things </h1>

<ul> 
<li> Curry </li>
<li> Ramen </li>
<li> Mexican Food </li>
</ul>

<%= link_to 'home', '/' %> 

<!-- Zack -->
<h1> Top 3 Favorite Things </h1>

<ul> 
<li> Pasta </li>
<li> Pizza </li>
<li> Burritos </li>
</ul>

<%= link_to 'home', '/' %> 