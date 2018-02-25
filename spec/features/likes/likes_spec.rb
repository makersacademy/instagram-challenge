require 'rails_helper'
require 'feature_helper'

feature 'Liking a post' do

  context 'when signed in' do
    scenario 'can like post' do
      sign_up
      create_post("spec/files/images/castle.jpg", 'A lovely castle #wales')
      sign_out
      sign_up('big_fan@example.com')
      click_on 'View post'
      click_on 'Like'
      expect(page).to have_content 'You liked this post'
      expect(page).to have_content '1 person likes this'
    end

    scenario 'can unlike post' do
      sign_up
      create_post("spec/files/images/castle.jpg", 'A lovely castle #wales')
      sign_out
      sign_up('big_fan@example.com')
      click_on 'View post'
      click_on 'Like'
      click_on 'Unlike'
      expect(page).to have_content "0 people like this"
    end

    scenario 'cannot like post twice' do
      sign_up
      create_post("spec/files/images/castle.jpg", 'A lovely castle #wales')
      sign_out
      sign_up('big_fan@example.com')
      click_on 'View post'
      click_on 'Like'
      expect(page).not_to have_selector(:link_or_button, 'Like')
    end
  end

  context 'when not signed in' do
    scenario 'cannot like' do
      sign_up
      create_post("spec/files/images/castle.jpg", 'A lovely castle #wales')
      sign_out
      expect(page).not_to have_selector(:link_or_button, 'Like')
    end
  end

end