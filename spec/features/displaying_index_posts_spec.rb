require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'index displays created posts' do
    create_posts_visit_route do |post_1, post_2|
      expect(page).to have_content(post_1.text)
      expect(page).to have_content(post_2.text)
      expect(page).to have_css("img[src*='test_img_1']")
    end
  end
end