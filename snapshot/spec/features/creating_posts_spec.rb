feature 'creating posts' do
  context 'no posts yet' do
    scenario 'should display a prompt to add a new post' do
      visit '/posts'
      expect(page).to have_content 'OMG, there are no photos yet!'
      expect(page).to have_link 'New Post'
    end
  end

end
