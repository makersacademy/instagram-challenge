require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to be }

  describe "associations" do
    it { is_expected.to belong_to(:picture)}
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:picture_id) }
    it { is_expected.to validate_presence_of(:content) }
  end

  context "its content attribute" do
      it "is limited to 100 chars" do
        expect(Comment.new).to_not allow_value("thisisacommentthatwouldtotally,
        like,notbeacceptable,like,becauseitis,like,toolong.thisisacommentthatwouldtotally,
        like,notbeacceptable,like").for(:content)
        expect(Comment.new).to allow_value("lol").for(:content)
    end
  end
end
