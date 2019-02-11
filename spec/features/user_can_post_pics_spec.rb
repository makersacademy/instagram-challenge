require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.new(id: 1))
  end

  scenario "Can post pics and view them on the index page" do
    post_pic
    visit "/pics"
    post_pic
    visit "/pics"
    expect(Pic.count).to be(2)
    expect(page).to have_content("First pic", count: 2)
  end

  scenario "Can visit the individual pic page from the index page" do
    post_pic
    visit "/pics"
    click_link "Show"
    expect(page).to have_content("First pic")
  end

end
