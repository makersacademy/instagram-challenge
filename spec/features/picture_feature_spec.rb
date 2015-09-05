require 'rails_helper'

feature "Picture Features" do
  it "can upload a picture" do
    visit new_picture_path
    attach_file "Image", 'spec/smiley.png'
    click_button 'Create Picture'
    expect(page.status_code).to be 200
  end

private
  def sign_up_user
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: "user@email.com"
    fill_in 'Password', with: "passwordpassword"
    fill_in 'Password confirmation', with: "passwordpassword"
    click_button 'Sign up'
  end

  def sign_out
    visit '/'
    click_link 'Sign out'
  end
end