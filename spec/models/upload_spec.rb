require 'rails_helper'

describe Upload, type: :model do
  it {is_expected.to belong_to :user}
end