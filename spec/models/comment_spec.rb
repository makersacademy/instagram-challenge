require 'rails_helper'

RSpec.describe Comment, type: :model do
  it do
    should belong_to(:user)
  end
  
  it do
    should belong_to(:post)
  end
end
