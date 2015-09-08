require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }

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
end
