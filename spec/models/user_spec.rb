require "rails_helper"

 describe User, type: :model do
   it { is_expected.to have_many(:photos) }

   it { is_expected.to have_many :comments }
   
 end
