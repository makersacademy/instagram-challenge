class CreateJoinTablePostTag < ActiveRecord::Migration[5.0]
  def change
    create_join_table :posts, :tags do |t|
      # t.index [:post_id, :tag_id]
      # t.index [:tag_id, :post_id]
    end
  end
end
