feature 'Users' do

  context 'As a new user on the homepage' do
    before(:each) { visit '/' }

    scenario 'Logged out by default' do
      expect(page).to have_link 'Sign up'
      expect(page).to have_link 'Sign in'
    end

    scenario 'Can sign up' do
      sign_up_and_in

      expect(page).to have_content 'Sign out'
      expect(page).to have_content 'Welcome! You have signed up successfully'
    end

    scenario 'Can\'t post an image' do
      click_link 'Add an image'

      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end

  end

  context 'As a logged in user' do
    before do
      sign_up_and_in
    end

    scenario 'Can see a profile of my own posts' do
      create_post 'capybara.jpg'
      create_post 'capybara2.jpg'
      click_link 'Profile'

      expect(page).to have_xpath("//img[@alt='Capybara']")
      expect(page).to have_xpath("//img[@alt='Capybara2']")
    end

  end

end