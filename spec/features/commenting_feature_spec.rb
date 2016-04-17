require 'rails_helper'

feature 'Comments' do

  scenario 'allows user to leave a comment on picture' do
    post_picture_with_image
    visit_picture
    leave_comment
    expect(page).to have_xpath("//img[contains(@src, 'bird.png')]")
    expect(page).to have_content 'Beautiful picture!'
  end

  context 'When a picture is deleted' do
    let!(:pic){ Picture.create(title: 'To be deleted')}

    scenario 'associated comments are destroyed too' do
      visit picture_path(pic)
      leave_comment
      click_link 'Delete'
      expect(Comment.count).to eq 0
    end
  end
end
