class AddPhotographRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :photograph, foreign_key: true
  end
end
