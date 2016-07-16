require 'rails_helper'

feature 'Displaying posts' do
  context 'posts on index page' do
    scenario 'the index displays correct created job information' do
      job_one = create(:post, caption: 'This is post one')
      job_two = create(:post, caption: 'This is post two')

      visit '/'
      expect(page).to have_content 'This is post one'
      expect(page).to have_content 'This is post two'
      expect(page).to have_css "img[src*='coffee.jpg']"
    end
  end

  context 'viewing individual posts' do
    scenario 'can click and view a single post' do
      post = create(:post)
      visit '/'
      find(:xpath, "(//a[contains(@href,'posts/5')])[1]").click
      expect(page.current_path).to eq(post_path(post))
    end
  end
end
