require 'rails_helper'

feature 'posts' do
  context 'no posts have been posted' do
    scenario 'should display a prompt to post a picture' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Create a Post'
    end
  end

  context 'pictures have been added' do
  before do
    Post.create(title: 'Pug', description: 'cute')
  end

  scenario 'display restaurants' do
    visit '/posts'
    expect(page).to have_content('cute')
    expect(page).not_to have_content('No posts yet')
  end
end

end
