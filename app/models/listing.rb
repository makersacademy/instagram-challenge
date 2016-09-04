class Listing < ActiveRecord::Base
  include ConvertToFormattedTime
  include WithUserAssociationExtension

  attr_accessor :hour, :mins

  belongs_to :user, dependent: :destroy

  validates :start_time, numericality: { only_integer: true }, inclusion: (1..1440)
end
