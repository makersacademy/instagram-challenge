require 'rails_helper'

feature 'user can add a picture and see the picture on the /pictures page' do
  scenario 'User visits index and clicks add picture and fills in form' do
    visit '/'
    click_link 'Add Picture'
    fill_in 'picture[src]', with: 'https://i.ytimg.com/vi/7OD55d6iRCQ/maxresdefault.jpg'
    fill_in 'picture[description]', with: 'My cat'
    click_button 'Upload Picture'
    expect(page).to have_content 'My cat'
  end
end
