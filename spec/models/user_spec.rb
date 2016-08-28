require "spec_helper"

describe User, type: :model do

  it { should have_many (:photographs) }
  it { should have_many (:comments) }
  it { should have_many (:commented_photographs) }

end
