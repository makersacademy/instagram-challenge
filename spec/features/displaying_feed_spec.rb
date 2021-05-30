# frozen_string_literal: true

require 'rails_helper'

feature 'Index displays all posts' do
  background do
    user = create(:user)
    visit '/'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  scenario 'can view all posts with correct information' do
    create(:post, caption: 'One')
    create(:post, caption: 'Two')

    visit '/'
    expect(page).to(have_content('One'))
    expect(page).to(have_content('Two'))
    expect(page).to(have_css("img[src*='sunrise.jpg']"))
  end
end
