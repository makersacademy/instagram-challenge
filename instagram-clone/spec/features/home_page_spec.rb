RSpec.describe 'Home Page', type: :feature do
  scenario 'a user visits the site for the first time' do
    visit '/'
    expect(page).to have_content 'Pinstagram'
  end
end
