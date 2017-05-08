require 'rails_helper'

describe Turtlegram, type: :model do

  it 'should belong to User' do
    should belong_to(:user)
  end

  describe 'comments' do
    describe '#create_comment' do
      let(:user) {User.create email: 'test@test.com'}
      let(:turtlegram) {Turtlegram.create(caption: 'Shelly')}
      let(:comment_params) { {thoughts: 'such a lovely shell'} }

      subject(:comment) { turtlegram.create_comment(comment_params, user) }
      it 'builds a comment' do
        expect(comment).to be_a Comment
      end

      it 'builds a comment associated with the specified user' do
      expect(comment.user).to eq user
      end
    end
  end
end
