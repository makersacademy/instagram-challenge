require 'spec_helper'

describe Photo, type: :model do
  it { should have_many(:comments).dependent(:destroy) }

end