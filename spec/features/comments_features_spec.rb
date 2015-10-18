require 'rails_helper'

feature 'comments' do

  let!(:cat){Photo.create(title:'cat', image_file_name: 'spec/assets/cats.jpg')}
  let(:user){ build :user }
  let(:user2){ build :user2 }

  scenario 'allows signed up users to leave a comment using a form' do
    visit '/photos'
    sign_up(user)
    add_comment
    expect(current_path).to eq '/photos'
    expect(page).to have_content 'So cute!'
  end

  scenario 'users can delete their own comments' do
    visit '/photos'
    sign_up(user)
    add_comment
    click_link 'Delete comment'
    expect(current_path).to eq '/photos'
    expect(page).not_to have_content 'So cute!'
  end

  scenario "users cannot delete other users' comments" do
    visit '/photos'
    sign_up(user)
    add_comment
    click_link 'Sign out'
    sign_up(user2)
    expect(page).not_to have_content 'So cute! Delete comment'
  end

  scenario "users can edit their comments" do
    visit '/photos'
    sign_up(user)
    add_comment
    click_link 'Edit comment'
    fill_in "Thoughts", with: 'Wish I had one!'
    click_button 'Add comment'
    expect(page).to have_content 'Wish I had one!'
  end

  scenario "users cannot edit other users' comments" do
    visit '/photos'
    sign_up(user)
    add_comment
    click_link 'Sign out'
    sign_up(user2)
    expect(page).not_to have_content 'Edit comment'
  end

end
