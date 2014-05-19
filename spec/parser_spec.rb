require 'spec_helper'

require 'parser'
require 'rest'



# stub_request(:post, "www.example.com").
#   with(:body => {:data => {:a => '1', :b => 'five'}})

describe Processor do

  let(:client) { Client.new }
  let(:processor) { Processor.new }

  before do
    client.login('mdubov@gmail.com', '1567lamerz')
    client.get_file_list
    list = client.file_list
    processor.parse(list)
  end


  it 'transforms file list into a hash with only required info' do
    expect(processor.files).to eq [{:name=>"bla", :ext=>"txt", :size=>7},
                                   {:name=>"10mb", :ext=>"bin", :size=>10485760},
                                   {:name=>"test", :ext=>"docx", :size=>21762},
                                   {:name=>"video1", :ext=>"avi", :size=>6094376},
                                   {:name=>"Islands", :ext=>"mp3", :size=>4065408},
                                   {:name=>"Workshare for mobile", :ext=>"mp4", :size=>59245396},
                                   {:name=>"Getting Started on Workshare", :ext=>"pdf", :size=>1951360}]
  end

  it 'has a list of songs' do
    expect(processor.songs).to eq [ { name: 'Islands', ext: "mp3", size: 4065408 }]
  end

  it 'has a list of videos' do
    expect(processor.videos).to eq [ {:name=>"video1", :ext=>"avi", :size=>6094376},
                                     {:name=>"Workshare for mobile", :ext=>"mp4", :size=>59245396} ]
  end

  it 'has a list of documents' do
    expect(processor.documents).to eq [ {:name=>"test", :ext=>"docx", :size=>21762} ]
  end

  it 'has a list of binaries' do
    expect(processor.binaries).to eq [ {:name=>"10mb", :ext=>"bin", :size=>10485760} ]
  end





end
