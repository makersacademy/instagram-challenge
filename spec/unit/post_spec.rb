require 'rails_helper'

describe Post, type: :model do
  it 'is not valid with a description of less than one characters' do
    post = Post.new(description: "")
    expect(post).to have(1).error_on(:description)
    expect(post).not_to be_valid
  end
end
