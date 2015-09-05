require 'rails_helper'

RSpec.describe Comment, type: :model do
  it{ is_expected.to belong_to :photo }

  it "when a photo is deleted, it's comments are deleted too" do
	  photo = Photo.create(description: "Fujisan")
	  comment = photo.comments.create(comment: "Epic!")
	  expect { photo.destroy }.to change { Comment.count }.by(-1)
	end

end
