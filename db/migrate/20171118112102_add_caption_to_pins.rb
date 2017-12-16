class AddCaptionToPins < ActiveRecord::Migration[5.1]
  def change
    add_column :pins, :caption, :string
  end
end
