require 'spec_helper'

require 'gravity_calculator'

describe GravityCalculator do

  let(:calc) { GravityCalculator.new }

  it 'correctly assigns weight to songs' do
    expect(calc.factor(:song)).to eq 1.2
  end
end
