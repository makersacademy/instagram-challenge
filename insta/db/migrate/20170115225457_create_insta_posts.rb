class CreateInstaPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :insta_posts do |t|
      t.string :description

      t.timestamps
    end
  end
end
