require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to be }

  context "assoc" do
    it { is_expected.to have_many(:pictures) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:username) }
  end

  describe User.new(username: "narcissus") do
    context "to clarify identity" do
      it { is_expected.to have_attributes(:username => "narcissus") }
    end
  end

end
