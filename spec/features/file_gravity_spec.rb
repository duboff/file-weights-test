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
    expect(page).to have_content '4.9'
  end

  it 'prints the right number of videos' do
    expect(page).to have_content '2 Videos'
    # expect(page).not_to have_content '1 Songs'
  end

  it 'prints the right gravity for videos' do
    expect(page).to have_content '2 Videos - 91.5'
  end

  it 'prints the right number of documents' do
    expect(page).to have_content '1 Document'
  end

  it 'prints the right gravity for videos' do
    expect(page).to have_content '1 Document - 0.05'
  end

end
