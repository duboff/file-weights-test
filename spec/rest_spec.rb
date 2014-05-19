require 'spec_helper'

require 'rest'


describe Client do

  let(:client) { Client.new }

  context 'logging in' do
    it 'no error when logging in' do
      client.login('mdubov@gmail.com', '1567lamerz')
      expect(client.response.code).to eq 201
    end

    it 'cookies are set on login' do
      client.login('mdubov@gmail.com', '1567lamerz')
      expect(client.cookies["device_credentials"]).not_to be_empty
      expect(client.cookies["my_session_id"]).not_to be_empty
      expect(client.cookies["domain"]).to eq ".workshare.com"
    end
  end

  context 'once logged in' do

    before  do
      client.login('mdubov@gmail.com', '1567lamerz')
      client.get_file_list
    end

    it 'can get a list of files' do
      expect(client.file_list.count).to eq 7
    end

    it 'gets the right file names' do
      expect(client.file_list[-2]["name"]).to eq 'Workshare for mobile'
      expect(client.file_list.last["name"]).to eq 'Getting Started on Workshare'
    end

    it 'gets the file sizes' do
      expect(client.file_list[-2]["size"]).to eq 59245396
    end

    it 'gets file extensions' do
      expect(client.file_list[-2]["extension"]).to eq "mp4"
    end

  end

end
