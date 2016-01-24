class CreateLikeBeforeCools < ActiveRecord::Migration
  def change
    create_table :like_before_cools do |t|
      t.belongs_to :hipstergram, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
