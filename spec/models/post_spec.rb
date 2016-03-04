require 'rails_helper'
require 'spec_helper'

RSpec.describe Post, type: :model do
  it 'is not valid without image' do
    post = Post.new(caption: "some caption")
    expect(post).to have(1).error_on(:image)
    expect(post).not_to be_valid
  end
end
