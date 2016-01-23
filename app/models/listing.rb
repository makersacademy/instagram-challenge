class Listing < ActiveRecord::Base
  include ConvertToFormattedTime
  attr_accessor :hour, :mins

end
