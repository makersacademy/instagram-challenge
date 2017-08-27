RSpec.feature "User feed" do

  before do
    dangermouse = create(:user)
    penfold = create(:user, email: "penfold@mouse.com", username: "penfold")
    dangermouse.followers << penfold
    create(:photo, user: dangermouse)
    sign_in(email: penfold.email, password: penfold.password)
  end

  it "shows the names of the users a user follows" do
    visit "/"
    click_link "Feed"
    expect(page).to have_content("@dangermouse")
  end

  it "shows the user photos posted by the users they follow" do
    visit "/"
    click_link "Feed"
    expect(page).to have_css("img[src*='chess.JPG']")
  end
end
