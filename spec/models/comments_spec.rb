require 'spec_helper'

describe Comment, type: :model do
  it 'is not valid with a comment less than three characters' do
    comment = Comment.new(thoughts: 'XY')
    expect(comment).to have(1).error_on(:thoughts)
    expect(comment).not_to be_valid
  end
end