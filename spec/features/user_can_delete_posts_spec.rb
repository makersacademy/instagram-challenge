require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'User can delete posts' do
    sign_up
    new_post
    click_link 'Delete'
    expect(page).not_to have_content('Hello, world!')
    expect(page).not_to have_content(Time.now.strftime('%m/%d/%Y, %H:%M'))
  end
end