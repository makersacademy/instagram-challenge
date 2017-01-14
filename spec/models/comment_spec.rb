require 'rails_helper'

describe Comment, type: :model do

  it { should validate_presence_of(:text) }
  it { should belong_to :user }
  it { should belong_to :photo }

end
