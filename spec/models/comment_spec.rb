require 'rails_helper'
require 'spec_helper'

describe Comment, type: :model do

  it { should belong_to :photo }

  it { should belong_to :user }

  it 'is not valid without any characters' do
    comment = Comment.new(words: '')
    expect(comment).to have(1).error_on(:words)
    expect(comment).not_to be_valid
  end

end
