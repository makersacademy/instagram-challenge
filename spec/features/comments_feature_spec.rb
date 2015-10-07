require 'rails_helper'

feature 'commenting' do
  before do
    user = build(:user)
    sign_up(user)
    visit '/pictures'
    click_link 'Add a new picture'
    fill_in 'Caption', with: 'Awesome narwhal'
    attach_file 'picture[image]', 'spec/assets/images/image01.png'
    click_button 'Create Picture'
  end

  scenario 'allow users to leave a comment using a form' do
    visit '/pictures'
    click_link 'Write a comment...'
    fill_in 'Thoughts', with: 'I love this!'
    click_button 'Leave Comment'
    expect(current_path).to eq('/pictures')
    expect(page).to have_content('I love this!')
  end

  scenario 'usernames displayed with comments' do
    click_link 'Sign out'
    userina = build(:userina)
    sign_up(userina)
    click_link 'Write a comment...'
    fill_in 'Thoughts', with: 'I love this!'
    click_button 'Leave Comment'
    expect(page).to have_content('jemima')
  end
end