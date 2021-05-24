class AddBodyUserIdAnd < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :body, :string
    add_column :comments, :user_id, :int
    add_column :comments, :post_id, :int
  end
end
