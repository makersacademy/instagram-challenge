require 'rails_helper'
require_relative 'web_helpers'

context 'editing images' do

  let!(:sunday){ Image.create(description: 'Sunday', url: 'http://foobar/image.jpg') }

  scenario 'let a user edit an image' do
    user_sign_up
    visit "/images/#{sunday.id}"
    click_link 'Edit'
    fill_in 'Description', with: 'Sunday morning'
    fill_in 'Url', with: 'http://foobar/image.jpg'
    click_button 'Update Image'
    expect(page).to have_content 'Sunday morning'
    expect(page).to have_css("img[src*='http://foobar/image.jpg']")
    expect(current_path).to eq "/images/#{sunday.id}"
  end
end

context 'deleting images' do

  let!(:sunday){ Image.create(description: 'Sunday', url: 'http://foobar/image.jpg') }

  scenario 'removes an image when a user clicks delete link' do
    user_sign_up
    visit "/images/#{sunday.id}"
    click_link 'Delete'
    expect(page).not_to have_content 'Sunday'
    expect(page).to have_content 'Image deleted successfully'
  end
end
