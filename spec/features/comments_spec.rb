feature "Comments" do
  context "when signed in" do

    before do
      sign_up
      create_post
      create_comment
    end

    scenario "can make multiple comments which show username" do
      create_comment content: "I wouldn't touch that with a barge pole"
      expect(page).to have_content "bob: wow your dinner looks so dreamy"
      expect(page).to have_content "bob: I wouldn't touch that with a barge"
    end

    scenario "posts with comments can be deleted by user" do
      click_link "Delete post"
      expect(page).not_to have_content "bob: wow your dinner looks so dreamy"
      expect(page).not_to have_content "Beautiful Sunset"
    end
  end

  context "when not signed in" do
    before do
      sign_up
      create_post
      click_link "Sign out"
    end

    scenario "asked to sign in whem attempting to make comment" do
      click_link "Comment"
      expect(page).not_to have_content "Content"
      expect(page).to have_content "Email"
      expect(page).to have_content "Password"

    end
  end
end
