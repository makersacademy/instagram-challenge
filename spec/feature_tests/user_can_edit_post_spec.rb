require 'rails_helper'
RSpec.describe "Creating posts", :type => :feature do

  before(:all) do
    @post = create(:post)
  end

  feature 'Editing posts' do
    scenario 'can edit a post' do
      visit '/'
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      click_link 'Update post'

      fill_in 'post[comment]', with: 'Not my fave cat'
      click_button 'Update Post'
      expect(page).to have_content("Sorted it 4 u hun")
      expect(page).to have_content("Not my fave cat")
      expect(page).not_to have_content("My Fave Cat")
    end

    scenario 'can not add a file that is not an image' do
      visit '/'
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      click_link 'Update post'

      attach_file 'post[avatar]', Rails.root.join('spec/images/cat.rb')
      click_button 'Update Post'

      expect(page).to have_content('Ya got 3 errors bbz')
      expect(page).to have_content('content type is invalid')
      expect(page).to have_content('is invalid')
      expect(page).to have_content('has contents that are not what they are reported to be')
    end

    scenario 'user can delete posts' do
      visit '/'
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      click_link 'Update post'

      click_link 'Delete Post'
      expect(page).to have_content('Got dat deleted 4 u princess')
      expect(page).to_not have_content("My Fave Cat")
    end
  end
end
