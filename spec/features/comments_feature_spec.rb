require 'rails_helper'

feature 'comments' do
  context 'leaving comments' do
    scenario 'picture owner can leave more comments on pictures' do
      sign_up('test@test.com', '12345678')
      upload_picture('a test picture')
      leave_a_comment('What a great test picture')
      within('.post') do
        expect(page).to have_content('What a great test picture')
      end
    end

    scenario 'another user can leave a comment on a picture' do
      sign_up('test@test.com', '12345678')
      upload_picture('a test picture')
      sign_out
      sign_up('second_user@test.com', '12345678')
      leave_a_comment('a second test comment')
      within('.post') do
        expect(page).to have_content('a second test comment')
      end
    end

    scenario 'three unique comments from different users' do
      sign_up('test@test.com', '12345678')
      upload_picture('a test picture')
      sign_out
      sign_up('second_user@test.com', '12345678')
      leave_a_comment('a second test comment')
      sign_out
      sign_up('third_user@test.com', '12345678')
      leave_a_comment('a third test comment')
      sign_out
      sign_up('fourth_user@test.com', '12345678')
      leave_a_comment('a fourth test comment')
      within('.post') do
        expect(page).to have_content('a second test comment')
        expect(page).to have_content('a third test comment')
        expect(page).to have_content('a fourth test comment')
      end
    end
  end
end