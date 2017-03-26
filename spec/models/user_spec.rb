require 'rails_helper'

describe User do

  it {is_expected.to have_many :liked_photographs}

end
