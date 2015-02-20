feature 'Posts' do
  
  context 'Viewing posts' do
    scenario 'No pictures have been added by default' do
      visit '/'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Add an image'
    end

    scenario 'Viewing a single post' do
      create_post
      click_link('Capybara')
      expect(current_path).to include '/posts/'
      expect(page).to have_css('img')
    end
  end

  context 'Creating a post' do
    scenario 'From the homepage' do
      create_post
      expect(page).to have_css("img")
      expect(page).not_to have_content 'No posts'
    end
  end

end

def create_post
  visit '/'
  click_link 'Add an image'
  attach_file 'Image', 'spec/support/capybara.jpg'
  click_button 'Post Image'
end
