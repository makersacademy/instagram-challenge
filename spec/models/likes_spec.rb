require 'rails_helper'

describe Like do

  it {is_expected.to belong_to(:post).dependent(:destroy) }
  
end
