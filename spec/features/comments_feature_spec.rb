require 'rails_helper'

feature 'commment' do

  context 'leaving a comment' do
    scenario 'no comments have been left yet' do
      add_image
      click_link 'Flower'
      expect(page).to have_content('No comments yet')
    end
  end

  context 'leaving a comment' do
    scenario 'a comment can be created' do
      add_image
      click_link 'Flower'
      leave_comment('Very nice picture')
      # expect(current_path).to eq('flower_path')
      expect(page).to have_content('Very nice picture')
      expect(page).not_to have_content('No comments yet')
    end
  end

  context 'a comment can be deleted' do
    scenario 'a user clicks the comment link to remove image post a comment' do
      add_image
      click_link ('Flower')
      leave_comment('Very nice picture')
      click_link 'Delete comment'
      expect(page).not_to have_content('Very nice picture')
    end
  end
end
