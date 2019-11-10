require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/student.rb')
require_relative('../models/house.rb')
also_reload( '../models/*' )

get '/houses' do
  @houses = House.all()
  erb (:"houses/index")
end

get '/houses/new' do
  # @houses = House.all
  erb(:"houses/new")
end


get '/houses/:id' do
  @house = House.find(params[:id])
  erb(:"houses/show")
end


post '/houses' do
  @house = House.new( params )
  @house.save()
  erb( :"houses/create" )
end


get '/houses/:id/edit' do
  @house = House.find(params[:id])
  erb(:"houses/edit")
end

post '/houses/:id' do
  house = House.new(params)
  house.update
  redirect to "/houses/#{params[:id]}"
end


post '/houses/:id/delete' do
  house = House.find( params[:id] )
  house.delete
  redirect to '/houses'
end
