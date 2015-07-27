require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'log in' link and a 'sign up' link" do
      visit '/'
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign Up')
    end

    it "should not see 'log out' link" do
      visit '/'
      expect(page).not_to have_link('Log out')
    end
  end

  context "user logged in on the homepage" do
    before do
      visit '/'
      click_link('Sign Up')
      fill_in('Email', with: 'lucy@mail.com')
      fill_in('Password', with: 'starwars')
      fill_in('Password confirmation', with: 'starwars')
      click_button('Sign up')
    end

    it "should see 'log out' link" do
      visit '/'
      expect(page).to have_link('Log out')
    end

    it "should not see a 'log in' link and a 'sign up' link" do
      visit '/'
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign Up')
    end
  end
end

feature "When users are logged in" do

  it "they can only edit their own pictures" do
    sign_up
    click_link 'Upload a picture'
    attach_file 'Image', 'spec/features/McAvoy.jpg'
    fill_in 'Description', with: 'Bae'
    click_button 'Upload your picture'
    expect(current_path).to eq '/pictures'
    click_link 'Log out'
    sign_up_2
    expect(current_path).to eq '/'
    click_link 'Edit Bae'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'You do not have permission to edit this picture'
  end

  it "they can only delete their own pictures" do
    sign_up
    click_link 'Upload a picture'
    attach_file 'Image', 'spec/features/McAvoy.jpg'
    fill_in 'Description', with: 'Bae'
    click_button 'Upload your picture'
    expect(current_path).to eq '/pictures'
    click_link 'Log out'
    sign_up_2
    expect(current_path).to eq '/'
    click_link 'Delete Bae'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'You do not have permission to delete this picture'  
  end

  def sign_up
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  def sign_up_2
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'test2@email.com'
    fill_in 'Password', with: 'password2'
    fill_in 'Password confirmation', with: 'password2'
    click_button 'Sign up'
  end
end
