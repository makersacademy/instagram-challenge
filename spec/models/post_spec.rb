require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is not valid to submit a post without image' do
    post = Post.new(description: 'Something very cool')
    expect(post).to have(1).error_on(:image)
    expect(post).not_to be_valid
  end
end
