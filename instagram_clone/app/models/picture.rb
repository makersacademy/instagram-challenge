class Picture < ActiveRecord::Base
  extend Dragonfly::Model
  dragonfly_accessor :image
end
