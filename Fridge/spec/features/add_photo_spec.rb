feature 'Adding photos' do

  before(:each) do
    User.delete_all
  end

  scenario 'Sees thanks when photo is added' do
    visit('/')
    click_on('Register')
    fill_in('user[username]', :with => 'testusername')
    fill_in('user[email]', :with => 'email@email.com')
    fill_in('user[password]', :with => 'password')
    fill_in('user[password_confirmation]', :with => 'password')
    click_on('Sign up')
    click_on('Add Photo')
    fill_in('photo[description]', :with => 'password')
    click_on('Create Photo')
    expect(page).to have_content('Thank you testusername for adding a photo')
  end 
end
