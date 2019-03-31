require 'rails_helper'

describe Ham, type: :model do
  it { is_expected.to be }
  #
  it "should not save ham without title" do
    ham = Ham.new(:title=>"fasdf", :text=>"sdffgfgh")
    found_ham = Ham.all
    expect(found_ham).to include("sdffgfgh")
  end
end
