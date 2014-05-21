require 'spec_helper'

include LoginHelpers

feature 'Gravity Report' do

  before { log_in('mdubov@gmail.com', '1567lamerz') }

  it 'user sees gravity report on login' do
    expect(current_path).to eq '/gravity'
    expect(page).to have_content 'Gravity Report'
    expect(page).to have_content 'mdubov@gmail.com'
  end

  it 'prints the right number of songs' do
    expect(page).to have_content '1 Song'
    expect(page).not_to have_content '1 Songs'
  end

  it 'prints the right gravity for songs' do
    expect(page).to have_content '3.6'
  end

end
