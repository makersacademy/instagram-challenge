require 'helpers/user_helpers'
require 'helpers/pictures_helpers'

include UserHelpers
include PicturesHelpers

feature 'pictures' do
  before(:each) do
    @user = build(:user)
  end

  scenario 'I can fill out a form to add a picture' do
    visit pictures_path
    sign_up(@user.email, @user.password)
    add_picture('What a cool picture')
    expect(current_path).to eq pictures_path
  end

  context 'picture has been added' do
    before { Picture.create description: 'Look at my dinner', image_file_name: 'test.jpg'}
    scenario 'I can see picture descriptions' do
      visit pictures_path
      expect(page).to have_content('Look at my dinner')
    end
  end

  context 'viewing pictures' do
    let!(:pic){Picture.create(description: 'something', image_file_name: 'test.jpg')}
    scenario 'View picture links to the appropriate picture through its id' do
      visit pictures_path
      click_link 'View picture'
      expect(current_path).to eq picture_path(pic.id)
    end
  end

  context 'updating pictures' do
    scenario 'I can edit a picture' do
      visit pictures_path
      sign_up(@user.email, @user.password)
      add_picture('Something')
      click_link 'View picture'
      click_link 'Edit picture'
      fill_in 'Description', with: 'Something different'
      click_button 'Update Picture'
      expect(page).to have_content 'Something different'
      expect(current_path).to eq pictures_path
    end
  end

  context 'deleting pictures' do
    scenario 'I can delete a picture permanently' do
      visit pictures_path
      sign_up(@user.email, @user.password)
      add_picture('Something')
      click_link 'View picture'
      click_link 'Delete picture'
      expect(page).not_to have_content 'Something'
      expect(page).to have_content 'Picture successfully deleted'
    end
  end

  context 'User limits' do
    scenario 'I can only edit pictures that I have posted' do
      visit pictures_path
      sign_up(@user.email, @user.password)
      click_link 'Add a picture'
      page.attach_file('picture[image]', Rails.root + 'spec/fixtures/test.jpg')
      fill_in 'Description', with: 'What a cool picture'
      click_button 'Create Picture'
      click_link 'Sign out'
      click_link 'View picture'
      expect(page).to_not have_content('Edit picture')
    end
  end
end
