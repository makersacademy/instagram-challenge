require 'rails_helper'

describe 'Post' do
  it 'Is not valid with a caption shorter than 3 characters' do
    post = Post.new(caption: 'zz')
    expect(post).not_to be_valid
  end
end
# RSpec.describe Post, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
