feature 'Posts' do
  context 'Viewing posts' do
    
    scenario 'No pictures have been added' do
      visit '/'
      expect(page).to have_content 'No posts'
      expect(page).to have_link 'Add an image'
    end

  end
end