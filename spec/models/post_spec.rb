require 'rails_helper'

RSpec.describe Post, :type => :model do

  pending it "creates a post with parameters" do

  Post.create(title: 'Poppy')
  p Post.all
  expect(Post.count).to eq(1)
  end
end
