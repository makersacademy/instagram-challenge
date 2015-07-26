require 'rails_helper'

feature 'commenting' do

  before { Photo.create(description:'nice', image_file_name:'spec/fixtures/files/gramophone.png') }

  scenario 'allows users to comment using a form' do
    visit '/'
    click_link 'Comment on photo'
    fill_in 'Message', with: 'Nice'
    click_button 'Create Comment'
    expect(current_path).to eq '/photos'
    expect(page).to have_content('Nice')
  end
end