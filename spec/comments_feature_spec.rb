require 'Rails_helper'

feature 'A user can comment on an image' do
  scenario 'comment on an image' do
    sign_up_and_in("Russell", "Vaughan", "russellvaughan", "russell@example.com")
    create_photo
    click_link("Add a comment")
    fill_in("comment[body]", with: "you have a cute cat" )
    click_button("Create Comment")
    expect(page).to have_content("you have a cute cat" )
  end
end