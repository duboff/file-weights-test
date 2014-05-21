require 'rest_client'

class Client

  attr_reader :base_url, :api_key
  attr_accessor :response, :file_list

  def initialize
    @base_url = 'https://my.workshare.com/api/open-v1.0/'
    @api_key =  ENV['WS_KEY'] || settings.api_key
  end


  def login(email, password)
    RestClient.post("#{base_url}/user_sessions.json",{'user_session[email]' => email, 'user_session[password]' => password, 'device[app_uid]' => api_key}) do |response, request, result|
      self.response = response
    end
  end

  def cookies
    response.cookies
  end

  def get_file_list
    server_response = RestClient.get "#{base_url}/files.json", { cookies: cookies, 'limit' => 100000 }
    self.file_list = JSON.parse(server_response)["files"]
  end

end
