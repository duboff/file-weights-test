require 'spec_helper'

require 'rest'

describe Client do

  let(:client) {Client.new}

  it 'can log in and get cookies' do
    client.login('mdubov@gmail.com', '1567lamerz')
    expect(client.cookies["device_credentials"]).not_to be_empty
    expect(client.cookies["my_session_id"]).not_to be_empty
    expect(client.cookies["domain"]).to eq ".workshare.com"
  end

  it 'can get a list of files' do
    client.login('mdubov@gmail.com', '1567lamerz')
    client.get_file_list
    expect(client.file_list.count).to eq 2
  end

end
