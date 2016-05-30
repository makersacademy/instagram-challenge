class SetDefaultLikes < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.change :likes, :integer, {default:0}
    end
  end
end
