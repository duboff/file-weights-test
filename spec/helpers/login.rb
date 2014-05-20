module LoginHelpers

  def log_in(email, password)
    visit '/'
    fill_in 'email_field', with: email
    fill_in 'password_field', with: password
    click_button 'Submit'
  end

end
