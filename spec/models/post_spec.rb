require 'rails_helper'

RSpec.describe Post, type: :model do

  it {is_expected.to belong_to(:user)}

  describe 'Images' do
    let(:user) { User.create email: 'test@test.test' }

    it 'should be valid with image file' do
      post = user.posts.new image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool'
      expect(post).to be_valid
    end

    it 'should not be valid without image file' do
      post = user.posts.new caption: 'Cool'
      expect(post).not_to be_valid
    end
  end

  describe 'Captions' do
    let(:user) { User.create email: 'test@test.test' }
    it 'should be valid with caption' do
      post = user.posts.new(image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'), caption: 'Cool')
      expect(post).to be_valid
    end

    it 'should not be valid without caption' do
      post = user.posts.new(image: File.new(Rails.root + 'spec/fixtures/images/freedom-beach.jpg'))
      expect(post).to have(1).error_on(:caption)
    end
  end


end
