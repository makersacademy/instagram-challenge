require 'rails_helper'

feature 'commenting' do
  before do
    @user = create(:user)
    login_as @user
    add_photo 
    @user2 = create(:user, username: 'fake2', email: 'fake2@fakemail.com')
  end

  scenario 'allow users to leave comments using a form' do
     visit '/'
     login_as @user
     fill_in 'Leave a comment', with: 'GRUMPY CAT!!'
     click_button 'Submit'
     expect(current_path).to eq '/'
     expect(page).to have_content('GRUMPY CAT!!')
  end
  
  scenario 'does not allow non-users to leave comments' do
     click_link 'Sign out'
     visit '/'
     click_button 'Submit'
     expect(current_path).to eq '/users/sign_in'
     expect(page).to have_content('You need to sign in or sign up before continuing')
  end
  
  scenario 'viewing comments on photo page' do
    login_as @user
    add_comment
    click_link 'Grumpy cat'
    expect(page).to have_content('GRUMPY CAT!!')
  end
  
  scenario 'comments get deleted with the photo ' do
    login_as @user
    add_comment
    click_link 'Grumpy cat'
    click_link 'Delete photo'
    expect(page).not_to have_content 'GRUMPY CAT!!'
  end
  
  # xcontext 'deleting comments' do
  #   before do 
  #     login_as @user2
  #     add_comment
  #   end
  #   
  #   scenario 'removes comment when it is deleted only by the user added it' do
  #     visit '/'
  #     click_link 'Grumpy cat'
  #     click_link 'Delete comment'
  #     expect(page).to have_content 'comment successfully deleted'
  #   end
  #   
  #   scenario 'deos not delete a photo if it is not created by that user' do
  #     visit '/'
  #     click_link 'Grumpy cat'
  #     expect(page).not_to have_content 'Delete comment'
  #   end
  # end
end