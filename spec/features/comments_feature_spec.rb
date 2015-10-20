require 'rails_helper'
require 'helpers/user_helpers'
require 'helpers/pictures_helpers'

feature 'Commenting' do
  before {Picture.create description: 'Something', image_file_name: 'test.jpg'}
  scenario 'User can leave a comment' do
    visit '/pictures'
    sign_up('test@test.com', 'testtest')
    click_link 'View picture'
    click_link 'Leave a comment'
    fill_in 'comment_content', with: 'Nice picture of food'
    click_button 'Comment'
    expect(page).to have_content 'Nice picture of food'
  end

  scenario ''
end
