require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to be }

  describe "assoc" do
    it { is_expected.to belong_to(:picture)}
  end
  describe "validations" do
    it { is_expected.to validate_presence_of(:picture_id) }
    it { is_expected.to validate_presence_of(:content) }
  end
    context "content" do
      it "can't be over 100 chars long" do
        expect(Comment.new).to_not allow_value("thisisacommentthatwouldtotally,
        like,notbeacceptable,like,becauseitis,like,toolong.thisisacommentthatwouldtotally,
        like,notbeacceptable,like").for(:content)

        expect(Comment.new).to allow_value("lol").for(:content)
    end
  end

  describe Comment.new(content: "Ur soo VaINn") do

    context "so that flame wars are likely"
    it { is_expected.to have_attributes(:content => "Ur soo VaINn") }

  end
end
