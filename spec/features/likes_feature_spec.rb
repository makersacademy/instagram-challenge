require 'rails_helper'

feature 'liking' do
  before {Picture.create(image: 'Kitten', description: 'kittens!')}

  scenario 'allows users to like an image' do
     visit '/pictures'
     click_link 'Like Picture'
     click_button 'Like Picture'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('Likes: 1')
  end

end