require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/too.rb'
require_relative './controllers/toos_controller.rb'

use Rack::MethodOverride

run PostsController