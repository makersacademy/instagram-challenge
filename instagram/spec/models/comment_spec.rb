require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to be }

  describe Comment.new(content: "Ur soo VaINn") do
    context "so that keyboard warriors use the site"
    it { is_expected.to have_attributes(:content => "Ur soo VaINn") }
  end
end
