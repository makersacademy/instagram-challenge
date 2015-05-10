require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to have_many(:posts).dependent(:destroy)}
end
