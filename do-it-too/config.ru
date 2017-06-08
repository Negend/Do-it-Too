require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/too.rb'
require_relative './controllers/toos-controller.rb'
require 'upload_image'

Upload::ImageForest.new("/path/to/image").upload
use Rack::MethodOverride

run ToosController