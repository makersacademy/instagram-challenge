feature "Images Feature: " do
  
  before do
    sign_up
    post_picture
  end
  
  context "As a logged in user" do
    
    scenario "I can add pictures to my account" do
      expect(page).to have_selector 'img'
    end
    
    scenario "I can delete pictures from my account" do
      click_link "user_account"
      click_link "Delete picture"
      click_link "HOME"
      expect(page).not_to have_selector 'img'
    end
    
    scenario "I can add a comment to pictures I post" do
      post_picture "Nice one!"
      expect(page).to have_content "Nice one!"
    end
  end
  
  
end