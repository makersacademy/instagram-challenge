require 'rails_helper'

feature 'Images' do
  scenario 'User can post an image' do
    visit '/images'
    click_button 'Sign In'
    sign_in()
    click_button 'Post an Image'
    click_button 'Upload Image'
    expect(page).to have_xpath("//img[@src=\"/public/images/#{image}\"]")
  end
end
