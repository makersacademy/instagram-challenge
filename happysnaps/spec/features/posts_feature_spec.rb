require 'rails_helper'

feature 'happysnaps posts' do
  context 'no posts have been added' do
    scenario 'should show a prompt to add a picture' do
      visit '/posts'
         expect(page).to have_content 'No posts yet'
        expect(page).to have_link 'Add a post'
    end
  end

  context 'added posts' do
    before do
      Post.create(caption: 'Yum!')
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Yum!')
      expect(page).not_to have_content('No posts yet')
    end
  end
end
