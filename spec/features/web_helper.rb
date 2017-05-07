def sign_up(email)
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: 'catcat'
  fill_in 'Password confirmation', with: 'catcat'
  click_button 'Sign up'
end

def leave_review(thoughts)
    visit '/travelgrams'
    click_link 'Bali'
    click_link 'Comment'
    fill_in 'Thoughts', with: thoughts
    click_button 'Done'
    expect(current_path).to eq '/travelgrams/1'
    expect(page).to have_content 'looks amazing!'
end