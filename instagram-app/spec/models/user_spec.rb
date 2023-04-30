feature 'User' do

  scenario 'can sign in' do
    visit '/images'
    click_button 'Sign In'
    sign_in()
    expect(page).to have_content('Welcome to Nick-Sta-Gram!')
    expect(page).to have_button('Post an Image')
  end

end
