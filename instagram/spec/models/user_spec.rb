require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to be }

  describe "associations" do
    it { is_expected.to have_many(:pictures) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:username) }

    context "its username attribute" do
      it "can't be over 50 chars long" do
        expect(User.new).to_not allow_value("mrlocquacious_mrlocquacious_
        mr_locquacious").for(:username)
        expect(User.new).to allow_value("silentguy").for(:username)
    end
      it { is_expected.to validate_uniqueness_of(:username)}
  end

end
end
