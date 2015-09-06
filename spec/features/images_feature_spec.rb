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
      Image.create(caption: 'Test Caption')
    end

    scenario 'display images' do
      visit '/images'
      expect(page).to have_content 'Test Caption'
      expect(page).not_to have_content('No images yet')
    end
  end
  context 'when logged in' do
    context 'adding images' do
      scenario 'prompts user to upload an image, then displays the new image' do
        sign_in(user)
        visit '/'
        click_link 'Upload an image'
        attach_file 'Upload', "spec/test.png"
        fill_in 'Caption', with: 'Test Caption'
        click_button 'Create Image'
        expect(current_path).to eq '/images'
        expect(page).to have_selector("img")
      end
    end
  end

  context 'when not logged in' do
    context 'adding images' do
      scenario 'prompts user to log in or sign up' do
        visit '/'
        click_link 'Upload an image'
        expect(page).to have_content('You need to sign in or sign up before continuing.')
      end
    end
  end

  def sign_in(user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end
end
