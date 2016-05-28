feature "Comments" do
  context "when signed in" do
    before do
      sign_up
      create_post
    end

    scenario "can comment on their own posts" do
      click_link 'Comment'
      fill_in :Content, with: "wow your dinner looks so dreamy"
      expect{click_button "Create Comment"}.to change(Comment, :count).by 1
      expect(page).to have_content "wow your dinner looks so dreamy"
    end
  end
end
