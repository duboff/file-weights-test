require 'spec_helper'

require 'parser'
require 'rest'



# stub_request(:post, "www.example.com").
#   with(:body => {:data => {:a => '1', :b => 'five'}})

describe Parser do

  let(:client) { Client.new }
  let(:parser) { Parser.new }




  it 'transforms file list into a hash' do
    client.login('mdubov@gmail.com', '1567lamerz')
    client.get_file_list
    list = client.file_list
    file_array = parser.parse(list)
    expect(file_array).to eq [{name: "Workshare for mobile", ext: "mp4", size: 59245396},
                              {name: "Getting Started on Workshare", ext: "pdf", size: 1951360}]
  end
end
