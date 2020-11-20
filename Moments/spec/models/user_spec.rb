require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it {is_expected.to validate_presence_of :email}
  it {is_expected.to validate_presence_of :password}
end
