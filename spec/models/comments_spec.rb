require "rails_helper"

describe Comment, type: :model do
  it "is not valid if empty" do
    comment = Comment.new(comment: "")
    expect(comment).to have(1).error_on(:comment)
    expect(comment).not_to be_valid
  end

  it { is_expected.to belong_to :user }
end
