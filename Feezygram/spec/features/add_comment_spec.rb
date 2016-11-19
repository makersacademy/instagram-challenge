feature 'add a comment' do

  before do
    @user = User.create email: 'example@example.com', password: "password", password_confirmation: "password"
    login_as @user
    visit '/'
    click_link "New Gram"
    page.attach_file "gram_image", 'spec/fixtures/files/test_pic.jpg' 
    click_button "GRAM IT" 
  end

  it "can add a comment to a picture" do
    fill_in :comment_body, with: "Example comment"
    expect{click_button "Create Comment"}.to change{@user.comments.count}.by 1
    expect(page).to have_content "Comment successfully added"
  end

  it "cannot add a comment if not signed in" do
    click_link "Sign Out"
    click_link "Show Page"
    fill_in :comment_body, with: "Example comment"
    expect{click_button "Create Comment"}.to_not change{Comment.count}
  end


end