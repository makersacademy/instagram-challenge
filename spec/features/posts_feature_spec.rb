require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a welcome message' do
      visit '/'
      expect(page).to have_content 'MakerGram'
    end

    scenario 'can add a new post' do
      visit '/posts/new'
      fill_in 'Caption', with: 'Pokemon GO'
      attach_file 'post[image]', 'spec/asset_spec/photos/test_image.PNG'
      click_on 'Create Post'
      expect(page).to have_content 'Pokemon GO'
      expect(page).to have_selector("img")
    end
  end


  context 'a post has been added' do

    before do
      Post.create(caption: 'Sunset shot')
    end

    scenario 'should display the text of a post' do
      visit '/'
      expect(page).to have_content 'Sunset shot'
    end
  end
end
