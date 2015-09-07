require 'rails_helper'

feature 'Comments' do
  scenario 'allows users to comment on posts' do
    create(:post)
    visit '/posts'
    click_link 'Add Comment'
    fill_in 'Thoughts', with: 'I agree'
    click_button 'Leave Comment'
    expect(current_path).to eq('/posts')
    expect(page).to have_content('I agree')
  end
end
