feature "User can Login and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'Login' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Login')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'Logout' link" do
      visit('/')
      expect(page).not_to have_link('Logout')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'apassword')
      fill_in('Password confirmation', with: 'apassword')
      click_button('Sign up')
    end

    it "should see 'Logout' link" do
      visit('/')
      expect(page).to have_link('Logout')
    end

    it "should not see a 'Login' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Login')
      expect(page).not_to have_link('Sign up')
    end
  end
end
