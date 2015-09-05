require 'rails_helper'

feature 'commenting' do
  before do
    create(:picture)
  end

  scenario 'allow users to leave a comment using a form' do
    visit '/pictures'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'I love this!'
    click_button 'Leave Comment'
    expect(current_path).to eq('/pictures')
    expect(page).to have_content('I love this!')
  end
end