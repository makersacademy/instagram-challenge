class CreateTaggedPhotos < ActiveRecord::Migration
  def change
    create_table :tagged_photos do |t|

      t.timestamps null: false
    end
  end
end
