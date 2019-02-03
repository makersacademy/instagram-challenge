RSpec.feature 'Visit hompage', type: :feature do
  scenario 'User is welcomed' do
    visit '/'
    expect(page).to have_content('Instagram')
  end
end
