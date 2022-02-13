require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    user = User.create(
      {name: 'test name',
       usernname: 'test username', 
       email: 'test@test.com', 
       password: '123456'})

    Post.delete_all
    @post = Post.create(
      {caption: "#Donuts", 
       image: Rack::Test::UploadedFile.new(Rails.root.join('spec/test_image.jpg'), 'image/jpg'),
       user_id: 1})

  end

  it('creates a post with valid data') do
    expect(@post).to be_valid
  end

  it('can read a post') do
    expect(Post.find_by_caption("#Donuts")).to eq(@post)
  end
  
end
