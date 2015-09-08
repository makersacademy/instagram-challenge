class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
    end
  end
end
