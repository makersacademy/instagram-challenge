feature 'Posts' do

  before do
    sign_user_up
  end

  context 'have not been added' do
    scenario 'should display a prompt to make a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Make a Post'
    end
  end

  context 'have been added' do
    before do
      make_post
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('My First Pic')
      expect(page).to have_content('a random picture')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      make_post
      expect(page).to have_content 'My First Pic'
      expect(page).to have_content 'a random picture'
      expect(page).to have_css("img[src*='poo.jpg']")
      expect(current_path).to eq '/posts'
    end

    scenario 'fails if an image is not attached' do
      make_post_without_image
      expect(page).to have_content 'Error: Image required'
    end
  end

  context 'an invalid post' do
    scenario 'does not let you submit a name that is too short' do
      make_post(title: 'df')
      expect(page).not_to have_css 'h3', text: 'df'
      expect(page).to have_content 'Error: Title must be minimum of 3 characters'
    end
  end

end