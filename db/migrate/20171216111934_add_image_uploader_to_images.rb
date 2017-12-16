class AddImageUploaderToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :ImageUploader, :string
  end
end
