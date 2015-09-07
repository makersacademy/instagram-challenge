require "rails_helper"

feature "comments" do
  before {
    visit "/"
    sign_up
    add_photo
  }
  scenario "photo uploader can post comments" do
    photo = Photo.last
    click_link "#{ photo.id }"
    expect(page).not_to have_content "Nice pic me :D"
    fill_in "Comment", with: "Nice pic me :D"
    click_button "Post Comment"
    expect(page).to have_content "Nice pic me :D"
  end
end