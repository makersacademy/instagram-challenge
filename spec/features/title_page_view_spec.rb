RSpec.feature "Experience", type: :feature do
  scenario "Displays title header content" do
    visit('/posts/index')
    expect(page).to have_content('MOMENTS')
  end
end
