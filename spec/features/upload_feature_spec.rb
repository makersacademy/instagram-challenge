require 'rails_helper'

feature 'Uploads' do
  scenario 'When no uploads are made' do
    visit '/'
    expect(page).to have_content("No uploads yet")
  end

  context 'When signed in' do
    before { sign_up('adowellphoto@gmail.com', 'password') }
    scenario 'can upload an image' do
      upload_image("Me having a grand time in bed", true)
      expect(page).to have_content("Me having a grand time in bed")
      expect(page).to have_css("img[src*='test.jpeg']")
      expect(page).not_to have_css("img[src*='missing.jpeg']")
    end
    scenario 'can try uploading without an image' do
      upload_image("missing image!")
      expect(page).to have_css("img[src*='missing.jpeg']")
    end
  end

  context 'When not signed in' do
    scenario 'cannot upload an image' do
      visit '/'
      expect(page).not_to have_content("Upload a new image")
      visit '/uploads/new'
      expect(page).to have_content("Log in")
    end
  end
end