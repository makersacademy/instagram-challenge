class AddFilterspamIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :filterspam, index: true, foreign_key: true
  end
end
