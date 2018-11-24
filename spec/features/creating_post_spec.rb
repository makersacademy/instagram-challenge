require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'User can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/cofee.jpg")
  end
end
