require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry' 
require 'shotgun'
require_relative './models/too.rb'
require_relative './controllers/toos-controller.rb'

use Rack::MethodOverride

run ToosController