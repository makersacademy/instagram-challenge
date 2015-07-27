require 'rails_helper'

describe Tag, type: :model do

  it { is_expected.to have_and_belong_to_many(:images) }

end
