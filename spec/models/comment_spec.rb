require 'rails_helper'

describe Comment, type: :model do

  it "comments can be up to 140 characters" do
    comment = Comment.new(content: "This is a comment for an image on the instagram challenge, which is being used in a unit test")
    expect(comment).to have(0).error_on(:content)
  end

  it "comments cannot be longer than 140 characters" do
    comment = Comment.new(content: "This is a comment for an image on the instagram challenge, which is being used in a test to check that the comment cannot be longer than 140 characters long")
    expect(comment).to have(1).error_on(:content)
  end
end
