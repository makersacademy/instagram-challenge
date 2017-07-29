require 'rails_helper'

RSpec.describe Like, type: :model do
  it { is_expected.to be }

  context "assoc" do
    it { is_expected.to belong_to(:picture)}
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:picture_id)}
  end

end
