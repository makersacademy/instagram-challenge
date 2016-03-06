require 'rails_helper'

RSpec.describe Comment, type: :model do
end

describe Picture, type: :model do 
	it {is_expected.to have_many :comments}
end
