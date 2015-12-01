require 'rails_helper'

feature 'commenting' do
  before {Post.create caption: 'big ass cakes'}

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     sign_in
     click_link 'Add comment to big ass cakes'
     fill_in "Comment", with: "Much too nice for cake"
     select '3', from: 'Hotornot'
     click_button 'Leave Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('Much too nice for cake')
  end


  def leave_comment(comment, hotornot)
    visit '/posts'
    click_link 'Add comment to big ass cakes'
    fill_in 'Comment', with: comment
    select hotornot, from: 'Hotornot'
    click_button 'Leave Comment'
  end

  scenario 'displays an average hotness for all comments' do
    sign_in
    leave_comment('So so', '3')
    leave_comment('Great', '5')
    expect(page).to have_content('Average hotness: 4')
  end



end