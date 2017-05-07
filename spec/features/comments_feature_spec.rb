require 'rails_helper'

feature 'comments' do
  before do
    create_picture_with_user
    sign_up('sylvia@sylvia.com')
  end

  scenario 'users can comment on a picture' do
     add_comment
     expect(current_path).to eq '/pictures'
     expect(page).to have_content('lovexxx')
  end

  scenario 'comments have authors email' do
     add_comment
     expect(page).to have_content('sylvia@sylvia.com')
  end

end
