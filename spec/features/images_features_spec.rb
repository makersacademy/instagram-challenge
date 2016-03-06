feature "Images Feature: " do
  
  before do
    sign_up
    click_link "Post Picture"
    attach_file 'image_image', 'spec/fixtures/files/test.png'
    click_button "Create Image"
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
  end
  
  
end