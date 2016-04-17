require 'rails_helper'

feature 'Comments' do

  scenario 'allows user to leave a comment on picture' do
    sign_up_jinis
    post_picture_with_image
    visit_picture
    leave_comment
    expect(page).to have_xpath("//img[contains(@src, 'bird.png')]")
    expect(page).to have_content 'Beautiful picture!'
  end

  scenario 'user must be signed in to leave a comment' do
    sign_up_jinis
    post_picture_with_image
    click_link 'Sign out'
    visit_picture
    expect(page).not_to have_link 'Comment'
  end

  context 'When user comments on a picture' do
    before (:each) do
      sign_up_jinis
      post_picture_with_image
      visit_picture
      leave_comment
    end

    scenario 'user can edit comments' do
      click_link 'Edit comment'
      fill_in 'comment_thoughts', with: 'More sensible comment'
      click_button 'Update comment'
      expect(page).to have_content 'More sensible comment'
    end

    scenario 'user cannot edit other users comments' do
      click_link 'Sign out'
      sign_up_jinis2
      visit_picture
      expect(page).not_to have_link 'Edit comment'
    end

    # scenario 'user cannot delete other users comments' do
    #   click_link 'Sign out'
    #   sign_up_jinis2
    #   visit_picture
    #   expect(page).not_to have_link 'Delete comment'
    # end
  end

  context 'When a picture is deleted' do

    scenario 'associated comments are destroyed too' do
      sign_up_jinis
      post_picture_with_image
      visit_picture
      leave_comment
      click_link 'Delete'
      expect(Comment.count).to eq 0
    end
  end
end
