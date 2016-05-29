require 'rails_helper'

feature 'Comments' do

  context 'User is signed in' do

    before do
      visit pictures_path
      click_link 'Sign up'
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button 'Sign up'
    end

    let!(:succulent){ Picture.create(description:'#sweetsucculents', image_file_name: "./spec/images/succulents.jpg") }

    it 'allows users to leave a comment using a form' do

       visit pictures_path
       click_link 'Add comment'
       fill_in 'Thoughts', with: 'I want to put these in my bathroom!'
       click_button 'Post'

       expect(current_path).to eq pictures_path
       expect(page).to have_content 'I want to put these in my bathroom!'
    end

  end


end
