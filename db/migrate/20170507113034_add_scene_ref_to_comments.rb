class AddSceneRefToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :scene, foreign_key: true
  end
end
