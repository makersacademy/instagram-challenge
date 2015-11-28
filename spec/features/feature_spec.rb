require 'rails_helper'

feature 'feed' do
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
    image_0_name = 'feature_spec_img.png'
    comment_0 = 'The fierce order heads the sign.'

    before do
      image_0 = File.new(Rails.root.join('spec','features',image_0_name), 'rb')
      filterspam_0 = Filterspam.create(comment: comment_0, image: image_0)
    end

    scenario 'display filterspams' do
      visit '/'
      expect(page).to have_content(comment_0)
      expect(page).to have_css("img[src*='#{image_0_name}']")
      expect(page).not_to have_content('No filterspams :(')
    end
  end

end
