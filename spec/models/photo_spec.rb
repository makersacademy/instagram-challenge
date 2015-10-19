require 'rails_helper'

describe Photo, type: :model do

  it { is_expected.to respond_to(:image) }

  it { is_expected.to respond_to(:description) }

end
