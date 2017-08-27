RSpec.feature "Deleting a photo" do
  before do
    sign_up
    upload
  end

  it "allows a user to delete one of their own photos" do
    visit "/"
    click_first_photo
    within(".delete") do
      find('input[name="commit"]').click
    end
    expect(page).to have_no_css("img[src*='chess.JPG']")
  end

  it "does not show a delete button to other users" do
    logout
    sign_up(username: "penfold",
            email: "penfold@mouse.com",
            password: "ohcrumbs",
            password_confirmation: "ohcrumbs")
    visit "/"
    click_first_photo
    expect(page).to have_no_css(".delete")
  end
end
