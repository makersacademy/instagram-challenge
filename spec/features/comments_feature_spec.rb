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

  context 'When a picture is deleted' do
    let!(:pic){ Picture.create(title: 'To be deleted')}

    scenario 'associated comments are destroyed too' do
      sign_up_jinis
      visit picture_path(pic)
      leave_comment
      click_link 'Delete'
      expect(Comment.count).to eq 0
    end
  end
end
