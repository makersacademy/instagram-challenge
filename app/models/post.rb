class Post < ApplicationRecord

  def self.reverse_order
    all.reverse
  end

end
