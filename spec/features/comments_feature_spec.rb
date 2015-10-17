require 'rails_helper'

feature 'Comment' do

  let!(:picture) { Picture.create(name: 'Love', description: 'Do you love me?') }

  context 'when there are no comments' do

    scenario 'can add a comment to a picture' do
      visit '/'
      click_link 'Love'
      click_link 'Leave a comment'
      fill_in 'Comment', with: 'Maybe I do'
      click_button "Leave comment"

      expect(page.current_path).to eq "/pictures/#{picture.id}"
      expect(page).to have_content 'Maybe I do'
    end

  end

end
