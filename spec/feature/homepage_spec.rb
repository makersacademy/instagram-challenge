RSpec.feature 'Visits hompage', type: :feature do
  scenario 'User is welcomed' do
    visit '/'
    expect(page).to have_content('Instagram')
  end
  scenario 'User has option to upload photo' do
    visit '/'
    expect(page).to have_content('Upload')
  end
end
