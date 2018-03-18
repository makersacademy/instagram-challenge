class AddPaperclipToPicture < ActiveRecord::Migration[5.1]
  def change
    add_attachment :pictures, :image
  end
end
