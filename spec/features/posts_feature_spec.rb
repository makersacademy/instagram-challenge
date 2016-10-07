require 'rails_helper'

feature 'posts' do
    context 'no posts have been added' do
      scenario 'no posts displayed' do
        visit '/posts'
        expect(page).to have_content 'No posts yet'
        expect(page).to have_link 'Upload a photo'
      end
    end
end
