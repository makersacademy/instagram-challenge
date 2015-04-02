require 'rails_helper'

describe ReviewsHelper, :type => :helper do
  context "#star_rating" do
    it "does nothing for not a number" do
      expect(helper.star_rating('N/A')).to eq "N/A"
    end
    
    it '5 stars for a rating of 5' do
      expect(helper.star_rating(5)). to eq '★★★★★'
    end

    it '3 stars for a rating of 5' do
      expect(helper.star_rating(3)). to eq '★★★☆☆'
    end

    it '3 stars for a rating of 3.5' do
      expect(helper.star_rating(3)). to eq '★★★☆☆'
    end
  end
end
