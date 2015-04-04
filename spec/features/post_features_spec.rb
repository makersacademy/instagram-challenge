require 'rails_helper'

describe 'Posts' do

  context 'with no posts' do
    scenario 'an add add image link will show' do
      visit '/posts'
      expect(page).to have_link "Add Image"
    end
  end

  context 'add a new post' do

    scenario 'asks for a title then displays the post' do
      visit '/posts'
      click_link "Add Image"
      fill_in "Name", with: "at the beach"
      click_button "Add Image"
      expect(page).to have_content "at the beach"
    end

    scenario 'user adds a posts with a comment' do
      visit '/posts'
      click_link "Add Image"
      fill_in "Name", with: "at the beach"
      fill_in "Comment", with: "nice to be by the sea"
      click_button "Add Image"
      expect(page).to have_content "nice to be by the sea"
    end
  end

end