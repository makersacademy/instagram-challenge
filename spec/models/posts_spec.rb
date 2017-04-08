require 'rails_helper'

describe Post, type: :model do

  it 'has many likes' do
    post = Post.create(image:File.new('/Users/ashwinimani/Pictures/indian_food.jpg'), description: 'delicious')
    expect(post).to have_many :likes
  end

  it 'has many comments' do
    post = Post.create(image:File.new('/Users/ashwinimani/Pictures/indian_food.jpg'), description: 'delicious')
    expect(post).to have_many :comments
  end

  # it 'belong to a user' do
  #   post = Post.create(image:File.new('/Users/ashwinimani/Pictures/indian_food.jpg'),description: 'delicious')
  #   expect(post).to belong_to :user
  # end

end
