require 'rails_helper'
RSpec.feature 'Post', type: :feature do
  include Warden::Test::Helpers


  let(:user) {user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password") }

  scenario 'Can submit posts and view them' do 
    login_as(user, :scope => :user)

    visit '/posts'

    click_button('New post')

# whether id or name


    page.attach_file("post_image", Rails.root + "spec/dpsks-courtyard-6463-hor-wide.jpg")
    click_button('Upload your image')
    # hope to see an image on the page
  
    expect(Post.count).to eq(1)


  end 

end 