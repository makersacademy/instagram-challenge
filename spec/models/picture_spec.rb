require 'rails_helper'

describe Picture, type: :model do

	it "is not valid if created without a name" do
		picture = Picture.new
		expect(picture).to have(1).error_on(:name)
		expect(picture).not_to be_valid
	end
end