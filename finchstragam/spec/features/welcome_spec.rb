require 'rails_helper'

feature 'Welcome page' do
  scenario 'User is warmly welcomed' do
    visit welcome_index_path
    expect(page).to have_content 'Welcome to Finchstagram!'
  end
end
