require 'rails_helper'

feature 'Comments' do
  before { Post.create(caption: "What a handsome fellow") }

  scenario 'Users can comment on posts and see their comment added' do
    visit '/posts'
    # YOU WILL NEED TO COME AND FIX THIS FOR MULTIPLE, AMBIGUOUS POSTS:
    click_link 'Add a comment'
    fill_in 'thoughts', with: "He's a little thin"
    click_button 'Create Comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content "He's a little thin"
  end
end
