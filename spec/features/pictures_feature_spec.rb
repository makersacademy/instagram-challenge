require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet :('
      expect(page).to have_link 'Post a picture'
    end
  end

  # context 'pictures have been added' do
  #   before do
  #     Picture.new(image: '/Users/crispinandrews/Pictures/brighton_2472753b-1.jpg')
  #   end
  #   scenario 'display pictures' do
  #     vist '/pictures'
  #     expect(page).to have_css("img[src*='/Users/crispinandrews/Pictures/brighton_2472753b-1.jpg']")
  #   end
  # end
end
