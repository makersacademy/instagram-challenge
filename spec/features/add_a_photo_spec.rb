require 'rails_helper'

RSpec.feature 'Photos', type: :feature do
  scenario 'user adds a photo' do
    allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(true)
    visit '/photos'
    click_on 'Post Photo'
    fill_in 'photo_title', with: '55 Bar'
    page.attach_file('photo_image', Rails.root + 'app/assets/images/55-bar.jpg')
    click_on 'Upload'
    #expect(page).to have_xpath("//img[@src='//s3.amazonaws.com/instagram-clone-photos/photos/images/*']")
    expect(page).to have_content '55 Bar'
    expect(page).to have_css('img')
  end
end
