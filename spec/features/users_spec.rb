feature 'Users' do

  scenario 'can sign up' do
    sign_up
    expect(User.count).to eq 1
  end

  scenario 'cannot sign up with invalid email' do
    sign_up(email: 'bloggs')
    expect(User.count).to eq 0
  end

  scenario 'cannot sign up with invalid password' do
    sign_up(password: 'blo')
    expect(User.count).to eq 0
  end

  scenario 'cannot sign up without matching passwords' do
    sign_up(password: 'blo')
    expect(User.count).to eq 0
  end

  scenario 'can sign out' do
    sign_up
    click_on 'Sign Out'
    expect(page).to have_content 'Log in'
  end

  scenario 'can sign in' do
    sign_up
    click_on 'Sign Out'
    sign_in
    expect(page).to have_button 'Sign Out'
  end

  scenario 'cannot sign in with incorrect password' do
    sign_up
    click_on 'Sign Out'
    sign_in(email: 'bloggs')
    expect(current_path).to eq '/users/sign_in'
  end

  scenario 'cannot sign in with incorrect password' do
    sign_up
    click_on 'Sign Out'
    sign_in(password: 'blo')
    expect(current_path).to eq '/users/sign_in'
  end

end
