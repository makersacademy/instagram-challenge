require 'rails_helper'

describe 'Posts#New' do
  context 'Posting' do
    scenario 'user submits with comment' do
      visit 'posts/new'
      fill_in :comment, with: 'My first post'
      click_button 'Post'
    end
  end
end