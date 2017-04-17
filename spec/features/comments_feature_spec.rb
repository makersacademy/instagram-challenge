require 'rails_helper'

feature 'adding comments' do
  before { Picture.create name: 'Mountain' }

  scenario 'a user can leave  comment on a picture' do
    visit '/pictures'
    click_link 'Mountain'
    fill_in 'Comment on Mountain', with: 'Thats a nice mountain'
    click_button 'Leave comment'

    expect(current_path).to eq '/pictures'
    expect(page).to have_content('Thats a nice mountain')
  end
end
