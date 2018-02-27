require 'rails_helper'
RSpec.describe "Editing posts", :type => :feature do

  before do
    @post = create(:post)
    login
  end

  feature 'Editing posts' do
    scenario 'can edit a post' do
      show_post_to_update

      fill_in 'post[comment]', with: 'Not my fave cat'
      click_button 'Update Post'
      expect(page).to have_content("Sorted it 4 u hun")
      expect(page).to have_content("Not my fave cat")
      expect(page).not_to have_content("My Fave Cat")
    end

    scenario 'can not add a file that is not an image' do
      show_post_to_update

      attach_file 'post[avatar]', Rails.root.join('spec/images/cat.rb')
      click_button 'Update Post'

      expect(page).to have_content('Ya got 3 errors bbz')
      expect(page).to have_content('content type is invalid')
      expect(page).to have_content('is invalid')
      expect(page).to have_content('has contents that are not what they are reported to be')
    end

    scenario 'user can delete posts' do
      show_post_to_update

      click_link 'Delete Post'
      expect(page).to have_content('Got dat deleted 4 u princess')
      expect(page).to_not have_content("My Fave Cat")
    end
    scenario 'deleting post with comments deletes all comments' do
      add_comment("Cool Cat")
      add_comment("Really? Not cool")
      expect(Comment.count).to eq 2
      show_post_to_update
      click_link 'Delete Post'
      expect(Comment.count).to eq 0
    end
  end
end
