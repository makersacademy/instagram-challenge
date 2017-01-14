require 'rails_helper'

feature 'Posts' do
  scenario 'No posts have been created' do
    visit '/posts'
    expect(page).to have_content "No Posts Yet"
    expect(page).to have_content "Post a new photo"
  end

  scenario 'Create a post' do
    post = Post.create(description: "Loving life")
    visit '/posts'
    expect(page).to have_content "Loving life"
    expect(page).not_to have_content "No Posts Yet"
  end
  
end
