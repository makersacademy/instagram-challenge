require 'rails_helper'

RSpec.describe Hipstergram, type: :model do

  it { should have_attached_file(:image) }
  it { should validate_attachment_presence(:image) }
  it { should belong_to(:hipster) }
  #it { should have_many(:comments) } 
  it { should have_many(:like_before_cools) }

end
