require 'rails_helper'

feature 'Comments' do

  before do
    sign_up
    add_picture
  end

  scenario 'User logged in and picture uploaded' do
    click_link 'Comment'
    fill_in 'Comment', with: 'First'
    expect(page).to have_content 'First'
  end
end
