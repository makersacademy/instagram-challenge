require 'rails_helper'

  def upload_photo
    visit('/')
    click_link('New post')
    fill_in('Description', with: "Selfie #yeah")
    attach_file('Image', Rails.root + 'spec/images/monkeyselfie.jpeg')
    click_button 'Upload photo'
  end
