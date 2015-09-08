require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:user2) { create(:user2) }

  it { is_expected.to belong_to(:photo) }

  it { is_expected.to belong_to(:user) }

  it 'is not valid when it is not made by a user' do
    comment = Comment.create(contents: 'test')
    expect(comment).not_to be_valid
  end

  it 'it valid when it is made by a user' do
    comment = user.comments.create(contents: 'test')
    expect(comment).to be_valid
  end

  it 'is destroyed when deleted by its creator' do
    comment = user.comments.create(contents: 'test')
    comment.destroy_as_user(user)
    expect(Comment.all.last).to eq nil
  end

  it 'is not destroyed when deleted by some other user' do
    comment = user.comments.create(contents: 'test')
    comment.destroy_as_user(user2)
    expect(Comment.all.last).to eq comment
  end
end
