require 'spec_helper'

describe Comment, type: :model  do

  it { should belong_to(:user)}
  it { should belong_to(:post)}

end
