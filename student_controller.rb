require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('./models/student.rb')
require_relative('./models/house.rb')

also_reload('./models/*')

get '/students' do
  @students = Student.all()
  erb(:index)
end

get '/students/new' do
  @houses = House.all
  erb(:new)

end


get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

get '/students/:id/edit' do
  @houses = House.all
  @student = Student.find(params[:id])
  erb(:edit)
end

post '/students' do # create
  @student = Student.new( params )
  @student.save()
  erb( :create )
end


post '/students/:id/delete' do
  student = Student.find( params[:id] )
  student.delete
  redirect to '/students'
end


#
# Part 8
#   - Alter the student to have a foreign key to House instead of text
#   - Add a method to Student to find a house() for the student
#
# Part 9
#   - Change the new student form to populate the drop down from the House table
