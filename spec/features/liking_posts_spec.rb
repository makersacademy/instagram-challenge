require 'rails_helper.rb'

feature 'Liking posts' do
  background do
    user = create(:user)
    post_one = create(:post, user_id: user.id)

    visit '/'
    sign_in_with user
  end

  scenario 'can like a post' do
    click_button 'Like'

    expect(page).to have_css('div.liked-post')
    expect(find('.post-likers')).to have_content('Andrew')
  end

  scenario 'can unlike a post' do
    click_button 'Like'
    expect(page).to have_css('div.liked-post')
    click_button 'Like'

    expect(page).to have_css('div.unlikes-post')
    expect(find('.post-likers')).to_not have_content('Andrew')
  end
end
