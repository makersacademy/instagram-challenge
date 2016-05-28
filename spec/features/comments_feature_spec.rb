require 'rails_helper'

feature 'Commenting' do
  let!(:myself){ Picture.create(title: 'Me') }

  scenario 'allows users to leave a comment using a form' do
     visit '/pictures'
     click_link 'Me'
     click_link 'Comment'
     fill_in "Content", with: "Guapo!"
     fill_in "Author", with: "Foo"
     click_button 'Post'
     expect(page).to have_content('Foo')
     expect(page).to have_content('Guapo!')
     expect(current_path).to eq "/pictures/#{myself.id}"
  end

end