require 'rails_helper'

feature 'posts' do

  # let(:post_description) { "I love the sun" }
  # let(:post_image) { File.new('spec/photo1.jpg') }

  context 'no posts have been added' do
    scenario 'should display a link to add a post' do
      sign_up
      visit '/posts'
      expect(page).to have_link 'Create a post'
    end

    scenario 'display a message that there are no posts' do
      visit '/posts'
      expect(page).to have_content 'There are no posts yet!'
    end
  end

  context 'creating posts' do
    before do
      sign_up
    end

    scenario 'are then displayed on /posts' do
      create_post
      expect(page).to have_css 'img'
      expect(page).to have_content 'I love the sun'
      expect(page).not_to have_content 'There are no posts yet!'
      expect(current_path).to eq '/posts'
    end

    scenario 'post cannot be created without an image' do
      create_post_without_image
      expect(page).to have_content 'You need an image to post'
    end
  end


  context 'posts have been deleted' do
    before do
      sign_up
      create_post
    end

    scenario 'removes a post when a user clicks a delete link' do
      visit '/posts'
      find(".remove").click
      expect(page).not_to have_content 'I love the sun'
      expect(page).to have_content 'Post deleted successfully'
    end

    scenario 'removes a post when a user clicks a delete link' do
      sign_out
      sign_up_two
      visit '/posts'
      expect(page).not_to have_css(".remove")
      expect(page).to have_content 'I love the sun'
      expect(page).not_to have_content 'Post deleted successfully'
    end
  end

end
