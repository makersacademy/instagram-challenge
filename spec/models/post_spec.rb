require 'rails_helper'

RSpec.describe Post, type: :model do
  it do
    should belong_to(:user)
  end
end
