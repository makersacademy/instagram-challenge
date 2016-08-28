feature 'posts' do
  context 'Adding posts' do
    scenario 'should display a prompt to add a new post' do
      visit '/posts'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(title: 'dog')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('dog')
    end    
  end
end
