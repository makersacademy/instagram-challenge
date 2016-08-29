require 'rails_helper'

feature 'commenting' do

  #before { pic = Image.create name: 'Holiday pic', description: 'Vacation photo' }

  scenario 'allows users to leave a comment on a photo' do
    pic = Image.create name: 'Holiday pic', description: 'Vacation photo'
    visit '/images'
    click_link "Comment On 'Holiday pic'"
    fill_in 'Thoughts', with: 'meh'
    click_button 'Add Comment'
    expect(current_path).to eq "/images/#{pic.id}"
    expect(page).to have_content 'meh'
  end

end
