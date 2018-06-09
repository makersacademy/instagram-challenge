require 'rails_helper'

feature 'posting picture' do
  scenario 'can create a post with a picture' do
    visit '/'
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/mum.jpeg")
    fill_in 'post[description]', with: 'me and my sweet kids'
    click_button 'submit'
    expect(page).to have_content('me and my sweet kids')
    expect(page).to have_css("img[src*='mum.jpeg']")
  end
end
