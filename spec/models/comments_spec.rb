require 'spec_helper'
require 'rails_helper'

describe Comment, type: :model do

  it { should belong_to(:picture) }
end
