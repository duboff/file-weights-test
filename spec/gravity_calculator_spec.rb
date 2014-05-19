require 'spec_helper'

require 'gravity_calculator'

describe GravityCalculator do

  let(:calc) { GravityCalculator.new }

  it 'correctly assigns weight to songs' do
    expect(calc.factor(:song)).to eq 1.2
  end

  it 'correctly assigns weight to videos' do
    expect(calc.factor(:video)).to eq 1.4
  end

  it 'correctly assigns weight to documents' do
    expect(calc.factor(:document)).to eq 1.1
  end

  it 'correctly assigns weight to songs' do
    expect(calc.factor(:binary)).to eq 1
  end

  it 'correctly assigns weight to songs' do
    expect(calc.factor(:text)).to eq 1
  end

  it 'correctly assigns weight to songs' do
    expect(calc.factor(:other)).to eq 1
  end

end
