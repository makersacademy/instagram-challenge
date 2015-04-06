require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do

    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Post an Image'
    end
  end


  context 'adding posts' do

    scenario 'display posts' do
      visit '/posts'
      click_link 'Post an Image'
      attach_file('Image', "#{Rails.root}/spec/support/uploads/cat.jpeg")
      click_button 'Create Post'
      expect(page).to have_xpath("//img[contains(@src,\"cat.jpeg\")]")
  end
end

  context 'deleting posts' do

  scenario 'removes a post when a user clicks a delete link' do
    visit '/posts'
    click_link 'Post an Image'
    attach_file('Image', "#{Rails.root}/spec/support/uploads/cat.jpeg")
    click_button 'Create Post'
    click_link 'Delete Post'
    expect(page).not_to have_xpath("//img[contains(@src,\"cat.jpeg\")]")
  end
end



end