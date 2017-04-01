feature "User can Log in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'Log in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'Log out' link" do
      visit('/')
      expect(page).not_to have_link('Log out')
    end
  end

  context 'user sign up' do
    scenario 'user can sign up for an account' do
      expect{sign_up}.to change{User.count}.by(1)
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up
    end

    it "should see 'Log out' link" do
      visit('/')
      expect(page).to have_link('Log out')
    end

    it "should not see a 'Log in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
