feature 'posts' do
  context 'Adding posts' do
    scenario 'should display a prompt to add a new post' do
      visit '/posts'
      expect(page).to have_link 'Add a post'
    end
  end
end
