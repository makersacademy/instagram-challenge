require 'rails_helper'

feature 'comments' do

  let(:user){ build :user }

  before do
    sign_up(user)
    add_picture('tower bridge')
  end

  scenario 'allows users to leave a comment using a form' do
     visit '/'
     click_link 'Comment'
     fill_in "Comment", with: "great"
     click_button 'Leave Comment'
     expect(current_path).to eq '/pictures'
     expect(page).to have_content('great')
  end

  scenario 'comments deleted when picture deleted' do

    visit '/'
    click_link 'Comment'
    fill_in "Comment", with: "great"
    click_button 'Leave Comment'
    click_link 'Delete'
    expect(current_path).to eq '/pictures'
    expect(page).to_not have_content('great')
  end

  scenario "can't leave a comment when not signed in" do

    visit '/'
    click_link 'Sign out'
    click_link 'Comment'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content('You need to sign in')
  end
end
