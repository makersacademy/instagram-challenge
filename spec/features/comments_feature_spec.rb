require 'rails_helper'

RSpec.feature 'Comments Features' do
  let!(:post) { FactoryGirl.create(:post) }

  context 'creating a comment' do
    context 'while signed in' do
      before(:each) do
        user = FactoryGirl.create(:user)
        login_as(user)
      end

      scenario 'a user can add a new comment to a post' do
        visit "/posts/#{post.id}"
        click_link 'Add Comment'
        fill_in 'Comment', with: 'Hey I can write epic comments'
        click_button 'Create Comment'

        expect(current_path).to eq post_path(post)
        expect(page).to have_content 'Hey I can write epic comments'
      end
    end
  end
end
