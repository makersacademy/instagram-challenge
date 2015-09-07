require 'rails_helper'


feature 'Liking images' do
  before do
    user = create(:user)
    post = create(:post, user: user)
  end

  scenario 'a user can like images of post' do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
end
