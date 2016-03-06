require 'rails_helper'

feature 'Liking stuff' do
    scenario '-> only users can like posts' do
      signup
      post_pic
      click_link('Like')
      expect(page).to have_content('1 like')
    end

    scenario '-> users can only like things once' do
      signup
      post_pic
      click_link('Like')
      click_link('Like')
      expect(page).to have_content('1 like')
    end 
end
