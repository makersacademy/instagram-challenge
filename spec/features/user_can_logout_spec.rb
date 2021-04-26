RSpec.feature "Login", type: :feature do
  scenario "allows a User to login" do
    visit '/'
    click_link "Logout"
    expect(page).to have_content("You are a Guest, please login")
  end
end
