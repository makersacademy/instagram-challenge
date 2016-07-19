require 'rails_helper'

feature 'Comments' do

  context 'User is signed in' do

    let!(:user) { User.create(email: 'sity@pop.com', password: 'secret') }
    before { sign_in_as(user) }

    let!(:succulent){ Picture.create(description:'#sweetsucculents', image_file_name: "./spec/images/succulents.jpg") }

    it 'allows users to leave a comment using a form' do
       visit pictures_path
       click_link 'Comment'
       fill_in 'Thoughts', with: 'I want to put these in my bathroom!'
       click_button 'Post'
       expect(current_path).to eq pictures_path
       expect(page).to have_content 'I want to put these in my bathroom!'
    end
  end

  context 'User is not signed in' do

    let!(:succulent){ Picture.create(description:'#sweetsucculents', image_file_name: "./spec/images/succulents.jpg") }

    it 'unable to leave a comment' do
       visit pictures_path
       expect(page).not_to have_content 'Comment'
    end
  end
end
