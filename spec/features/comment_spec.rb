feature 'Comments' do
  before do
    @user = User.create(email: "test@test.com",
                        username: "test12",
                        password: "1234abcd",
                        password_confirmation: "1234abcd")
    login_as @user
    @post = @user.posts.create title: "Hello world!"
    visit '/'
    click_link "Comment"
    fill_in "comment[body]", with: "Lovely image!"
    click_button "Send"

  end

  scenario 'Users can leave comments on posts' do
    within ".comments" do
      expect(page).to have_content "Lovely image! test12" 
    end
  end

  scenario 'Users can delete comments they have made' do
    click_link "Delete Comment"
    within ".comments" do
      expect(page).not_to have_content "Lovely image! test12"
    end
  end

  context 'user doesn\'t own comment' do
    scenario 'can\'t delete comment' do
      logout(@user)
      @user2 = User.create(email: "test2@test.com",
                        username: "test13",
                        password: "1234abcd",
                        password_confirmation: "1234abcd")
      login_as @user2
      visit '/'
      click_link "Comment"
      within ".comments" do
        expect(page).to have_content "Lovely image! test12"
        expect(page).not_to have_content "Delete"
      end
    end
  end
end
