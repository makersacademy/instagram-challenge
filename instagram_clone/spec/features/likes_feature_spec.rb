require 'rails_helper'

feature 'liking' do
  before do
    sign_up_and_sign_in
    Picture.create title: 'Sunrise'
  end

  scenario 'allows users to like a picture' do
     visit '/'
     first(:img).click
     expect(current_path).to eq '/'
     expect(page).to have_content('+1')
  end

end
