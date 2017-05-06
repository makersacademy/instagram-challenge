require 'rails_helper'

feature 'comments' do
  before do
    User.create(email: 'kate@kate.com', password: '123456', password_confirmation: '123456')
    Picture.create(caption: 'sally', user: User.first)
  end

  scenario 'users can comment on a picture' do
     visit '/pictures'
     fill_in 'any thoughts?', with: 'lovexxx'
     click_button 'comment'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('lovexxx')
  end

end
