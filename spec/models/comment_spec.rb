require 'rails_helper'

RSpec.describe Comment, type: :model do
  it{ is_expected.to belong_to :photo }
  it{ is_expected.to belong_to :user }

  it "when a photo is deleted, it's comments are deleted too" do
	  photo = Photo.create(description: "Fujisan")
	  comment = photo.comments.create(comment: "Epic!")
	  expect { photo.destroy }.to change { Comment.count }.by(-1)
	end

	it "is not valid when comment has no chars/is blank" do
	  photo = Photo.create(description: "Fujisan")
	  comment = photo.comments.new(comment: "")
	  expect(comment).to have(1).error_on(:comment)
	  expect(comment).not_to be_valid
	end

	it "has a maximum length of 150 chars" do
    good_comment = 'X' * 150
    comment = Comment.create(comment: good_comment)
    expect(comment).to be_valid
	end

  it "is invalid when over 150 chars" do
    bad_comment = 'X' * 151
    comment = Comment.create(comment: bad_comment)
    expect(comment).not_to be_valid
  end

end
