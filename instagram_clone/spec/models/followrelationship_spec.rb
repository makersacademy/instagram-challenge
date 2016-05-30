require 'spec_helper'

describe Followrelationship, type: :model do

	it { should belong_to :follower }
	it { should belong_to :followed }

end