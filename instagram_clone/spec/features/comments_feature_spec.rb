require 'rails_helper'

feature 'Comments' do
  before { Picture.create title: 'Holiday' }

  scenario 'user can leave a comment using a form' do
    visit '/pictures'
    click_link 'Comment on Holiday'
    fill_in "Comment", with: 'SO sunny'
    click_button 'Leave Comment'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content('SO sunny')
  end

end
