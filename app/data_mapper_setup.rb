env = ENV['RACK_ENV'] || "development"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/file_weights_#{env}")

# require './lib/user'
# require './lib/link'
# require './lib/tag'

DataMapper.finalize

DataMapper.auto_upgrade!
