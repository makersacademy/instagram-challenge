require 'rails_helper'
require 'web_helpers'

RSpec.feature "Timeline", type: :feature do

  before do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(User.new(id: 1))
  end

  scenario "Can post pics and view them on the index page" do
    post_pic
    visit "/pics"
    expect(page).to have_content("First pic")
    # test the existance of the image
  end

  scenario "Can visit the individual pic page from the index page" do
    post_pic
    visit "/pics"
    # click on the show to reach the individual pic page
    expect(page).to have_content("First pic")
    # test the existance of the image
  end

end
