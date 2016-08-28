require 'rails_helper'

feature 'liking posts' do

  photo = File.new(Rails.root + 'spec/fixtures/test.png')

  before do
    Post.create(image: photo, caption: 'My first post')
  end

  scenario 'a user can like a post' do

    sign_up
    click_link 'like'
    expect(page).to have_content('1 like')
  end



end
