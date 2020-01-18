RSpec.describe 'logging out', type: :feature do
  scenario 'a user wants to log out from the profile page' do
    sign_up_sam
    click_on 'Log out'

    expect(page).to have_content 'Welcome to Instagram'
  end
end
