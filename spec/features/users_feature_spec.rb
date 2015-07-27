require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end

  feature "When users are logged in" do

  it "they can only edit their own pictures" do
    sign_up
    upload_picture
    click_link 'Sign out'
    sign_up_2
    click_link 'Edit PFC'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'Only the creator can edit this picture'
  end

  it "they can only delete their own pictures" do
    sign_up
    upload_picture
    click_link 'Sign out'
    sign_up_2
    expect(current_path).to eq '/'
    click_link 'Delete PFC'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'Only the creator can delete this picture'
  end
end

  def sign_up
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end

  def sign_up_2
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'testy@example.com')
    fill_in('Password', with: 'testytest')
    fill_in('Password confirmation', with: 'testytest')
    click_button('Sign up')
  end

  def upload_picture
    visit '/pictures'
    click_link 'Click here to add a picture!'
    fill_in 'Title', with: 'PFC'
    attach_file "Image", 'spec/features/Pompey.jpg'
    click_button 'Upload picture'
  end

end
