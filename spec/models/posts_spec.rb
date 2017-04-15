require 'rails_helper'

describe Post, type: :model do

  before :each do
    @post = Post.create(image:File.new('spec/helpers/indian_food.jpg'), description: 'delicious')
  end

  it 'has many likes' do
    expect(@post).to have_many :likes
  end

  it 'has many comments' do
    expect(@post).to have_many :comments
  end

  it 'belong to a user' do
    expect(@post).to belong_to :user
  end

end
