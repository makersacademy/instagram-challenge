require 'rails_helper'

describe Image, type: :model do

  it { is_expected.to belong_to(:user) }

end
