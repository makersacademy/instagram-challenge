require 'rails_helper'

RSpec.feature 'Likes Features' do
  let!(:post) { FactoryGirl.create(:post) }

  context 'creating a like' do
    context 'while signed in' do
      let!(:user) { FactoryGirl.create(:user) }
      before(:each) { login_as(user) }

      scenario 'a user can like a post' do
        visit '/posts'
        expect(page).to have_content '0 likes'
        click_link 'Like!'

        expect(current_path).to eq posts_path
        expect(page).to have_content '1 like'
      end
    end
  end
end
