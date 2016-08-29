require 'rails_helper'

describe User do

  it { should have_many :photos }
  it { should have_many :comments }
  it { should have_many :commented_photos }

end
