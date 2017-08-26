RSpec.feature "User profile pages" do
  before do
    sign_up
    2.times { upload }
  end

  it "shows the username and how many photos they have uploaded" do
    visit "/"
    click_link "Profile"
    expect(page).to have_content "@dangermouse"
    expect(page).to have_content "2 photos"
  end
end
