require 'rails_helper'

RSpec.describe Picture, type: :model do
end
describe Picture, type: :model do 
	it {is_expected.to have_many :tags}
end
