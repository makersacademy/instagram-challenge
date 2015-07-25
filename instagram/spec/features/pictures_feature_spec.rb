require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(description: 'raspberries')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content 'raspberries'
      expect(page).not_to have_content('No photos yet')
    end
  end
end

# context 'photo can be uploaded to the page' do
#   scenario 'display picture' do
#     visit '/'
#     click_link 'Add a picture'
#     attach_file 'image','spec/features/rasp.jpg'
#     click_link 'Upload picture'
#     expect(page).to have_css("img[src='rasp.jpg']")
#     expect(current_path).to eq '/pictures'
#   end
# end
