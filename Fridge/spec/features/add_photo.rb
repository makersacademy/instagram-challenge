feature 'Adding photos' do

  before(:each) do
    User.delete_all
  end

  scenario 'Successful sign up' do
    visit('/')
    click_on('Register')
    fill_in('user[email]', :with => 'email@email.com')
    fill_in('user[password]', :with => 'password')
    fill_in('user[password_confirmation]', :with => 'password')
    click_on('Sign up')
    click_on('Sign up')
  end
end
