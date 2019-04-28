require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  include Warden::Test::Helpers

  let(:user) {user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") }

  scenario 'User can like a post' do 
    login_as(user, :scope => :user)
    visit '/posts'
    click_button 'New post'
    page.attach_file("post_image", Rails.root + "spec/dpsks-courtyard-6463-hor-wide.jpg")
    click_button('Upload your image')
    find('#0').click
    click_button('Like')
    expect(page).to have_content('Likes: 1')


  end 

end 