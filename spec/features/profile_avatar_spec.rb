require_relative '../rails_helper'
require './spec/helpers/feature_helper'

feature 'Uploading profile avatars' do

  scenario 'is not possible by unregistered users' do
    visit '/'
    expect(page).not_to have_link 'New Post'
  end

  scenario 'is possible by registered users' do
    sign_up
    click_link 'My Profile'
    attach_file("user_picture", Rails.root + "public/uploads/user/avatar/8/Muldoon.png")
    click_button 'Upload Avatar'
    expect(current_path).to eq root_path
    expect(page).to have_xpath("//img[contains(@src,'Muldoon.png')]")
  end

end
