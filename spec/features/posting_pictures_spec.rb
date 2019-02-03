require 'rails_helper.rb'

feature 'Post pictures' do

  context 'Post pictures' do
    scenario 'User can post pictures with a caption' do
      visit '/'
      click_link 'New Post'
      # attach_file('image', 'spec/files/images/beach.jpg', make_visible: true)
      fill_in 'Caption', with: 'Seas the day #beachlyf'
      click_button 'Create Post'
      expect(page.current_path).to eql('/posts/1')
      expect(page).to have_content('Seas the day #beachlyf')
      # expect(page).to have_css("img[src*='beach.jpg']")
     end


  end




end
