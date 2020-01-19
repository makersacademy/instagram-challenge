RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts/new"
    fill_in "Title", with: "Pretty Amazing Post"
    fill_in "Text", with: "Bla bla bla look at me"
    click_button "Submit"
    expect(page).to have_content("Bla bla bla look at me")
  end
end
