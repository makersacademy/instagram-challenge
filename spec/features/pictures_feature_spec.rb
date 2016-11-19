require 'rails_helper'

feature 'pictures' do
  context 'on the first visit ' do
    scenario 'there should be basic content....' do
    visit('/pictures')
    expect(page).to have_content('No pictures on here yet')
    expect(page).to have_link('Add a photo!')
    expect(page).to have_link('Sign in')
    expect(page).to have_link('Sign up')
    end
  end


  context 'posting basics to the home page' do
    before do
      Post.create(post_text: 'Seasons greetings')
    end
    scenario 'we should be able to see the posts on the indexpage' do
      visit('/pictures')
      expect(page).to have_content('Seasons greetings')
      expect(page).not_to have_content('No pictures on here yet')
    end
  end
end
