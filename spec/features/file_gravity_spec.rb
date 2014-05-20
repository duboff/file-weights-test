require 'spec_helper'

include LoginHelpers

feature 'Gravity report' do
  it 'user sees gravity report on login' do
    log_in('mdubov@gmail.com', '1567lamerz')
    expect(current_path).to eq '/gravity'
    expect(page).to have_content 'Gravity report'
    expect(page).to have_content 'mdubov@gmail.com'
  end
end
