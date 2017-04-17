require 'rails_helper'

feature 'Comment Features' do
  context "after being created" do
    before :each do
      sign_up_user
      upload_picture
      click_on 'Add Comment'
      fill_in 'Content', with: "comment content"
      click_on 'Create Comment'
    end

    it "is displayed on pictures page after being created" do
      expect(current_path).to eq pictures_path
      expect(page).to have_content "comment content"
      expect(page).to have_content "Comment successfully posted"
    end

    it "its creator's name is shown on the comment" do
      expect(page).to have_content "username"
    end

    it "its creator's email is not shown on the comment" do
      expect(page).not_to have_content "user@email.com"
    end
  end

  it 'must be signed in to visit the new comment creation url' do
    sign_up_user
    upload_picture
    sign_out
    picture_id = Picture.last.id
    visit "/pictures/#{picture_id}/comments/new"
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content "You need to sign in or sign up before continuing"
  end

  xit 'is displayed on index page after being created'

  xit 'can be deleted'

  xit 'can be edited'

private
  def upload_picture
    click_on 'Upload Picture'
    fill_in 'Title', with: "Smiley Face"
    attach_file "Image", 'spec/spec_assets/smiley.png'
    click_button 'Create Picture'
  end

  def sign_up_user
    visit root_path
    click_link 'Sign up'
    fill_in 'Username', with: "username"
    fill_in 'Email', with: "user@email.com"
    fill_in 'Password', with: "passwordpassword"
    fill_in 'Password confirmation', with: "passwordpassword"
    click_button 'Sign up'
  end

  def sign_out
    visit root_path
    click_link 'Sign out'
  end
end