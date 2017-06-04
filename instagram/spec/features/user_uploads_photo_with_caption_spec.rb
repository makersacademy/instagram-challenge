require './spec/rails_helper'

RSpec.feature 'Photos', type: :feature do

  scenario 'User uploads photo and photo renders with User email address', :type => :feature do
    sign_up
    visit '/photos'
    click_link 'New Photo'
    page.attach_file('photo_image', './app/assets/images/instagram.jpg')
    click_button 'Create Photo'
    expect(page).to have_content('Posted by: example@email.com')
  end

end
