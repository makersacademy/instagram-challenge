RSpec.feature do
  before do
    sign_up
    upload
    visit "/"
    within(".photo-grid") do
      first("a").click
    end
  end

  it "shows a single photo" do
    expect(page).to have_content "@dangermouse"
    expect(page).to have_content "Emily plays chess!"
  end

  it "links to the user's profile" do
    click_link "@dangermouse"
    expect(page).to have_current_path "/profiles/dangermouse"
  end

  it "allows users to comment on photos" do
    fill_in "comment_text", with: "Great photo!"
    click_button "Add comment"
    expect(page).to have_content "@dangermouse: Great photo!"
  end

  it "links to the profiles of commenters" do
    fill_in "comment_text", with: "Great photo!"
    click_button "Add comment"
    click_link "@dangermouse:"
    expect(page).to have_current_path "/profiles/dangermouse"
  end
end
