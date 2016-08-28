feature 'User Profiles' do

  scenario 'Each signed up user has there own personal profile page' do
    sign_up(username: 'mannieg')
    click_link 'Profile'
    expect(current_path).to eq '/mannieg'
    expect(page).to have_content 'mannieg'
  end
end
