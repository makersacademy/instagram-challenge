require 'rails_helper'

feature 'deleting posts' do

  let(:user) { create(:user) }
  
  before do
    login_as(user, :scope => :user)
    new_post = create(:post, caption: "My breakfast", user_id: user.id)
  end

  scenario 'deleting a post' do
    visit '/posts/1'
    click_link 'delete post'
    expect(page.current_path).to eq '/'
    expect(page).not_to have_content 'My breakfast'
  end

end
