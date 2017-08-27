class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :text

      t.timestamps
    end

    create_table :photos_tags, id: false do |t|
      t.belongs_to :photo, index: true
      t.belongs_to :tag, index: true
    end
  end
end
