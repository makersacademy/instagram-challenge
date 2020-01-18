RSpec.describe 'signing up', type: :feature do
  scenario 'a user signs up' do
    visit '/'
    click_on 'Sign up'
    fill_in 'first_name', with: 'Sam'
    fill_in 'last_name', with: 'Folo'
    fill_in 'email', with: 'sam@example.com'
    fill_in 'password', with: '1234icecream'
    fill_in 'password_confirmation', with: '1234icecream'
    click_on 'Submit'

    expect(page).to have_content "Sam's feed"
  end
end
