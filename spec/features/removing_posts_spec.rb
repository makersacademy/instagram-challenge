# frozen_string_literal: true

require 'rails_helper'

feature 'Removing posts' do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, caption: 'Amazing sunrise! #sunrise') }

  background do
    visit '/'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  scenario 'can remove a post' do
    find(:xpath, '//*[@id="dropdownMenuButton"]').click
    find(:xpath, '/html/body/div[2]/section/div[1]/div[3]/div/form/input[2]').click
    expect(page).to(have_content('Post deleted'))
    expect(page).to_not(have_content('Amazing sunrise! #sunrise'))
  end
end
