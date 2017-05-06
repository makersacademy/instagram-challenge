require 'rails_helper'

feature 'commenting' do
  before {Post.create image: 'http://library.sandiegozoo.org/factsheets/tapir/images/malayan.jpg'}

  scenario 'user can comment on a post' do
    visit '/posts'
    fill_in 'Content', with: 'I sure like that tapir'
    click_button 'Add a comment...'
    expect(page).to have_content 'I sure like that tapir'
    expect(current_path).to eq '/posts'
  end
end
