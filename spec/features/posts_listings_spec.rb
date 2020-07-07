require 'rails_helper'

RSpec.feature 'Posts listings', type: :feature do

  before(:each) do
    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'davedude@example.com'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'
    
    @time = Time.zone.now

    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    click_on 'Post'
  end
  
  scenario 'Posts listed newest first' do
    
    click_on 'New post'
    attach_file 'post[image]', './images/post-image.jpg'
    select 'Greyscale', from: 'post[filter]'
    click_on 'Post'
    
    expect(first('.post')).to have_css '.filter_greyscale'
  end
  
  scenario 'Posts listed with time, in list and show' do
    formatted_date = @time.strftime("%-dth %b")
    formatted_time = @time.strftime("%l:%M%P")
    expect(page).to have_content formatted_time
    within(first('.post')) do
      find('a').click
    end
    expect(page).to have_content formatted_date
    expect(page).to have_content formatted_time
  end

  scenario 'Posts listed with username, in list and show' do
    expect(first('.post')).to have_content 'davedude'
    within(first('.post')) do
      find('a').click
    end
    expect(first('.post')).to have_content 'davedude'
  end
end
