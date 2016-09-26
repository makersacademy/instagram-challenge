require 'rails_helper'

feature 'creating, updating, deleting posts with images' do

  before do
    sign_up
    post_with_image
  end

  scenario 'can upload an image with a title and description' do
    expect(current_path).to eq '/posts/1'
    expect(page).to have_css('img')
    within('body') { expect(page).to have_content('Jonny Bravo') }
    within('body') { expect(page).to have_content('This is a cool pic') }
  end

  scenario 'can view a post on the index page' do
    click_link 'InstaClone'
    expect(page).to have_css('img')
    within('body') { expect(page).to have_content('Jonny Bravo') }
  end

  scenario 'can update title and description of a post' do
    click_on 'Edit'
    fill_in 'Title', with: 'Different Jonny Bravo'
    fill_in 'Description', with: 'This is an edited post'
    click_button 'Update Post'
    expect(current_path).to eq '/posts/3'
    expect(page).to have_css('img')
    within('body') { expect(page).to have_content('Different Jonny Bravo') }
    within('body') { expect(page).to have_content('This is an edited post') }
  end

  scenario 'can delete a post'  do
    click_on 'Delete'
    expect(current_path).to eq '/'
    within('body') { expect(page).not_to have_content('Jonny Bravo') }
  end

  scenario 'can like a post' do
    page.find(:css, 'a[href="/posts/5/like"]').click
    within('body') { expect(page).to have_content('1') }
  end
end
