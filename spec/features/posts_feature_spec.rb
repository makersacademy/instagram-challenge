require 'rails_helper'

feature 'instagram' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add picture' do
      visit '/posts'
      expect(page).to have_contenct 'No pictures yet'
      expect(page).to have_link 'Add picture'
    end
  end
end

context 'restaurants have been added' do
  before do
    Post.create(name: 'Hello')
  end

  scenario 'display restaurants' do
    visit '/posts'
    expect(page).to have_content('Hello')
    expect(page).not_to have_content('No posts yet')
  end
end
