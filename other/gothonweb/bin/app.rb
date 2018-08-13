require 'sinatra'

set :port, 8000
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
  'Put that in your pipe and smoke it'
end

get '/ping' do
  'Pong!'
end

get '/greet' do
  greeting = params[:greeting] || 'Hello world'
  erb :index, :locals => {'greeting' => greeting}
end