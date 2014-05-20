require 'spec_helper'

include LoginHelpers

feature 'User provides Workshare credentials' do
  it 'can use login form' do
    log_in('mdubov@gmail.com', '1567lamerz')

    expect(page).to have_content 'Successfully signed in'
  end

  it 'cannot login with wrong credentials' do
    log_in("bla@bla.com", "blabla")
    expect(page).to have_content 'incorrect'
  end
end
