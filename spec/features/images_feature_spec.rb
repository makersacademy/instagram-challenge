require 'rails_helper'

feature 'images' do
  let(:user) { create :user }

  context 'no images have been added' do
    scenario 'should display a prompt to upload an image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Upload an image'
    end
  end

  context 'images have been added' do
    before do
      user.images.create(caption: 'Test Caption')
    end

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content 'Test Caption'
      expect(page).not_to have_content('No images yet')
    end

    scenario 'display username of image owner' do
      visit '/images'
      expect(page).to have_content 'testie'
    end
  end

  context 'adding images' do
    context 'when logged in' do
      scenario 'prompts user to upload an image, then displays the new image' do
        sign_in(user)
        visit '/'
        click_link 'Upload an image'
        allow_any_instance_of(Paperclip::Attachment).to receive(:url).and_return("/spec/test.png")
        fill_in 'Caption', with: 'Test Caption'
        click_button 'Create Image'
        expect(current_path).to eq '/images'
        expect(page).to have_selector("img")
        expect(page).to have_css ('img[src*="test.png"]')
      end
    end

    context 'when not logged in' do
      scenario 'prompts user to log in or sign up' do
        visit '/'
        click_link 'Upload an image'
        expect(page).to have_content('You need to sign in or sign up before continuing.')
      end
    end

    scenario 'clicking on an image takes you through to the image page' do
      sign_in(user)
      click_link "Upload an image"
      allow_any_instance_of(Paperclip::Attachment).to receive(:url).and_return("/spec/test.png")
      fill_in "Caption", with: "Test Caption"
      click_button "Create Image"
      # visit '/images/1'
      click_link 'Test'
      expect(page).to have_content "Test Caption"
      expect(page).not_to have_content "Upload an image"
    end
  end

  def sign_in(user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Login', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end
