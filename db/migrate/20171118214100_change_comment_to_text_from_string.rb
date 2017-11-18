class ChangeCommentToTextFromString < ActiveRecord::Migration[5.1]
  def change
    change_table :posts do |t|
      t.change :caption, :text
    end
  end
end
