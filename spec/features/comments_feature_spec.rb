feature 'comments' do

  before(:each) do
    visit '/'
    user_sign_up
    post_picture("Wild ducks")
  end

  context 'user can do a few things with a picture' do

    xscenario 'user can like an picture' do
      click_on("like_icon")
      expect(page).to have_current_path('/pictures')
      expect(page).to have_content("1")
    end

    xscenario 'user can post a comment' do
      click_on("comment_icon")
      expect(page).to have_current_path('/pictures/1/comment/new')
      expect(page).to have_content("Comments")
    end

    xscenario 'user save a comment and see it in the feed' do
      click_on("comment_icon")
      fill_in 'comment[comment]', with: "What a beautiful birdy"
      click_button("Post")
      expect(page).to have_current_path('/pictures')
      expect(page).to have_content("What a beautiful birdy")
    end

  end
end
