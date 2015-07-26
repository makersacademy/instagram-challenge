require 'rails_helper'

feature 'commenting' do
  before do 
    @user = User.create username: 'fake', email: 'fake@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as @user
    add_photo  
  end

  scenario 'allow users to leave comments using a form' do
     visit '/'
     login_as @user
     click_link 'Comment'
     fill_in 'Leave a comment', with: 'GRUMPY CAT!!'
     click_button 'Submit'
     expect(current_path).to eq '/'
     expect(page).to have_content('GRUMPY CAT!!')
  end
  
  scenario 'does not allow non-users to leave comments' do
     click_link 'Sign out'
     visit '/'
     click_link 'Comment'
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
end