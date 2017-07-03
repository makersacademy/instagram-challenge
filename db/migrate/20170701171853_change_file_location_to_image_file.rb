class ChangeFileLocationToImageFile < ActiveRecord::Migration[5.1]
  def change  
    change_table :photos do |t|
      t.rename :file_location, :image_file
    end
  end
end
