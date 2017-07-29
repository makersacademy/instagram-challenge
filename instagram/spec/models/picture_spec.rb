require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { is_expected.to be }

  context "assoc" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:user_id)}
  end

  describe Picture.new(caption: "selfie number 4364") do
    context "to make pics more descriptive" do
      it { is_expected.to have_attributes(:caption => "selfie number 4364") }
    end
  end

end
