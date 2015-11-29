require 'rails_helper'

feature 'Posts' do
  before do
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  context 'create post' do
    scenario 'prompt user to fill out a form, then display the post' do
        visit '/posts'
        click_link 'Add Post'
        fill_in 'Description', with: 'Picture of Dubai'
        click_button 'Create Post'
        expect(page).to have_content 'Picture of Dubai'
        expect(current_path).to eq '/posts/1'
    end
  end

end
