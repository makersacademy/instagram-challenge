require 'rails_helper'

RSpec.feature 'User can only interact with own posts', type: :feature do

  before(:each) do
    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'davedude@example.com'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'
  end
  
  scenario 'User clicks on another users post, expects not to see edit or delete option' do
    other_user = User.create(name: 'Other Guy', email: 'otherguy@example.com', username: 'otherguy', password: 'password123')
    other_post = other_user.posts.create(filter: 'Greyscale')
    images_dir = Dir.pwd + '/images/post-image.jpg'
    other_post.image.attach(io: File.open(images_dir), filename: 'post-image.png')
    
    refresh
    within(first('.post')) do
      find('a').click
    end
    expect(page).to_not have_content 'Edit'
    expect(page).to_not have_content 'Delete'
  end
end
