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

  context 'creating posts' do
    scenario 'prompts user to add a post, then displays the new post\'s title' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Title', with: 'dog'
      click_button 'Create Post'
      expect(page).to have_content 'dog'
      expect(current_path).to eq '/posts'
    end

  end
end
