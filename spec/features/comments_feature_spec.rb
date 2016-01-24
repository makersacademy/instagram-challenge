require 'rails_helper'

RSpec.feature 'Comments Features' do
  let!(:post) { FactoryGirl.create(:post) }

  context 'creating a comment' do
    context 'while signed in' do
      before(:each) do
        user = FactoryGirl.create(:user)
        login_as(user)
      end

      xscenario 'a user can add a new comment to a post' do
        visit "/posts/#{post.id}"
      end
    end
  end
end
