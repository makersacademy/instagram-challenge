require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CommentsHelper. For example:
#
# describe CommentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CommentsHelper, type: :helper do
  context 'created_since' do
    it 'returns 0 for recently created objects' do
      expect(helper.created_since(Time.now)).to eq('0 hours ago')
    end

    it 'returns 1 for recently created objects' do
      expect(helper.created_since(Time.now - 3600)).to eq('1 hour ago')
    end

    it 'returns 1 for recently created objects' do
      expect(helper.created_since(Time.now - 7500)).to eq('2 hours ago')
    end
  end
end
