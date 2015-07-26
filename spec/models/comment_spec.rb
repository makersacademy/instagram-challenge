require "rails_helper"

describe Comment, type: :model do
  it 'is invalid if the comment is blank' do
    comment = Comment.new
    expect(comment).to have(1).error_on(:comment)
  end
end
