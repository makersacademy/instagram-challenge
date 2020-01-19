require 'rails_helper'

feature 'upload image' do
  scenario 'user can upload 1 image' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'Email', with: "dbacall@hotmail.co.uk"
    fill_in 'Password', with: 'password'
    within ".submit-field" do
      click_on 'Sign up'
    end
    click_on 'New Fatcat'
    attach_file('Image', Rails.root + 'spec/test_images/download.jpeg')
    fill_in 'Caption', with: 'my fat cat'
    click_on 'Upload'
    expect(page).to have_xpath("//img[contains(@src,'download.jpeg')]")
  end
end