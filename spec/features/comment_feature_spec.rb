require 'rails_helper'

feature 'Commenting on a photo' do
  scenario 'adds a coment to photo' do
    sign_up
    visit '/photos'
    click_link 'Add a photo'
    fill_in 'Description', with: "Nando's 4 lyf"
    attach_file "photo[image]", 'spec/fixtures/files/images/MeAndMe.png'
    click_button 'Submit Photo'
    click_link 'Comment'
    fill_in "Comment", with: "very nice photo"
    click_button 'Post'
    expect(page).to have_content("TheMagicalInternationalWoodlouse said:")
    expect(page).to have_content("very nice photo")
  end
end