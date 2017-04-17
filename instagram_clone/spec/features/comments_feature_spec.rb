require 'rails_helper'

feature 'Comments' do
  before do
    sign_up
    do_post
  end

  context 'create comments' do
    scenario 'prompt user to fill in a form, then display the comment on the post' do
      visit '/posts'
      click_link 'Add Comment'
      fill_in 'Thought', with: 'I agree coding is wonderful'
      click_button 'Create Comment'
      expect(page).to have_content 'I agree coding is wonderful'
      expect(current_path).to eq '/posts'
    end
  end

end
