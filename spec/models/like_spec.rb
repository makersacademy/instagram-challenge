require 'rails_helper'

RSpec.describe Like, type: :model do
  it { is_expected.to be }

  describe "associations" do
    it { is_expected.to belong_to(:picture)}
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:picture_id) }
  end

end
