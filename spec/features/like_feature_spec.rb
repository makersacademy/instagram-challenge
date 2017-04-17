require 'rails_helper'

feature 'Liking pictures' do
  before do
    sign_up
    upload_picture
  end

  it "each pictue will have a default 'like' count of zero" do
    expect(page).to have_content '0 likes'
  end

  it "users can like a picture, which then updates the 'like' count by one", js: true do
    click_link 'Like'
    expect(page).to have_content '1 like'
    expect(page).not_to have_content '0 likes'
  end

  def sign_up
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  def upload_picture
    click_link 'Upload a picture'
    attach_file 'Image', 'spec/features/McAvoy.jpg'
    fill_in 'Description', with: 'Bae'
    click_button 'Upload your picture'
  end
end
