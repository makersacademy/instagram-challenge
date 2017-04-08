feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to post a pic' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post a pic'
    end
  end
end
