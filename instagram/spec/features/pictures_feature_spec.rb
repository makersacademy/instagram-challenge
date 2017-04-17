require 'rails_helper'


feature 'pictures' do

  context 'no pictures should be added' do
    before do
      visit ('/')
      click_link("Registration")
      fill_in("Email", with: "test@example.com")
      fill_in("Password", with: "testtest")
      fill_in("Password confirmation", with: "testtest")
      click_button("Sign up")
    end

    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content "No pictures yet"
      expect(page).to have_link "New Post"
    end
  end

  context 'pictures have been uploaded' do
    before do
      Picture.create(caption: "Food")
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content("Food")
      expect(page).not_to have_content("No pictures yet")
    end
  end

  context 'uploading images' do
    before do
      visit ('/')
      click_link("Registration")
      fill_in("Email", with: "test@example.com")
      fill_in("Password", with: "testtest")
      fill_in("Password confirmation", with: "testtest")
      click_button("Sign up")
      visit '/'
      click_link "New Post"
      upload_picture
    end

    scenario 'User uploads picture and caption appears on page' do
      expect(page).to have_content "lunch"
    end

    scenario 'displays picture on the page' do
      expect(page).to have_css("img[src*='lunch.png']")
    end

    scenario 'removes a picture when user clicks a delete link' do
      visit '/'
      click_link "Delete picture"
      expect(page).not_to have_css("img[src*='lunch.png']")
    end

    scenario "does not allow you to delete a picture you didn't upload" do
      visit '/'
      click_link("Sign out")
      click_link("Registration")
      fill_in("Email", with: "test2@example2.com")
      fill_in("Password", with: "testtest")
      fill_in("Password confirmation", with: "testtest")
      click_button("Sign up")
      visit '/'
      expect(page).not_to have_link("Delete picture")
    end
  end

  def upload_picture
    fill_in "picture[caption]", with: "lunch"
    attach_file "picture[image]", 'spec/spec_assets/lunch.png'
    click_button "Create Picture"
  end

end
