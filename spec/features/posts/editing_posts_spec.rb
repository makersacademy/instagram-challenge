require 'rails_helper'

feature 'editing posts' do

  before do
    new_post = create(:post, caption: "My breakfast")
  end

  scenario 'posts can be edited' do
    visit '/posts/1'
    click_link 'edit post'
    fill_in 'Caption', with: 'Burritos are life'
    click_button 'save changes'
    expect(page).to have_content 'Burritos are life'
  end
end
