RSpec.feature "Experience", type: :feature do
  scenario "Displays post caption" do
    visit('/posts/')
    click_link 'NEW MOMENT'
    fill_in 'post[caption]', with: 'Test Caption :)'
    click_button 'SHARE MOMENT'
    click_link 'DELETE MOMENT'
    expect(page).to_not have_content('Test Caption :)')
  end
end
