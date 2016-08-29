require 'rails_helper'

feature 'Comments' do
  before do
    sign_up
    create_post
  end

  scenario 'Users can comment on posts and see their comment added' do
    visit '/posts'
    click_button 'Add a comment'
    fill_in 'Thoughts:', with: "He's a little thin"
    click_button 'Add comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content "He's a little thin"
  end
end
