require 'rails_helper'
require 'features/helpers/helpers'

RSpec.configure do |c|
  c.include Helpers
end

describe 'Comment' do

  context 'new comment.' do

    let!(:user_post) {Post.create(name: 'at the beach')}

    scenario 'User can add a comment to a post' do
      sign_in_helper
      visit '/posts'
      click_link user_post.id
      click_link 'Add Comment'
      fill_in "Comment", with: 'nice day for a swim'
      click_button "Add Comment"
      expect(page).to have_content 'nice day for a swim'
    end

  end

end

