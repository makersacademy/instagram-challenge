require 'rails_helper'

feature 'editing posts' do

  let(:user) { create(:user) }
  
  before do
    login_as(user, :scope => :user)
    new_post = create(:post, caption: "My breakfast", user_id: user.id)
  end

  scenario 'posts can be edited' do
    visit '/posts/1'
    click_link 'edit post'
    fill_in 'Caption', with: 'Burritos are life'
    click_button 'save changes'
    expect(page).to have_content 'Burritos are life'
  end

end
