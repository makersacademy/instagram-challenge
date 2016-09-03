require "rails_helper"

describe Post, type: :model do
  it "is not valid with a description less than 3 characters" do
    post = Post.new(caption: "Se")
    expect(post).to have(1).error_on(:caption)
    expect(post).not_to be_valid
  end

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }
end
