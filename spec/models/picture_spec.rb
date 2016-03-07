require 'rails_helper'

describe Picture, type: :model do
  it { should belong_to(:user) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to have_many(:likes).dependent(:destroy) }

end
