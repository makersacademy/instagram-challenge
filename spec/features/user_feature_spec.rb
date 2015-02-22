feature 'Users' do
  context 'As a user on the homepage' do

    scenario 'Logged out by default' do
      visit '/'

      expect(page).to have_link 'Sign up'
      expect(page).to have_link 'Sign in'
    end

  end
end