require 'rails_helper.rb'

feature 'Liking posts' do
  background do
    user = create(:user)
    post_one = create(:post, user_id: user.id)

    visit '/'
    sign_in_with user
  end

  scenario 'can like a post' do
    expect(page).to have_css('a.glyphicon-heart-empty')
    expect(find('.likes')).to_not have_content('Andrew')
    click_link "like_1"
    expect(page).to have_css('a.glyphicon-heart')
    expect(find('.likes')).to have_content('Andrew')
  end

  scenario 'can unlike a post' do
    click_link "like_1"
    expect(page).to have_css('a.glyphicon-heart')
    expect(find('.likes')).to have_content('Andrew')
    click_link "like_1"
    expect(page).to have_css('a.glyphicon-heart-empty')
    expect(find('.likes')).to_not have_content('Andrew')
  end
end
