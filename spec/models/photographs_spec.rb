require 'spec_helper'

describe Photograph, type: :model do
  it 'is not valid with a name of less than three characters' do
    photograph = Photograph.new(name: "ocean", image_file_name: "text.txt", image_content_type: "text")
    expect(photograph).to have(1).error_on(:image_content_type)
    expect(photograph).not_to be_valid
  end
end

describe 'comments' do
  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:photograph) { Photograph.create name: 'Test' }
    let(:comment_params) { {thoughts: 'great'} }

    subject(:comment) { photograph.comments.build_with_user(comment_params, user) }

    it 'builds a review' do
      expect(comment).to be_a Comment
    end

    it 'builds a review associated with the specified user' do
      expect(comment.user).to eq user
    end
  end
end
