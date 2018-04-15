require 'rails_helper.rb'

feature 'index page' do
  scenario 'Displays a welcome message' do
    visit '/'
    expect(page).to have_content("FOTOGRAM")
  end
end
