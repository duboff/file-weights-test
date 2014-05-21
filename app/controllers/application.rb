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
    redirect to '/gravity'
  else
    flash[:errors] = ["The email or password are incorrect"]
    redirect '/'
  end
end

get '/gravity' do
  email = session[:email]
  pass = session[:password]

  client = Client.new
  client.login(email, pass)
  client.get_file_list

  processor = Processor.new
  processor.parse(client.file_list)

  calculator = GravityCalculator.new

  @email = email
  @calculator = calculator
  @songs = processor.songs
  @documents = processor.documents
  @videos = processor.videos
  @binaries = processor.binaries
  @text = processor.text
  @other = processor.other

  @total = total_gravity(@songs, :song, @calculator) +
    total_gravity(@videos, :video, @calculator) +
    total_gravity(@documents, :document, @calculator) +
    total_gravity(@binaries, :binary, @calculator) +
    total_gravity(@text, :text, @calculator) +
    total_gravity(@other, :other, @calculator)



  haml :gravity
end
