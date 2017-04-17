require 'rails_helper'
require_relative 'helpers/session_helpers'
include SessionHelpers

feature 'like a picture' do
  before do
    sign_up('test@test.com', '11111111', '11111111')
    attach_picture
  end

  scenario 'picture is created with 0 likes' do
    expect(page).to have_content('0 likes')
  end

  scenario 'picture cannot be liked be not signed in user', js: true do
    click_link 'Sign out'
    click_link "Like"
    expect(page).to have_content('0 likes')
  end

  scenario 'picture can only be liked be signed in user', js: true do
    click_link "Like"
    expect(page).to have_content('1 like')
  end

end