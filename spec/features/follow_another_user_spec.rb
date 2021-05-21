require 'rails_helper'

describe 'Follow', type: :feature do
  scenario 'lets users follow another user' do 
    register 
    make_post
    click_link 'Log out'
    register_another_user
    click_link 'peterpan'
    click_link 'Follow'
    expect(page).to have_content 'You followed peterpan'
    expect(page).to have_link 'Unfollow'
  end 
end 