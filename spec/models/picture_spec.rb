require 'rails_helper'

describe Picture do

  it { is_expected.to belong_to :user }

end