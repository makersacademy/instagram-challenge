require 'rails_helper'
RSpec.describe "Displaying posts", :type => :feature do

  before do
    user = User.create email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as user
  end

  before do
    @post = create(:post, id: 3)
  end

  feature 'index displays list of posts' do
    scenario 'the index displays posts added' do
      visit '/'
      expect(page).to have_css("img[src*='cat.jpg']")
      expect(page).to have_content('My Fave Cat')
    end

    scenario 'displays multiple posts' do
      add_post('Post two', Rails.root.join('spec/images/cat.jpg'))
      add_post('Post three', Rails.root.join('spec/images/cat.jpg'))

      visit '/'
      expect(page).to have_css("img[src*='cat.jpg']")
      expect(page).to have_content('My Fave Cat')
      expect(page).to have_content('Post two')
      expect(page).to have_content('Post three')
    end
  end

  feature 'can view individual posts' do
    scenario 'click on post' do
      visit '/'
      find(:xpath, "//a[contains(@href,'posts/3')]").click
      expect(page.current_path).to eq(post_path(@post))
    end
  end
  feature 'post diplays email of user who added post' do
    scenario 'post added' do
      visit('/')
      expect(page).to have_content 'test@123gmail.com'
    end
  end
end
