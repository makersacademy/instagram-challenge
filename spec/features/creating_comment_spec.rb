feature "creating comment" do

  before do
    user = FactoryGirl.create(:user)
    post = FactoryGirl.create(:post, user: user)
    log_in
  end

  scenario "add a comment to a post" do
    visit "/"
    fill_in "Content", with: "lol"
    click_button "Create"
    expect(page).to have_css("div#comments_1", text: "lol")
    expect(page).to have_content "Congratulations, you've left a comment!"
  end

end
