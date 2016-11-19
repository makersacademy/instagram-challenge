class AddImageRefToLoves < ActiveRecord::Migration[5.0]
  def change
    add_reference :loves, :image, foreign_key: true
  end
end
