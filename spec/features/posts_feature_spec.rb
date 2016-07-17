require 'rails_helper'

feature 'Posts' do
  context 'no posts have been added' do
    scenario 'should display a welcome message' do
      visit '/'
      expect(page).to have_content 'MakerGram'
    end

    scenario 'can add a new post' do
      sign_up
      post_a_picture
      visit '/'
      expect(page).to have_content 'testPicture'
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
