require 'rails_helper'

RSpec.feature 'Posts' do
  context 'when no posts have been posted' do
    scenario 'there is a link to add an image and a prompt to start' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Create Post'
    end
  end
end
