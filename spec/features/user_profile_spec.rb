RSpec.feature "User profile pages" do
  before do
    sign_up
    upload
  end

  it "shows the username and how many photos they have uploaded" do
    visit "/"
    click_link "Profile"
    expect(page).to have_content "@dangermouse"
    expect(page).to have_content "1 photo"
  end

  it "allows users to follow each other" do
    logout
    sign_up(username: "penfold",
            email: "penfold@mouse.com",
            password: "ohcrumbs",
            password_confirmation: "ohcrumbs")
    follow
    expect(page).to have_selector("input[type=submit][value='Unfollow']")
  end

  it "allows users to unfollow each other" do
    logout
    sign_up(username: "penfold",
            email: "penfold@mouse.com",
            password: "ohcrumbs",
            password_confirmation: "ohcrumbs")
    follow
    click_button "Unfollow"
    expect(page).to have_selector("input[type=submit][value='Follow']")
  end
end
