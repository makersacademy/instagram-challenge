class AddPhotographRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :photograph, index: true, foreign_key: true
  end
end
