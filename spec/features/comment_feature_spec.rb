require 'rails_helper'

feature 'Comment Features' do

  it "can be created" do
    sign_up_user
    upload_picture
    click_on 'Add Comment'
    fill_in 'Content', with: "comment content"
    click_on 'Create Comment'

    expect(current_path).to eq pictures_path
    expect(page).to have_content "comment content"
    expect(page).to have_content "Comment successfully posted"
  end

  xit 'cannot be created without a user'

  xit 'has a picture id'

  xit 'has a user id'

  xit 'is displayed on index page after being created'

  xit 'can be deleted'

  xit 'can be edited'

private
  def upload_picture
    click_on 'Upload Picture'
    fill_in 'Title', with: "Smiley Face"
    attach_file "Image", 'spec/smiley.png'
    click_button 'Create Picture'
  end

  def sign_up_user
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: "user@email.com"
    fill_in 'Password', with: "passwordpassword"
    fill_in 'Password confirmation', with: "passwordpassword"
    click_button 'Sign up'
  end
end