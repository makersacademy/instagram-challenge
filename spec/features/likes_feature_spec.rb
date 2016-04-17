require "rails_helper"

feature "clicking likes" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    FactoryGirl.create(:photo)
  end

  scenario "a photo's likes count increases when a user clicks like" do
    sign_in_as(user)
    visit photos_path
    expect(page).to have_content "0 likes"
    click_link "Like"
    expect(page).to have_content "1 like"
  end

  scenario "a guest cannot like a photo" do
    visit photos_path
    expect(page).not_to have_link "Like"
  end

  scenario "can only like a photo once" do
    sign_in_as(user)
    visit photos_path
    2.times { click_link "Like" }
    expect(page).to have_content "1 like"
  end
end
