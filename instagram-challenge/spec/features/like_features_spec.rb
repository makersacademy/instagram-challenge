require 'rails_helper'

describe 'liking posts' do
before { Picture.create(description:'New picture') }
  # before do
  #   alex = User.create(...)
  #   alex.posts.create(title: 'cool post', description: 'hello world')
  # end


  it 'increments the like count of pictures' do
    visit '/pictures'
    click_link '♥ 0'
    expect(page).to have_link '♥ 1'
  end
end
