require 'rails_helper.rb'

feature 'Welcome page' do
  scenario 'displays welcome message' do
    visit '/'
    expect(page).to have_content 'Welcome to Lintstagram'
  end
end
