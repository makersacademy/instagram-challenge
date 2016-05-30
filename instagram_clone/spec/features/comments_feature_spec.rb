require 'rails_helper'

feature 'comments' do
    let!(:vacation){Post.create(title:'Vacation')}

  scenario 'allows users to comment on a photo using a form' do
    visit '/posts'
    click_link 'Vacation'
    click_link 'Comment on Vacation'
    fill_in 'Comment', with: 'beautiful'
    click_button 'Leave Comment'
    expect(current_path).to eq "/posts/#{vacation.id}"
    expect(page).to have_content'beautiful'
  end
end


