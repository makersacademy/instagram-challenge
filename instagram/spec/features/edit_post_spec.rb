require 'rails_helper'

feature 'Editing posts' do
  xscenario 'can edit a post' do
    visit '/'
    sign_in
    post
    visit "/posts/#{post.id}/edit"
    expect(page).to have_link 'Choose File'
    expect(page).to have_content 'Caption'

  end
end
