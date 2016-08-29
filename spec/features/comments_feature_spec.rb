require 'rails_helper'

feature 'comments' do

  before :each do
    add_photo
  end

  context 'Adding a comment' do

    scenario 'A comment is added to a post' do
      click_link 'Comment'
      fill_in :comment_content, with: 'This is wicked cool'
      click_button 'Comment'
      expect(page).to have_content 'This is wicked cool'
    end

  end

end
