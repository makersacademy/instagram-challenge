require 'rails_helper'

RSpec.feature "New Post", type: :feature do
  scenario "Can upload images and view them" do
    visit '/posts'
    click_link 'New Post'
    click_on 'Create Post'
    expect(page).to have_content("Hello photos!")
  end
end
