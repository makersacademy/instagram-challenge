RSpec.feature do
  before do
    sign_up
    upload
  end

  it "shows a single photo" do
    visit "/"
    within(".photo-grid") do
      first("a").click
    end
    expect(page).to have_content "@dangermouse"
    expect(page).to have_content "Emily plays chess!"
  end
end
