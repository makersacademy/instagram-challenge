require 'rails_helper'

feature 'Comment' do

  let!(:picture) { Picture.create(name: 'Love', description: 'Do you love me?') }

  context 'when there are no comments' do

    scenario 'can add a comment to a picture' do
      visit '/'
      click_link 'Love'
      click_link 'Leave a comment'
      fill_in 'Comment', with: 'Maybe I do'
      click_button 'Leave comment'

      expect(page.current_path).to eq "/pictures/#{picture.id}"
      expect(page).to have_content 'Maybe I do'
    end

  end

  context 'when there is a comment' do

    scenario 'can edit the comment' do
      visit '/'
      click_link 'Love'
      click_link 'Leave a comment'
      fill_in 'Comment', with: 'Maybe I do'
      click_button 'Leave comment'

      click_link 'Edit comment'
      fill_in 'Comment', with: "Let's say yes"
      click_button 'Edit comment'

      expect(page).not_to have_content 'Maybe I do'
      expect(page).to have_content "Let's say yes"
      expect(page).to have_content "You have successfully updated the comment."
    end

    scenario 'can delete a comment' do
      visit '/'
      click_link 'Love'
      click_link 'Leave a comment'
      fill_in 'Comment', with: 'Maybe I do'
      click_button 'Leave comment'

      click_link 'Delete comment'
      expect(page).not_to have_content 'Maybe I do'
    end

  end

end
