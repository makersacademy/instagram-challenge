require 'rails_helper'

RSpec.describe Like, type: :model do
  it {is_expected.to belong_to :user}

  it {is_expected.to belong_to :image}
end
