require 'spec_helper'

describe User, type: :model do

	it { should have_many :posts }
	it { should have_many :comments }
  it { should have_many :likes }
  it { should have_many :liked_posts }

end