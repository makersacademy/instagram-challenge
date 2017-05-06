class RenamePhotosToExperiences < ActiveRecord::Migration[5.1]
  def change
    rename_table :photos, :experiences
  end
end
