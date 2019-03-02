require 'rails_helper'

RSpec.describe Post, type: :model do
  
  xit 'identifies image correctly' do
    post = Post.new()
    expect(post.identify_image('spec/files/unknown.jpg')).to include "Frog"
  end

  it 'populates the hashtags correctly' do
    post = Post.new()
    post.populate_hashtags(["Toy", "Wildlife", "Animal", "Frog", "Amphibian"])
    hashtag = Hashtag.first
    expect(hashtag.name).to eq 'Toy'
  end
end

