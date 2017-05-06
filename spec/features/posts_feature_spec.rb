require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display prompt add a post' do
      visit posts_path
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(image: Rails.root + "spec/fixtures/cat.png", description: 'Lovely')
    end

    scenario 'display posts' do
      visit posts_path
      expect(page).to have_content(Rails.root + "spec/fixtures/file.pdf")
      expect(page).to have_content('Lovely')
      expect(page).not_to have_content('No posts yet')
    end
  end
end
