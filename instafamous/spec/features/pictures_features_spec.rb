require 'rails_helper'

feature 'Pictures' do
  before do
    visit ('/')
    click_link('Sign up')
    fill_in("Email", with: 'test@example.com')
    fill_in("Password", with: 'testtest')
    fill_in("Password confirmation", with: 'testtest')
    click_button('Sign up')
  end

  scenario 'show button on homepage to add a picture' do
    visit('/')
    expect(page).to have_content('No pictures in the network')
    expect(page).to have_button('Add Picture')
  end

  scenario 'add a Picture' do
    visit('/')
    click_link('Add Picture')
    attach_file "Image", Rails.root.join('spec/features/uploads/nuggets.jpeg')
    fill_in 'Caption', with: 'My first photo'
    click_button('Create Picture')
    expect(current_path).to eq ('/pictures')
    expect(page).to have_content('My first photo')
    expect(page).to have_css('.img-post')
  end

  context 'pictures added' do
    before do
      @user = User.create(email: 'test@test.com', password: '123456789')
      @user.pictures.create(caption: 'Photo 1')
    end
    scenario 'show all the pictures on homepage' do
      visit ('/')
      expect(page).to have_content('Photo 1')
    end
  end
end