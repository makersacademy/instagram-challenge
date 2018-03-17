feature 'Adding likes' do

  before(:each) do
    User.delete_all
  end

  scenario 'Number of likes is increasing' do
    visit('/')
    click_on('Register')
    fill_in('user[username]', :with => 'testusername')
    fill_in('user[email]', :with => 'email@email.com')
    fill_in('user[password]', :with => 'password')
    fill_in('user[password_confirmation]', :with => 'password')
    click_on('Sign up')
    click_on('Like')
    expect(page).to have_content('1')
  end
end
