require 'rails_helper'

RSpec.feature "Delete", type: :feature, js: true do
  scenario "User can delete posts" do
    user_sign_up
    log_in
    create_post
    visit('/posts')
    find('a.deleter').click
    expect(page).not_to have_content("kim_morgan")
    expect(page).not_to have_content("My breakfast")
    expect(page).not_to have_content("Less than a minute ago")
    expect(page).to have_current_path("/posts")
  end
end