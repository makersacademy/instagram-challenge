require 'rails_helper.rb'

feature 'Welcome page' do
  scenario 'User is encouraged to add pictures' do
    visit '/pictures'
    expect(page).to have_content 'Post a picture and start getting likes!'
  end
end
