require 'rails_helper'

feature 'commenting' do

  context 'visitor not signed in' do
    before do
      @post = Post.create(image:File.new('/Users/ashwinimani/Pictures/indian_food.jpg'), description: 'delicious')
    end

    scenario 'will not be able to comment on a post' do
      visit('/posts')
      expect(page).to have_content 'delicious'
      expect(page).not_to have_link 'Comment'
    end

  end

  context 'user signed in' do
    before do
      user_sign_up
      add_new_post
    end

    scenario 'let user state his opinion' do
      add_new_comment('mouth watering')
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'mouth watering'
    end

    scenario 'throw an error if opinion is less than 3 letters long' do
      comment = add_new_comment('hi')
      expect(page).to have_content 'Sorry! your comment must be more than 3 letters long'
    end
  end

end
