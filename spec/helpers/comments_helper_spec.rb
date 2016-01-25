require 'rails_helper'

describe CommentsHelper, type: :helper do
  context '#generate_json' do
    let!(:empty_comments) { Comment.none }
    let!(:comment1) { create(:comment) }
    let!(:comment2) { create(:comment) }
    let!(:comments) { Comment.all }
    let!(:json) do
    [
      { username: comment1.username, content: comment1.content },
      { username: comment2.username, content: comment2.content }
    ]
    end
    it 'returns an empty array if no comments are in the collection' do
      expect(helper.generate_json(empty_comments)).to eq []
    end
    it 'returns a particular json file to update comments' do
      expect(helper.generate_json(comments)).to eq json
    end
  end
end
