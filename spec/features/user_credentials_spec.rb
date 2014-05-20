require 'spec_helper'

feature 'User provides Workshare credentials' do
  it 'can use login form' do
    visit '/'
    fill_in 'email_field', with: "mdubov@gmail.com"
    fill_in 'password_field', with: "1567lamerz"
    click_button 'Submit'
    expect(page).to have_content 'Successfully signed in'
  end

  it 'cannot login with wrong credentials' do
    visit '/'
    fill_in 'email_field', with: "bla@bla.com"
    fill_in 'password_field', with: "blabla"
    click_button 'Submit'
    expect(page).to have_content 'incorrect'
  end
end
