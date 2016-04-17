feature 'Like' do
  context "A user can like another user's image" do
    before do
      signup_user1
      upload_image1
      signout
      signup_user2
    end

    scenario 'when "like" is clicked, like count goes up' do
      click_link 'Like'
      expect(page).to have_content("Likes 1")
    end  
  end
end