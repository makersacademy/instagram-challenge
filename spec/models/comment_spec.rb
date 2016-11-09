require 'spec_helper'

describe Comment, type: :model do
  subject(:comment) { Comment.create name: 'User', body: 'My opinions' }

  it { should belong_to :post }
  it { should belong_to :user }


end
