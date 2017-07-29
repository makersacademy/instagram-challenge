require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to be }

  context "assoc" do
    it { is_expected.to belong_to(:picture)}
  end
  context "validations" do
    it { is_expected.to validate_presence_of(:picture_id) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe Comment.new(content: "Ur soo VaINn") do
    context "so that flame wars are likely"
    it { is_expected.to have_attributes(:content => "Ur soo VaINn") }
  end
end
