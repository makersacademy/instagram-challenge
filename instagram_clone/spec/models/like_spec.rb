require 'spec_helper'

describe Like, type: :model do

	it { should belong_to :user }
	it { should belong_to :post }

end