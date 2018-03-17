feature 'Sign up' do

  before(:each) do
    User.delete_all
  end

  scenario 'Successful sign up' do
    visit('/')
    click_on('Register')
    fill_in('user[username]', :with => 'testusername')
    fill_in('user[email]', :with => 'email@email.com')
    fill_in('user[password]', :with => 'password')
    fill_in('user[password_confirmation]', :with => 'password')
    click_on('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
