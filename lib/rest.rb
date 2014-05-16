require 'rest_client'


# response = RestClient.post 'https://my.workshare.com/api/open-v1.0/user_sessions.json', {'user_session[email]' => 'mdubov@gmail.com', 'user_session[password]' => '1567lamerz', 'device[app_uid]' => 'c63436cf-1101'}

# coo = response.cookies

# response2 = RestClient.get "https://my.workshare.com/api/open-v1/files.json", {:cookies => coo}
class Client

  attr_reader :base_url, :api_key
  attr_accessor :response, :file_list

  def initialize
    @base_url = 'https://my.workshare.com/api/open-v1.0/'
    @api_key = 'c63436cf-1101'
  end


  def login(email, password)
    self.response = RestClient.post "#{base_url}/user_sessions.json", {'user_session[email]' => email, 'user_session[password]' => password, 'device[app_uid]' => api_key}
  end

  def cookies
    response.cookies
  end

  def get_file_list
    server_response = RestClient.get "#{base_url}/files.json", {:cookies => cookies}
    self.file_list = JSON.parse(server_response)["files"]
  end

end
