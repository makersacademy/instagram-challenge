require 'rails_helper'

RSpec.describe Post, type: :model do
  
  xit 'identifies image correctly' do
    post = Post.new()
    expect(post.identify_image('spec/files/unknown.jpg')).to include "Frog"
  end
end

