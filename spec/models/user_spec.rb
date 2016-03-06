require 'rails_helper'

describe User, type: :model do

  it { is_expected.to validate_uniqueness_of :user_name }

  it { is_expected.to have_many :photos}


end
