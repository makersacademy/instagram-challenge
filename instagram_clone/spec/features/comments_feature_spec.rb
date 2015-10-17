require 'rails_helper'

feature 'Comments' do

  scenario 'user can leave a comment using a form' do
    visit '/'
    user = build :user
    sign_up(user)
    click_link 'Add a picture'
    fill_in 'Title', with: 'Holiday'
    attach_file "picture_image", "spec/fixtures/image3.png"
    click_button 'Create Picture'
    click_link 'Comment on Holiday'
    fill_in "Comment", with: 'SO sunny'
    click_button 'Leave Comment'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content('SO sunny')
  end

  # scenario 'can delete comment' do
  #   user = build :user
  #   sign_up(user)
  #   click_link 'Add a picture'
  #   fill_in 'Title', with: 'Holiday'
  #   attach_file "picture_image", "spec/fixtures/image3.png"
  #   click_button 'Create Picture'
  #   click_link 'Comment on Holiday'
  #   fill_in "Comment", with: 'SO sunny'
  #   click_button 'Leave Comment'
  #   expect(page).to have_link('Delete Comment')
  # end

end
