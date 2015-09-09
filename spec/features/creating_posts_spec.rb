require 'rails_helper'

feature 'Creating posts' do
  before(:each) do
    user = create(:user)
    visit '/'
    click_link 'Sign In'
    sign_in(user)
    click_link 'New Post'
  end

  scenario 'can create a post' do
    attach_file('Image', "spec/files/images/monkey.jpg")
    allow_any_instance_of(Paperclip::Attachment).to receive(:url).and_return("/spec/files/images/monkey.jpg")
    fill_in 'Caption', with: 'What a cute little #monkey'
    click_button 'Create Post'
    expect(page).to have_content('#monkey')
    expect(page).to have_css("img[src*='monkey.jpg']")
    expect(page).to have_content('monkey123')
  end

  scenario 'cannot create post without image' do
    fill_in 'Caption', with: "Best image ever... NOT"
    click_button 'Create Post'
    expect(page).to have_content('Nope! You need an image to post here!')
  end
end
