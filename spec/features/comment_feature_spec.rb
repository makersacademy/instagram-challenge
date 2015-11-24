require 'rails_helper'

feature 'commenting' do
  
  before do
    user = build(:user)
    sign_up(user)
    add_image
  end

  scenario 'allows users to leave comments using a form' do
      add_comment
      expect(current_path).to eq '/images'
      expect(page).to have_content('nice pic')
  end
end
