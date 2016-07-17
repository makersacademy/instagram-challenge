require 'rails_helper'

feature 'Displaying posts' do
  context 'posts on index page' do
    scenario 'the index displays correct created job information' do
      sign_in
      add_post('This is post one')
      add_post('This is post two')
      expect(page).to have_content 'This is post one'
      expect(page).to have_content 'This is post two'
      expect(page).to have_css "img[src*='coffee.jpg']"
    end
  end

  context 'viewing individual posts' do
    scenario 'can click and view a single post' do
      sign_in
      find(:xpath, "(//a[contains(@href,'posts/3')])[1]").click
      expect(page.current_path).to eq('/posts/3')
    end
  end
end
