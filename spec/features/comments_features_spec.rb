require 'rails_helper'

feature 'comments' do

  let!(:cat){Photo.create(title:'cat', image_file_name: 'spec/assets/cats.jpg')}
  let(:user){ build :user }
  let(:user2){ build :user2 }

  scenario 'allows users to leave a comment using a form' do
    visit '/photos'
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
    expect(current_path).not_to have_content 'So cute! Delete comment'
  end

end
