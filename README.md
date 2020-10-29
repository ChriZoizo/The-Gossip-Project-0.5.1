# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
<!-- !!!!!!!!!!!!!!!!!!!   <p class="card-text"><%= @gossiptags.tag %></p> -->

<%= form_for :user do |f| %>
  First name: <%= f.text_field :first_name %>
  Last name : <%= f.text_field :last_name %>
  Description : <%= text_area :person, :description %>
  Age: <%= f.text_field :last_name %>
  Ville : <%= f.text_field :last_name %>
  password : <%= f.text_field :last_name %>
  email : <%= f.text_field :last_name %>
  <%= f.submit %>
<% end %>