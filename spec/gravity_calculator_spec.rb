require 'spec_helper'

require 'gravity_calculator'

describe GravityCalculator do

  let(:calc) { GravityCalculator.new }

  context 'assigning factors' do

    it 'to songs' do
      expect(calc.factor(:song)).to eq 1.2
    end

    it 'to videos' do
      expect(calc.factor(:video)).to eq 1.4
    end

    it 'to documents' do
      expect(calc.factor(:document)).to eq 1.1
    end

    it 'to binaries' do
      expect(calc.factor(:binary)).to eq 1
    end

    it 'to text' do
      expect(calc.factor(:text)).to eq 1
    end

    it 'to other' do
      expect(calc.factor(:other)).to eq 1
    end

  end

  context 'calculating total weight' do
    it 'songs' do
      song = {:name=>"Islands", :ext=>"mp3", :size=>4065408}
      size = song[:size] * 1.2
      expect(calc.gravity(song, :song)).to eq size
    end

    it 'videos' do
      video = {:name=>"video1", :ext=>"avi", :size=>6094376}
      size = video[:size] * 1.4
      expect(calc.gravity(video, :video)).to eq size
    end

    it 'documents' do
      document = {:name=>"test", :ext=>"docx", :size=>21762}
      size = document[:size] * 1.1
      expect(calc.gravity(document, :document)).to eq size
    end

    it 'text' do
      text = {:name=>"bla", :ext=>"txt", :size=>7}
      size = text[:size] + 100
      expect(calc.gravity(text, :text)).to eq size
    end

  end


end
