require 'rails_helper'

describe Image, type: :model do

  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it { is_expected.to have_and_belong_to_many(:tags) }

end
