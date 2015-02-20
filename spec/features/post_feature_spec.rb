feature 'Posts' do
  context 'Viewing posts' do
    
    scenario 'No pictures have been added by default' do
      visit '/'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Add an image'
    end

  end

  context 'Creating a post' do
    
    scenario 'From the homepage' do
      visit '/'
      click_link 'Add an image'
      attach_file 'Image', 'spec/support/capybara.jpg'
      click_button 'Post Image'
      expect(page).to have_css("img")
      expect(page).not_to have_content 'No posts'
    end

  end
end