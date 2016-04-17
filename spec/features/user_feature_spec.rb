describe 'Users' do
  let!(:test_user) {User.create email: DEFAULT_MAIL, password: DEFAULT_PASSWORD}

  context 'logged out user on the main page' do

    before :each do
      visit images_path
    end

    scenario 'should see a link to a registration form' do
      expect(page).to have_link 'Sign up'
    end

    scenario 'should see a link to a login form' do
      expect(page).to have_link 'Sign in'
    end

  end

  context 'logged in user' do

    before :each do
      helper_sign_in
    end

    scenario 'should see a link to a logout form' do
      expect(page).to have_link 'Sign out'
    end

  end

  context 'logged out user on the new image page' do

    before :each do
      visit new_image_path
    end

    scenario 'should be redirected to the main page with a warning' do
      expect(current_path).to eq images_path
      expect(page).to have_content 'You need to be signed in to do that!'
    end

  end

end
