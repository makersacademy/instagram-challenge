require 'rails_helper'

feature 'comments' do

context 'when signed in' do
  it 'allow a user to leave a comment' do
    sign_up
    click_link 'Upload a picture'
    attach_file 'Image', 'spec/features/McAvoy.jpg'
    fill_in 'Description', with: 'Bae'
    click_button 'Upload your picture'
    expect(current_path).to eq '/pictures'
    click_link 'Comment on Bae'
    fill_in 'Comment', with: 'adorable'
    click_button 'Leave your comment'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'adorable'
  end

  it "users can delete their own comments for pictures" do
    sign_up
    click_link 'Upload a picture'
    attach_file 'Image', 'spec/features/McAvoy.jpg'
    fill_in 'Description', with: 'Bae'
    click_button 'Upload your picture'
    expect(current_path).to eq '/pictures'
    click_link 'Comment on Bae'
    fill_in 'Comment', with: 'My bae too'
    click_button 'Leave your comment'
    expect(current_path).to eq '/pictures'
    click_link 'Delete comment for Bae'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'You have succesfully deleted your comment'
  end

  it "users cannot delete other peoples comments for pictures" do
    sign_up
    click_link 'Upload a picture'
    attach_file 'Image', 'spec/features/McAvoy.jpg'
    fill_in 'Description', with: 'Bae'
    click_button 'Upload your picture'
    expect(current_path).to eq '/pictures'
    click_link 'Comment on Bae'
    fill_in 'Comment', with: 'My bae too'
    click_button 'Leave your comment'
    click_link 'Log out'
    sign_up_2
    click_link 'Delete comment for Bae'
    expect(current_path).to eq '/'
    expect(page).to have_content 'You do not have permission to delete this comment'
  end

  it 'does not let you submit a blank comment' do
    sign_up
    click_link 'Upload a picture'
    attach_file 'Image', 'spec/features/McAvoy.jpg'
    fill_in 'Description', with: 'Bae'
    click_button 'Upload your picture'
    expect(current_path).to eq '/pictures'
    click_link 'Comment on Bae'
    fill_in 'Comment', with: ''
    click_button 'Leave your comment'
    expect(page).to have_content 'Comments can\'t be blank'
  end
end

  context 'when not signed in' do
    before do
      visit '/pictures'
      sign_up
      click_link 'Upload a picture'
      attach_file 'Image', 'spec/features/McAvoy.jpg'
      fill_in 'Description', with: 'Bae'
      click_button 'Upload your picture'
      click_link 'Log out'
    end

    it 'does not allow users to leave a comment' do
      click_link 'Comment on Bae'
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content 'Remember me'
    end
  end

  def sign_up
    visit '/pictures'
    click_link 'Sign Up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  def sign_up_2
    visit '/pictures'
    click_link 'Sign Up'
    fill_in 'Email', with: 'test2@email.com'
    fill_in 'Password', with: 'password2'
    fill_in 'Password confirmation', with: 'password2'
    click_button 'Sign up'
  end
end
