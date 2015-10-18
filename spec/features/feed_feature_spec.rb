require 'rails_helper'

feature 'posts' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/posts'
      expect(page).to have_content 'No Pictures Yet!'
      expect(page).to have_link 'Add a Post'
    end

    context 'posts have been added' do
      before do
        Post.create(caption: '#chilling')
      end

      scenario 'display posts' do
        visit '/posts'
        expect(page).to have_content('#chilling')
        expect(page).not_to have_content('No Pictures Yet!')
      end
    end
  end
end
