require 'rails_helper'

feature 'like-ing photos' do

  before(:each) do
    user = create(:user)
    sign_in(user)
    click_link 'Upload Photo'
    attach_file('photo[picture]', 'spec/images/dimensions.png')
    click_button 'Create Photo'
  end

  scenario 'photos start with 0 likes as default' do
    expect(page).to have_content '0 likes'
  end

  scenario 'a user can like a photo, which updates the likes count', js: true do
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

  scenario 'a user can only like one photo once', js: true do
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end


  scenario 'likes from different users are summed the previous ones', js: true do
    user_2 = build(:user)
    click_link 'Like'
    expect(page).to have_content('1 like')
    click_link 'Sign out'
    sign_up(user_2)
    expect(page).to have_content '1 like'
    click_link 'Like'
    expect(page).to have_content '2 like'
  end

end
