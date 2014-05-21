require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'rack-flash'
require 'sinatra/partial'
require 'haml'

require_relative 'controllers/application'
require_relative 'data_mapper_setup'

require './lib/rest'
require './lib/processor'
require './lib/gravity_calculator'

enable :sessions
set :session_secret, 'a very long and random value'
set :partial_template_engine, :haml
set :static, true
set :public_folder, File.join(File.dirname(__FILE__), '..', 'public')

use Rack::Flash
