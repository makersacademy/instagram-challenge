require 'rails_helper'

describe Comment do

  it { is_expected.to belong_to :picture }
  it { is_expected.to belong_to :user }

  it 'has a maximum length of 140 characters' do
    valid_comment = 'A' * 140
    comment = Comment.new(description: valid_comment)
    expect(comment).to be_valid
  end

  it 'over 140 characters is invalid' do
    bad_comment = 'A' * 141
    comment = Comment.new(description: bad_comment)
    expect(comment).not_to be_valid
  end
end
