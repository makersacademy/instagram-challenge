require 'rails_helper'

feature 'Posts' do
  scenario 'No posts have been created' do
    visit '/posts'
    expect(page).to have_content "No Posts Yet"
    expect(page).to have_content "Post a new photo"
  end

  scenario 'View posts that have been created' do
    post = Post.create(description: "Loving life")
    visit '/posts'
    expect(page).to have_content "Loving life"
    expect(page).not_to have_content "No Posts Yet"
  end

  scenario 'Post a new photo' do
    visit '/posts'
    click_link "Post a new photo"
    fill_in "Description", with: "Loving life"
    click_button "Create Post"
    expect(current_path).to eq '/posts'
    expect(page).to have_content "Loving life"
  end

end
