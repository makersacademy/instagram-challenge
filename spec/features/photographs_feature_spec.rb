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

  context 'A signed in user can' do
    context 'add a photograph' do

      scenario 'must be signed in to post a photo' do
        visit '/'
        expect(page).not_to have_content "Add a photograph"
        sign_in(email: user.email, password: user.password)
        expect(page).to have_content "Add a photograph"
      end


      scenario 'add a caption to an uploaded photograph' do
        sign_in(email: user.email, password: user.password)
        click_link "Add a photograph"
        fill_in "Say something about your photo", with: "Kitty!"
        click_button "Post Photo"
        expect(page).to have_content "Kitty!"
        expect(current_path).to eq root_path
      end

      scenario 'upload a photograph' do
        sign_in(email: user.email, password: user.password)
        click_link "Add a photograph"
        page.attach_file "photograph[image]", Rails.root + 'spec/fixtures/kitty_1.jpeg'
        fill_in "Say something about your photo", with: "Kitty!"
        click_button "Post Photo"
        expect(page).to have_content "Kitty!"
        expect(page).to have_content "Photo has been successfully added"
        expect(current_path).to eq root_path
        expect(page).to have_xpath("//img[contains(@src,'kitty_1.jpeg')]")

      end
    end

    context 'edit a photograph or caption' do
      scenario 'user can edit the caption of an image' do
        sign_in(email: user.email, password: user.password)
        create_photograph
        click_link 'Edit'
        fill_in "Say something about your photo", with: "Such Fluffy! Much Wow!"
        click_button "Update Post"
        expect(page).to have_content "Such Fluffy! Much Wow!"
        expect(page).not_to have_content "Kitty!"
        expect(current_path).to eq "/"
      end
    end

    context 'can delete a photograph' do
      scenario 'user can delete a photograph when they click the delete link' do
        sign_in(email: user.email, password: user.password)
        create_photograph
        click_link 'Delete'
        expect(page).not_to have_content "Kitty!"
        expect(page).to have_content "Your post was deleted successfully"
      end
    end
  end

end
