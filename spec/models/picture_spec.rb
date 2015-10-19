require 'spec_helper'

describe Picture, type: :model do
  it { should have_many(:comments).dependent(:destroy) }

  it { should have_attached_file(:image) }

end
