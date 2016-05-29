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

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Make a Post'
      fill_in 'Title', with: 'My First Pic'
      fill_in 'Caption', with: 'a random picture'
      click_button 'Create Post'
      expect(page).to have_content 'My First Pic'
      expect(page).to have_content 'a random picture'
      expect(current_path).to eq '/posts'
    end
end

end