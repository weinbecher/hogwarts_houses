require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/student_controller')
require_relative('controllers/house_controller')


get '/' do
  erb( :index )
end
