require 'rails_helper'

RSpec.feature "Deleting posts", type: :feature do

  before(:each) do
    create_crepe_post
    visit "/"
  end

  scenario "Posts can be deleted" do
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_on "Delete"
    expect(page).to have_content("Your post has been succesfully deleted")
    expect(page).to_not have_content("Weekend Brunch")
  end
end
