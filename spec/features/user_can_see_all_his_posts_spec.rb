require 'rails_helper'

feature "a user can see" do
  scenario "his posts" do
    sign_up_and_add_post
    click_link('Add a post')
    add_post(post_title: "second post", post_link: "http://i.imgur.com/OxirR7K.jpg")
    expect(current_path).to eq("/users/1")
    expect(page).to have_content("first post")
    expect(page).to have_content("second post")
  end

    scenario "other user's posts" do
      sign_up_and_add_post
      click_link('Add a post')
      add_post(post_title: "second post", post_link: "http://i.imgur.com/OxirR7K.jpg")
      click_link('Log out')
      visit("/users/1")
      expect(page).to have_content("first post")
      expect(page).to have_content("second post")
    end


end
