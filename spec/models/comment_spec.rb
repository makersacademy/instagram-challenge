require 'rails_helper'

describe Comment, type: :model do
  it 'is not allowed to be empty' do
    comment = Comment.new(comment: '')
    expect(comment).to have(1).error_on(:comment)
  end
end
