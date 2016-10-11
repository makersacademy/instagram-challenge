feature 'comments' do

  before(:each) do
    visit '/'
    user_sign_up
    post_picture("Wild ducks")
  end

  context 'user can do a few things with a picture' do

    scenario 'user can like an picture' do
      click_on("like_icon")
      visit '/'
      expect(page).to have_content("1 like")
    end

    scenario 'user can post a comment' do
      click_link("comment_icon")
      expect(page).to have_current_path('/pictures/1')
      expect(page).to have_content("Comments")
    end

    scenario 'user save a comment and see it in the feed' do
      click_link("comment_icon")
      fill_in 'comment[comment]', with: "What a beautiful birdy"
      click_button("Post")
      expect(page).to have_current_path('/pictures/1')
      expect(page).to have_content("What a beautiful birdy")
    end

  end
end
