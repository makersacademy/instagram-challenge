require 'rails_helper'
require 'spec_helper'

describe Comment, type: :model do
  it { should belong_to :photo }
end
