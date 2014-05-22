require 'sinatra'
require 'rack-flash'
require 'sinatra/partial'
require 'sinatra/config_file'
require 'haml'


require_relative 'controllers/application'
require_relative 'helpers/application'

require './lib/rest'
require './lib/processor'
require './lib/gravity_calculator'

enable :sessions
set :session_secret, ENV['SESSION_SECRET'] || 'a very long and random value'
set :partial_template_engine, :haml
set :static, true
set :public_folder, File.join(File.dirname(__FILE__), '..', 'public')
config_file '../config.yml'

use Rack::Flash

env = ENV['RACK_ENV'] || "development"
