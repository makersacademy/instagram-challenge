require "rails_helper"

feature "clicking likes" do
  before do
    FactoryGirl.create(:photo)
  end

  scenario "a photo's likes count increases when a user clicks like" do
    visit photos_path
    click_link "Like"
    expect(page).to have_content "1 like"
  end
end
