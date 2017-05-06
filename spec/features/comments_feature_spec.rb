require 'rails_helper'

feature 'commenting' do
  before { Picture.create(title:'Just a fan enjoying the game', url: 'http://68.media.tumblr.com/9150621cddccbc705a6805d15b835767/tumblr_mrhvg5sMPz1r1thfzo1_1280.jpg') }

  scenario 'allows users to comment on pictures using a form' do
    visit '/pictures'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'What a match this was!'
    click_button 'Add Comment'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'What a match this was!'
  end
end
