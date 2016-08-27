require 'rails_helper'

feature 'photographs' do
  let!(:user) do
    User.create(email: 'test@example.com',
                password: 'testtest',
                password_confirmation: 'testtest')
  end


  context 'no photographs have been added' do
    scenario 'should display a prompt to add a photograph' do
      visit '/'
      expect(page).to have_content "Where are all the photographers?"
      expect(page).to have_link "Add a photograph"
    end
  end

  context 'photographs can be viewed' do
    let!(:kitty){ Photograph.create(caption: "Kitty!") }

    scenario 'any user can view a list of photographs' do
      visit '/'
      expect(page).to have_content "Kitty!"
      expect(page).not_to have_content "Where are all the photographers?"
    end

    scenario 'any user can view a single image' do
      visit '/'
      click_link 'Kitty!'
      expect(page).to have_content "Kitty!"
      expect(current_path).to eq "/photographs/#{kitty.id}"
    end
  end

  context 'photographs can be added' do
    scenario 'user can add a caption to an uploaded photograph' do
      sign_in(email: user.email, password: user.password)
      click_link "Add a photograph"
      fill_in "Say something about your photo", with: "Kitty!"
      click_button "Post Photo"
      expect(page).to have_content "Kitty!"
      expect(current_path).to eq root_path
    end
  end

  context 'photograph captions can be edited' do
    before { Photograph.create caption: "Kitty!" }
    scenario 'user can edit the caption of an image' do
      sign_in(email: user.email, password: user.password)
      click_link 'Edit'
      fill_in "Say something about your photo", with: "Such Fluffy! Much Wow!"
      click_button "Update Post"
      expect(page).to have_content "Such Fluffy! Much Wow!"
      expect(page).not_to have_content "Kitty!"
      expect(current_path).to eq "/"
    end
  end

  context 'photographs can be deleted' do
    before { Photograph.create caption: "Kitty!" }
    scenario 'user can delete a photograph when they click the delete link' do
      sign_in(email: user.email, password: user.password)
      click_link 'Delete'
      expect(page).not_to have_content "Kitty!"
      expect(page).to have_content "Your post was deleted successfully"
    end
  end

end
