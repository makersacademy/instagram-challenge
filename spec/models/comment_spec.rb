require 'rails_helper'
require 'spec_helper'

describe Comment, type: :model do

  it { should belong_to :user }
  it { should belong_to :picture }

  it 'is invaild without any characters' do
    comment = Comment.new(comments: '')
    expect(comment).to have(1).error_on(:comments)
    expect(comment).not_to be_valid
  end

end
