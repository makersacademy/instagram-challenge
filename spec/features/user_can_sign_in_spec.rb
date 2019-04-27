feature 'User can sign in' do
  scenario 'User enters email and password and is redirected to posts page and sees a success message' do
    sign_up_helper(email: 'andy@testemail.com', username: 'Andy', password: '123456')
    sign_in_helper(email: 'andy@testemail.com', password: '123456')
    expect(page).to have_content "Congratulations Gran, you're signed in!"
  end

  scenario 'User enters incorrect email or password and sees a failure message' do
    sign_up_helper(email: 'andy@testemail.com', username: 'Andy', password: '123456')
    sign_in_helper(email: 'andy@testemail.com', password: '1234567')
    expect(page).to have_content "Invalid email/password combination!"
  end
end
