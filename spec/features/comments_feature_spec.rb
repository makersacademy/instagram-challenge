require 'rails_helper'

feature 'commenting' do
  before do
    user = User.create email: 'test@test.com', password: '12345678', password_confirmation: '12345678'
    login_as user
    visit '/photos'
    click_link 'Add a photo'
    expect(current_path).to eq '/photos/new'
    attach_file 'Image', 'spec/testimages/cat.png'
    fill_in 'Caption', with: 'TestCap'
    click_button 'Create Photo'
  end

  scenario 'allows users to leave a comment using a form' do
     visit '/photos'
     click_link 'Add a comment'
     fill_in "Thoughts", with: "So Cute!"
     click_button 'Leave Comment'
     expect(page).to have_content("So Cute!")
  end

end
