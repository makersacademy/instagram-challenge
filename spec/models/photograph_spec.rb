require "spec_helper"

describe Photograph, type: :model do

  it { should belong_to (:user) }
  it { should have_many (:comments) }

end
