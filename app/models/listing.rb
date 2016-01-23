class Listing < ActiveRecord::Base
  include ConvertToFormattedTime
  attr_accessor :hour, :mins
  
  validates :start_time, numericality: { only_integer: true }, inclusion: (1..1440)
end
