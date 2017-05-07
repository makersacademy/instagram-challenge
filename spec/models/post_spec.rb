require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'Images' do
    it 'should be valid with image file' do
      post = Post.new image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool'
      expect(post).to be_valid
    end

    it 'should not be valid without image file' do
      post = Post.new caption: 'Cool'
      expect(post).not_to be_valid
    end
  end

  describe 'Captions' do
    it 'should be valid with caption' do
      post = Post.create image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool'
      expect(post).to be_valid
    end

    it 'should not be valid without caption' do
      post = Post.create image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg')
      expect(post).not_to be_valid
    end
  end


end
