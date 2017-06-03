class MakePostImageRequired < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :image_file_name, :string, :null => false
  end
end
