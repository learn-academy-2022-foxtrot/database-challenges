<h1>Guan's page</h1>
<h3> <%= @title %> </h3>
<ul>
    <% @best.each do |item| %>
    <li> <% "#{@item}" %> </li>
    <% end %>
</ul>