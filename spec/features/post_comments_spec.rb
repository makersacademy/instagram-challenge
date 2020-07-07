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

    fill_in 'content', with: 'This is a comment'
    click_on 'Comment'
  end
  
  scenario 'User can Comment' do
    expect(first('.comment')).to have_content 'This is a comment'
  end

  scenario 'Comments appear newest first' do
    fill_in 'content', with: 'This is a newer comment'
    click_on 'Comment'

    expect(first('.comment')).to have_content 'This is a newer comment'
  end
  
  scenario 'Comments have username' do
    expect(first('.comment')).to have_content 'davedude'
  end

  scenario 'Comments have time' do
    formatted_date = @time.strftime("%-dth %b")
    formatted_time = @time.strftime("%l:%M%P")

    expect(first('.comment')).to have_content formatted_date
    expect(first('.comment')).to have_content formatted_time
  end

  scenario 'User cannot see comment form if signed out' do
    visit '/'
    click_on 'Log out'
    within(first('.post')) do
      find('a').click
    end
    
    expect(page).to_not have_button 'Comment'
  end
end
