require 'rails_helper'

feature 'gallery' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      sign_up_and_sign_in
      visit '/galleries'
      expect(page).to have_content "No galleries yet"
      expect(page).to have_link "Add a gallery"
    end
  end

  context "galleries have been added" do
    # before do
    #   # Gallery.create(name: "GB favourites")
    # end

    scenario "display galleries" do
      sign_up_and_sign_in
      create_a_gallery
      expect(page).to have_content("GB favourites")
      expect(page).not_to have_content("No galleries yet")
    end
  end

  context 'creating galleries' do
    scenario 'prompts user to fill out the new gallery creation form, then displays it' do
      sign_up_and_sign_in
      visit '/galleries'
      click_link "Add a gallery"
      fill_in "Name", with: "GB favourites"
      click_button "Create Gallery"
      expect(page).to have_content "GB favourites"
      expect(current_path).to eq "/galleries"
    end
  end

  context 'an invalid gallery' do
    scenario 'does not let you submit a name that is too short' do
      sign_up_and_sign_in
      visit '/galleries'
      click_link 'Add a gallery'
      fill_in 'Name', with: ''
      click_button 'Create Gallery'
      expect(page).to have_content 'Name is too short'
    end
  end

  context 'an invalid gallery' do
    scenario 'does not let you submit a name that is too long' do
      sign_up_and_sign_in
      visit '/galleries'
      click_link 'Add a gallery'
      fill_in 'Name', with: 'This name is 31 chars in length'
      click_button 'Create Gallery'
      expect(page).to have_content 'Name is too long'
    end
  end

  context "viewing galleries" do
    let!(:user1) {User.create(email: 'fred@freddy.co.uk', password: "secret",password_confirmation: "secret")}
    let!(:gallery1) {Gallery.create(name: 'GB Gallery', user_id: user1.id)}
    scenario 'lets a user view a gallery' do
      visit '/galleries'
      click_link 'GB Gallery'
      expect(page).to have_content 'GB Gallery'
      expect(current_path).to eq "/galleries/#{gallery1.id}"
    end
  end

  context 'editing gallery name' do
  before { @user = User.create(email: 'fred@freddy.co.uk', password: "secret",password_confirmation: "secret") }
  before { @gallery = Gallery.create name: 'GB favourites', user_id: @user.id }
    scenario 'let a user edit a gallery' do
      sign_up_and_sign_in
      visit '/galleries'
      click_link "GB favourites"
      click_link "Edit name"
      fill_in 'Name', with: 'GB ultimate favourites'
      click_button 'Update Gallery'
      expect(page).to have_content 'GB ultimate favourites'
      expect(current_path).to eq "/galleries/#{@gallery.id}"
    end
  end

  context 'deleting galleries' do
    before { @user = User.create(email: 'fred@freddy.co.uk', password: "secret",password_confirmation: "secret") }
    before { @gallery = Gallery.create name: 'GB favourites', user_id: @user.id }
    scenario 'removes a gallery when a user clicks a delete link' do
      sign_in(email: 'fred@freddy.co.uk', password: 'secret')
      visit '/galleries'
      click_link "GB favourites"
      click_link 'Delete Gallery'
      expect(page).to have_content "The \"#{@gallery.name}\" gallery was successfully deleted"
    end
  end
end














#
