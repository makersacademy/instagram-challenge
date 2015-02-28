feature 'posts' do

  context 'no posts have been added' do

    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'There are no posts yet'
      expect(page).to have_link 'Add a post'
    end

  end

  context 'posts have been added' do
    before { Post.create description: 'Awesome latte' }

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Awesome latte')
      expect(page).not_to have_content('There are no posts yet')
    end

  end

  context 'creating posts' do

    scenario 'prompts user to add content, then displays the new post' do
      sign_up('test@test.com', 'testtest', 'testtest')
      add_post('Lazy day')
      expect(page).to have_content 'Lazy day'
      expect(page).to have_css 'img'
      expect(current_path).to eq '/posts'
    end

    scenario 'prevents a user posting if they are not logged in' do
      visit '/posts'
      click_link 'Add a post'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end

    scenario 'an invalid post description' do
      sign_up('test@test.com', 'testtest', 'testtest')
      add_post('X')
      expect(page).not_to have_css 'h2', text: 'X'
      expect(page).to have_content 'error'
    end

  end

  context 'editing posts' do

    scenario 'lets a user edit a post description' do
      sign_up('test@test.com', 'testtest', 'testtest')
      add_post('Lazy day')
      edit_post('Super lazy day')
      expect(page).to have_content 'Super lazy day'
      expect(current_path).to eq '/posts'
    end

    scenario 'an invalid post description update' do
      sign_up('test@test.com', 'testtest', 'testtest')
      add_post('Lazy day')
      edit_post('S')
      expect(page).not_to have_css 'h2', text: 'S'
      expect(page).to have_content 'error'
    end

    scenario 'prevents a user editing a post that is not theirs' do
      sign_up('test@test.com', 'testtest', 'testtest')
      add_post('Lazy day')
      click_link 'Sign out'
      sign_up('steph@test.com', 'stephtest', 'stephtest')
      expect(page).not_to have_link 'Edit post'
    end

  end

  context 'deleting posts' do

    scenario 'lets a user delete a post' do
      sign_up('test@test.com', 'testtest', 'testtest')
      add_post('Lazy day')
      click_link 'Delete post'
      expect(page).not_to have_content 'Lazy day'
      expect(page).not_to have_css 'img'
      expect(page).to have_content 'Post deleted successfully'
    end

    scenario 'prevents a user editing a post that is not theirs' do
      sign_up('test@test.com', 'testtest', 'testtest')
      add_post('Lazy day')
      click_link 'Sign out'
      sign_up('steph@test.com', 'stephtest', 'stephtest')
      expect(page).not_to have_link 'Delete post'
    end

  end

end