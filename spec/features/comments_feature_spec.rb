require 'rails_helper'

feature 'comments' do
  let!(:picture) { Picture.create(caption: 'a nice picture', image: File.new(Rails.root.join('spec','images','img.jpg'))) }

  context 'commenting on a picture' do
    scenario 'allows users to leave a comment' do
      sign_up
      visit '/pictures'
      find(:xpath, "//a/img[@alt='a nice picture']/..").click
      click_link 'Comment'
      fill_in 'Thoughts', with: 'it is a picture'
      click_button 'Leave comment'
      expect(page).to have_content 'it is a picture'
      expect(current_path).to eq "/pictures/#{picture.id}"
    end
  end
end