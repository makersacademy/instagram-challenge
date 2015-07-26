class CreateJoinTableImageTag < ActiveRecord::Migration
  def change
    create_join_table :images, :tags do |t|
      t.index [:image_id, :tag_id]
      t.index [:tag_id, :image_id]
    end
  end
end
