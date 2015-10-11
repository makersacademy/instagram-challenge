def upload_photo
  visit '/photos'
  click_link 'Upload a new photo'
  fill_in 'Title', with: 'Tomato'
  allow_any_instance_of(Paperclip::Attachment).to receive(:url).and_return("/tomato.jpg")
  click_button 'Upload'
end