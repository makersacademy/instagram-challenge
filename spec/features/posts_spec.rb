require_relative '../rails_helper'
require './spec/helpers/feature_helper'

feature 'Making posts' do

  scenario 'is not possible by unregistered users' do
    visit '/'
    expect(page).not_to have_link 'New Post'
  end

  scenario 'is possible by registered users' do
    sign_up
    click_link 'My Profile'
    fill_in 'post_text', with: 'A great big Triceratops for my post'
    attach_file("post_avatar", Rails.root + "public/uploads/user/avatar/8/Triceratops.jpg")
    click_button 'Upload Post'
    expect(current_path).to eq root_path
    expect(page).to have_content 'A great big Triceratops for my post'
    expect(page).to have_xpath("//img[contains(@src,'Triceratops.jpg')]")
  end

end
