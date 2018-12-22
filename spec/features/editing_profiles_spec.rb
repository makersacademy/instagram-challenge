require 'rails_helper'

feature 'editing user profiles' do
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
  end

  scenario 'a user can change their own profile details' do
    click_link 'LOAD MORE'
    click_link 'testusername'
    click_link 'Edit Profile'
    attach_file('user_avatar', 'spec/files/images/avatar.jpg')
    fill_in 'user_bio', with: 'Its a me, mario'
    click_button 'Update Profile'

    expect(page.current_path).to eq(profile_path('testusername'))
    expect(page).to have_css("img[src*='avatar']")
    expect(page).to have_content('Its a me, mario')
  end

  scenario 'a user cannot see an Edit Profile button on another users profile' do
    click_link 'testingprofiles'

    expect(page).to_not have_content('Edit Profile')
  end

  scenario 'a user cannot navigate directly to edit a users profile' do
    visit '/testing/edit'

    expect(page).to_not have_content('Change your profile image:')
    expect(page.current_path).to eq(root_path)
    expect(page).to have_content("That profile doesn't belong to you!")
  end
end
