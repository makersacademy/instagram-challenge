class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.belongs_to :image, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
    end
  end
end
