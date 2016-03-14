class AddDescriptionToHipstergrams < ActiveRecord::Migration
  def change
    add_column :hipstergrams, :description, :text
  end
end
