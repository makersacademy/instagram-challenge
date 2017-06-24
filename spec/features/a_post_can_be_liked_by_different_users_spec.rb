require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Like', type: :feature do
  scenario 'A post can be liked by different users' do
    sign_up
    add_an_image
    visit '/images'
    click_button 'Like'
    click_on 'Log Out'
    sign_up('test2@gmail.com')
    visit '/images'
    click_button 'Like'
    expect(page).to have_content 'Like 2'
   end
 end
