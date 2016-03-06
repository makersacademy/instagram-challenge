class AddFilterClassToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :filter_class, :string
  end
end
