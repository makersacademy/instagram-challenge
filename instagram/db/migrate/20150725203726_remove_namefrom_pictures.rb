class RemoveNamefromPictures < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.remove :name
    end
  end
end
