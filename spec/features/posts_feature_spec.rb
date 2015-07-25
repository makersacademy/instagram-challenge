require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No cute animal pictures yet'
      expect(page).to have_link 'Add a post'
    end
  end
end

feature 'adds new post' do
  scenario 'successfully adds a new picture' do
    # sign_in
    visit '/posts'
    click_link "Add a post"
    expect(page).to have_content 'Add post'
    fill_in "Title", with: "Monk"
    # attach_file "Large cover", "spec/support/uploads/monk_large.jpg"
    click_button "Add Post"
    expect(page).to have_selector("img[src='/my-flix/monk_large.jpg']")
  end
end
