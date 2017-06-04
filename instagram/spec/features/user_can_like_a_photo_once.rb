require './spec/rails_helper'

RSpec.feature 'Like', type: :feature do

  scenario 'User can like a photo', :type => :feature do
    sign_up
    visit '/photos'
    upload_photo
    click_button 'Like'
    expect(page).to have_content('Like 1')
  end

  scenario 'User cannot like a photo more than once', :type => :feature do
    sign_up
    visit '/photos'
    upload_photo
    click_button 'Like'
    click_button 'Like'
    expect(page).to have_content('Like 1')
    expect(page).not_to have_content('Like 2')
  end

end
