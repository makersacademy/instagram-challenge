require 'rails_helper'

feature 'feed' do
  image_0_name = 'feature_spec_img.png'

  scenario 'display the welcome message' do
    visit '/'
    expect(page).to have_content('Welcome to Filterspam!')
  end

  context 'no filterspams have been posted' do
    scenario 'display prompt to add filterspam' do
      visit '/'
      expect(page).to have_content('No filterspams :(')
      expect(page).to have_link('Add filterspam')
    end
  end

  context 'filterspam has been posted' do

    comment_0 = 'The fierce order heads the sign.'

    before do
      image_0 = File.new(Rails.root.join('spec/features',image_0_name), 'rb')
      filterspam_0 = Filterspam.create(comment: comment_0, image: image_0)
    end

    scenario 'display filterspams' do
      visit '/'
      expect(page).to have_content(comment_0)
      expect(page).to have_css("img[src*='#{image_0_name}']")
      expect(page).not_to have_content('No filterspams :(')
    end
  end

  context 'creating filterspams' do
    comment_0 = 'The defective force maintains the drink.'

    scenario 'prompt user to fill out form, then display new filterspam' do
      visit '/'
      click_link 'Add filterspam'
      fill_in 'Comment', with: comment_0
      attach_file 'Image', Rails.root.join("spec/features/#{image_0_name}")
      click_button 'Create Filterspam'
      expect(page).to have_content(comment_0)
      expect(page).to have_css("img[src*='#{image_0_name}']")
    end
  end

end
