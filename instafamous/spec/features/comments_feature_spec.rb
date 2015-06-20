require 'rails_helper'

feature 'Comments' do
  before do
    Picture.create(caption: 'Photo 1')
  end
  scenario 'can be added to pictures' do
    visit('/')
    click_button('comment')
    click_link('Add Comment')
    fill_in 'Comment', with: 'Hey there'
    click_button('Create Comment')
    expect(current_path).to eq ('/')
    expect(page).to have_content('Hey there')
  end
end