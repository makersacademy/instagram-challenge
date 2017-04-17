require 'rails_helper'

RSpec.describe Picture, type: :model do
    it { is_expected.to have_many :comments }

    it "is not valid unless it has a unique name" do
      Picture.create(name: "NCFC")
      picture = Picture.new(name: "NCFC")
      expect(picture).to have(1).error_on(:name)
    end
end
