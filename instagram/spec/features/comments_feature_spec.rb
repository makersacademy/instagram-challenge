require 'rails_helper'

feature 'comments' do
  before {Photo.create description: 'Fujisan'}

  context "user must be logged in" do

    before :each do
      sign_in_user_1
    end

    scenario 'allows users to leave a comment using a form' do
       visit '/photos'
       click_link 'Comment on'
       fill_in "Comment", with: "Epic mountain"
       click_button 'Leave Comment'

       expect(current_path).to eq '/photos'
       expect(page).to have_content('Epic mountain')
    end

    context 'an invalid comment' do
      it 'does not let user submit a blank comment' do
        visit '/photos'
        click_link 'Comment on'
        fill_in "Comment", with: ""
        click_button 'Leave Comment'
        expect(page).to have_content 'Comment cannot be blank'
      end
    end
  end

private 

  def sign_in_user_1
    visit ("/")
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def sign_out
    visit ("/")
    click_link('Sign out')
  end

end