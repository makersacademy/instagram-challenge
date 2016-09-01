require 'rails_helper'

describe Photo, type: :model do
  it {is_expected.to belong_to(:user)}
end
