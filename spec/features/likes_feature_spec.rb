require 'rails_helper'


feature 'Liking images' do
  before do
    user = create(:user)
    post = create(:post, user: user)
  end

  scenario 'started with 0 likes' do
    visit '/posts'
    expect(page).to have_content('0 likes')
  end

  # scenario 'a user can like images of post' do
  #   visit '/posts'
  #   click_link 'Like'
  #   expect(page).to have_content('1 like')
  # end
  #
  # scenario 'the likes are pluralize properly' do
  #   visit '/posts'
  #   click_link 'Like'
  #   click_link 'Like'
  #   expect(page).to have_content('2 likes')
  # end
end
