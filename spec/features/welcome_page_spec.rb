require 'rails_helper.rb'

feature 'Welcome page' do
  scenario 'displays welcome and a link to proceed' do
    visit '/'
    expect(page).to have_content 'Welcome to Lintstagram'

    click_link 'Show me the lint'
    expect(page).to have_current_path('/pictures')
  end
end
