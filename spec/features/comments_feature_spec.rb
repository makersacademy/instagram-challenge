require 'rails_helper'
require 'helpers/user_helpers'
require 'helpers/pictures_helpers'

feature 'Commenting' do
  before(:each) do
    @user = build(:user)
    Picture.create description: 'Something', image_file_name: 'test.jpg'
  end
  scenario 'User can leave a comment' do
    visit pictures_path
    sign_up(@user.email, @user.password)
    click_link 'View picture'
    click_link 'Leave a comment'
    fill_in 'comment_content', with: 'Nice picture of food'
    click_button 'Comment'
    expect(page).to have_content 'Nice picture of food'
  end

  scenario 'User cannot see delete button on comment they did not make' do
    visit pictures_path
    user2 = build(:user, email: "random@email.com")
    sign_up(@user.email, @user.password)
    click_link 'View picture'
    click_link 'Leave a comment'
    fill_in 'comment_content', with: 'This is a cool picture'
    click_button 'Comment'
    click_link 'Sign out'
    sign_up(user2.email, user2.password)
    click_link 'View picture'
    expect(page).to_not have_content('Delete comment')
  end
end
