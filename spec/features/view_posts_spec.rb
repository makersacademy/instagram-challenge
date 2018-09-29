require 'rails_helper'

RSpec.feature "View posts", type: :feature do
  scenario "User can view posts" do
    visit "/posts/index"
    expect(page).to have_content('Latest Posts')
  end
end