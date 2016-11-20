class CreateJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :feeds, :photos do |t|
      # t.index [:feed_id, :photo_id]
      # t.index [:photo_id, :feed_id]
    end
  end
end
