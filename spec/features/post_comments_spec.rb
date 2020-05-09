require 'rails_helper'

RSpec.feature 'Posts comments', type: :feature do

  before(:each) do
    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'davedude@example.com'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'

    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    click_on 'Post'

    within(first('.post')) do
      find('a').click
    end

    @time = Time.zone.now

    fill_in 'comment[content]', with: 'This is a comment'
    click_on 'Add comment'
  end
  
  scenario 'User can add comment' do
    expect(first('.comment')).to have_content 'This is a comment'
  end

  scenario 'Comments appear newest first' do
    fill_in 'comment[content]', with: 'This is a newer comment'
    click_on 'Add comment'

    expect(first('.comment')).to have_content 'This is a newer comment'
  end
  
  scenario 'Comments have username' do
    expect(first('.comment')).to have_content 'davedude'
  end

  scenario 'Comments have time' do
    formatted_time = @time.strftime("%-dth %b,%l:%M%P")

    expect(first('.comment')).to have_content formatted_time
  end

  scenario 'User cannot see comment form if signed out' do
    visit '/'
    click 'Log out'
    within(first('.post')) do
      find('a').click
    end
    
    expect(page).to_not have_button 'Add comment'
  end
end
