<h1> Welcome to the best bank in the World </h1>

<ul>
    <% @team.each do |person| %>
    <li> <%= person %> </li>
    <% end %>
</ul> 
<%= link_to 'Log In / Register', '/sign_in' %>