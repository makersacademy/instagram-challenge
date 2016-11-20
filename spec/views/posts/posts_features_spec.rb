require 'rails_helper'

describe "posting, editing, deleting posts" do
  def create_user
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: "test@testuser.com"
    fill_in 'Password', with: "123456"
    fill_in 'Password confirmation', with: "123456"
    click_button 'Sign up'
  end
  before :each do
    create_user
    visit '/posts'
    expect(page).to have_content 'Listing Posts'
    visit '/posts/new'
    attach_file "Image", "spec/asset_specs/photos/test.jpg"
    fill_in 'post_caption', with: "my summer vacation"
    click_button 'Create Post'
    visit '/posts'
  end

  feature 'posts' do
    context 'can create posts' do
      scenario 'user can create posts' do
        expect(page).to have_content 'my summer vacation'
      end
      scenario 'user can edit posts' do
        click_link "Edit"
        attach_file "Image", "spec/asset_specs/photos/test.jpg"
        fill_in 'post_caption', with: "Actually it was my dads"
        click_button 'Update Post'
        visit '/posts'
        expect(page).to have_content 'Actually it was my dads'
      end
      scenario 'user can delete posts' do
        click_link "Destroy"
        expect(page).not_to have_content 'Actually it was my dads'
      end
    end
  end

end
