require 'rails_helper'

RSpec.describe Post, type: :model do
  context "associations" do
    it 'belongs to a user and has many comments' do
      should have_many(:comments)
      should belong_to(:user)
    end
  end
end
