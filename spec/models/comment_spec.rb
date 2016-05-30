require 'rails_helper'

describe Comment, type: :model do
  it "is invalid if the comment shorter than 2 characters" do
    comment = Comment.new(thoughts: "L")
    expect(comment).to have(1).error_on(:thoughts)
    expect(comment).not_to be_valid
  end
end
