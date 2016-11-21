require 'rails_helper'

RSpec.describe Pic, type: :model do

  it 'is not valid with a name of less than three characters' do
    moment = Pic.new(title: "kf")
    expect(moment).to have(1).error_on(:title)
    expect(moment).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    Pic.create(title: "Moe's Tavern")
    moment = Pic.new(title: "Moe's Tavern")
    expect(moment).to have(1).error_on(:title)
  end
end
