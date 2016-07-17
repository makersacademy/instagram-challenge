require 'spec_helper'

feature 'posting images' do

  scenario 'user can add an image' do
    sign_up
    visit '/'
    click_link 'Post a Timstigram'
    fill_in 'Title', :with => 'test'
    attach_file('Image', "spec/test_img/test.jpg")
    click_button 'Upload'
    expect(page).to have_xpath("//img[contains(@src,'image.jpg')]")
    expect(page).to have_content 'test'
  end

  scenario 'user must sign in before posting an image' do
    visit '/'
    click_link 'Post a Timstigram'
    expect(page).to have_content 'Log in'
  end
end
