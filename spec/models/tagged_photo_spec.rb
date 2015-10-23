require 'rails_helper'

RSpec.describe TaggedPhoto, type: :model do
  it { is_expected.to belong_to :tag }
  it { is_expected.to belong_to :photo }
end
