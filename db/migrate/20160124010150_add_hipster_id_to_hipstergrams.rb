class AddHipsterIdToHipstergrams < ActiveRecord::Migration
  def change
    add_reference :hipstergrams, :hipster, index: true, foreign_key: true
  end
end
