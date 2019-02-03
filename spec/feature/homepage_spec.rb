RSpec.feature 'Visits hompage', type: :feature do
  scenario 'User is welcomed' do
    visit '/'
    expect(page).to have_content('Instagram')
  end
  scenario 'User has button to upload photo' do
    visit '/'
    expect(page).to have_button('Upload')
  end
end
