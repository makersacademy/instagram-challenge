require 'rails_helper'

feature 'Posts' do
  scenario 'No posts have been created' do
    sign_up
    expect(page).to have_content "No Posts Yet"
    expect(page).to have_content "Post a new photo"
  end

  scenario 'View posts that have been created' do
    sign_up
    add_post
    visit '/posts'
    expect(page).to have_content "Beach life"
    expect(page).not_to have_content "No Posts Yet"
  end

  scenario 'Post a new photo' do
    sign_up
    click_link "Post a new photo"
    fill_in "Description", with: "Loving life"
    attach_file("post_image", "#{Rails.root}/spec/beach.jpg")
    click_button "Create Post"
    expect(current_path).to eq '/posts'
    expect(page).to have_css("img")
  end

  scenario 'Delete a photo' do
    sign_up
    add_post
    visit '/posts'
    find(".remove").click
    expect(current_path).to eq '/posts'
    expect(page).not_to have_content "Beach life"
  end

  scenario "Delete a photo only if you posted it" do
    sign_up
    add_post
    click_link "Sign Out"
    sign_up2
    visit '/posts'
    find(".remove").click
    expect(page).to have_content "Only creator can delete post"
  end

end
