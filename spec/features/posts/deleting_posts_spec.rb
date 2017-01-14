require 'rails_helper'

feature 'deleting posts' do

  before do
    new_post = create(:post, caption: "My breakfast")
  end

  scenario 'deleting a post' do
    visit '/posts/1'
    click_link 'delete post'
    expect(page.current_path).to eq '/'
    expect(page).not_to have_content 'My breakfast'
  end

end
