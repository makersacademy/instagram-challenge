feature 'Posts' do

  context 'have not been added' do
    scenario 'should display a prompt to make a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Make a Post'
    end
  end

  context 'have been added' do
    before do
      Post.create(title: 'Picture', caption: 'a picture')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Picture')
      expect(page).to have_content('a picture')
      expect(page).not_to have_content('No posts yet')
    end
  end

end