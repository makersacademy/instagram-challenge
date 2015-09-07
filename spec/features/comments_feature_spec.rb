require "rails_helper"

feature "comments" do
  before {
    visit "/"
    sign_up
    add_photo
    @photo = Photo.last
  }
  scenario "photo uploader can post comments" do
    click_link "#{ @photo.id }"
    expect(page).not_to have_content "Nice pic me :D"
    fill_in "Comment", with: "Nice pic me :D"
    click_button "Post Comment"
    expect(page).to have_content "Tester: Nice pic me :D"
  end
  scenario "other people signed in can post comments" do
    click_link "Sign out"
    sign_up(email: "test2@email.co.uk", username: "Testing")
    visit "/"
    click_link "#{ @photo.id }"
    fill_in "Comment", with: "Not bad Brah"
    click_button "Post Comment"
    expect(page).to have_content "Testing: Not bad Brah"
    expect(page).to have_link "Testing"
  end
  scenario "users not signed in cannot post comments" do
    click_link "Sign out"
    click_link "#{ @photo.id }"
    expect(page).not_to have_field "Comment"
    expect(page).not_to have_button "Post Comment"
  end
  scenario "users can delete their own comments" do
    click_link "Sign out"
    sign_up(email: "test2@email.co.uk", username: "Testing")
    visit "/"
    click_link "#{ @photo.id }"
    fill_in "Comment", with: "Not bad Brah"
    click_button "Post Comment"
    expect(page).to have_link "Delete Comment"
    click_link "Delete Comment"
    expect(page).not_to have_content "Not bad Brah"
  end
  scenario "users can't delete comments other than their own" do
    click_link "#{ @photo.id }"
    fill_in "Comment", with: "Nice pic me :D"
    click_button "Post Comment"
    click_link "Sign out"
    sign_up(email: "test2@email.co.uk", username: "Testing")
    visit "/"
    click_link "#{ @photo.id }"
    expect(page).not_to have_link "Delete Comment"
  end
end