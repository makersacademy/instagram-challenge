feature 'User can sign out' do
  scenario 'User signs in, then signs out and gets sign out message' do
    sign_up_helper(email: 'andy@testemail.com', username: 'Andy', password: '123456')
    sign_in_helper(email: 'andy@testemail.com', password: '123456')
    click_link 'Log Out'
    expect(page).to have_content "You're now signed out"
  end
end
