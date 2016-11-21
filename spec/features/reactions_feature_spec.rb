require 'rails_helper'

feature 'reactions' do
  before do
    sign_up
    upload_a_photo
  end
  context 'reacting to a post' do
    before do
      sign_out
      sign_in_as_diff_user
      click_link 'React to this post'
    end
    it 'allows users to react with "like" to a post' do
      click_button 'Like'
      expect(current_path).to eq '/photos'
      expect(page).to have_content "1 like"
      expect(page).not_to have_content "0 likes"
    end
    it 'allows users to react with "love" to a post' do
      click_button 'Love'
      expect(current_path).to eq '/photos'
      expect(page).to have_content "1 love"
      expect(page).not_to have_content "0 loves"
    end
    it 'allows users to react with "indifference" to a post' do
      click_button 'Indifference'
      expect(current_path).to eq '/photos'
      expect(page).to have_content "1 indifference"
      expect(page).not_to have_content "0 indifferences"
    end
  end

  context 'reacting to your own post' do
    it 'does not allow users to react to their own post' do
      expect(page).not_to have_link 'React to this post'
      expect(page).to have_content "You can't react to your own photo ..... narcissist"
    end
  end
end
