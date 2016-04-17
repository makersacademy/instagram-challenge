require 'rails_helper'

feature 'Comment' do
    before do
      signup_user1
      upload_image1
    end

  scenario 'Create comment' do
    click_link 'Comment'
    fill_in 'Comment', with: 'Wow what a great image'
    click_button 'Leave comment'
    expect(page).to have_content('Wow what a great image')
    expect(current_path).to eq('/')
  end
end