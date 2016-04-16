require 'rails_helper'

feature 'Comments' do

  scenario 'allows user to leave a comment on picture' do
    post_picture_with_image
    visit_picture
    click_link 'Comment'
    fill_in 'Thoughts', with: 'Beautiful picture!'
    click_button 'Comment'
    expect(page).to have_xpath("//img[contains(@src, 'bird.png')]")
    expect(page).to have_content 'Beautiful picture!'
  end
end
