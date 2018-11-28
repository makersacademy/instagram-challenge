require 'rails_helper'

feature 'Viewing Profiles' do
  background do
    user = create :user
    user_two = create(:user, id: 2,
                             email: 'test@profile.com',
                             user_name: 'testingprofiles')
    post = create(:post, user_id: user.id)
    post_two = create(:post, user_id: 2,
                             caption: 'alsotestingprofiles')
    sign_in_with user

    visit '/'
    click_link 'LOAD MORE'
    click_link 'testusername'
  end
  scenario 'visiting a profile shows username in url' do
    expect(page.current_path).to eq(profile_path('testusername'))
  end
  scenario "a profile page only shows the specified user's posts" do
    expect(page).to have_content 'nofilter'
    expect(page).to_not have_content 'alsotestingprofiles'
  end
end
