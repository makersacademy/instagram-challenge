require 'rails_helper'

feature 'Comments' do
  let!(:succulent){ Picture.create(description:'#sweetsucculents', image_file_name: "./spec/images/succulents.jpg") }

  scenario 'allows users to leave a comment using a form' do
     visit pictures_path
     click_link 'Add comment'
     fill_in 'Thoughts', with: 'I want to put these in my bathroom!'
     click_button 'Post'

     expect(current_path).to eq pictures_path
     expect(page).to have_content 'I want to put these in my bathroom!'
  end

end
