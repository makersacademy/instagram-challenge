require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to be }

  describe "assoc" do
    it { is_expected.to have_many(:pictures) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:username) }

    context "username" do
      it "can't be over 50 chars long" do
        expect(User.new).to_not allow_value("mrlocquacious_mrlocquacious_
        mr_locquacious").for(:username)
        expect(User.new).to allow_value("silentguy").for(:username)
    end

    it "must be unique" do
      unique = User.new(username: "specialsnowflake").save
      expect(User.new).to_not allow_value("specialsnowflake").for(:username)
      expect(User.new).to allow_value("jkh").for(:username)
    end
  end

end

  describe User.new(username: "narcissus") do
    context "to clarify identity" do
      it { is_expected.to have_attributes(:username => "narcissus") }
    end
  end

end
