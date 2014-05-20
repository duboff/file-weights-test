get '/' do
  haml :index
end

post '/gravity' do
  email = params["email"]
  pass = params["password"]

  client = Client.new

  client.login(email, pass)

  if client.response.code == 201
    session[:email] = email
    session[:password] = pass
    flash[:notice] = 'Successfully signed in!'
    # redirect to '/gravity'
  else
    flash.now[:errors] = ["The email or password are incorrect"]
    redirect to '/'
  end
end
