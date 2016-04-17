require 'rails_helper'

feature 'commenting' do
  scenario 'allows users to comment on photo' do
    visit '/pictures'
    click_link 'Add picture'
    attach_file 'picture[image]', 'app/assets/images/DOGE.jpeg'
    fill_in 'Description', with: 'much doge'
    click_button 'Add'
    picture = Picture.first
    click_link 'photo'
    click_link 'Comment'
    fill_in 'Comment', with: 'wow'
    click_button 'Comment'

    expect(current_path).to eq picture_path(picture)
    expect(page).to have_content 'wow'
  end

  scenario 'comments get deleted when picture gets deleted' do
    visit '/pictures'
    click_link 'Add picture'
    attach_file 'picture[image]', 'app/assets/images/DOGE.jpeg'
    fill_in 'Description', with: 'much doge'
    click_button 'Add'
    picture = Picture.first
    click_link 'photo'
    click_link 'Comment'
    fill_in 'Comment', with: 'wow'
    click_button 'Comment'
    click_link 'Delete'
    expect(page).not_to have_content('wow')
  end
end
