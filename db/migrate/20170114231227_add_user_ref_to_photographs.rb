class AddUserRefToPhotographs < ActiveRecord::Migration[5.0]
  def change
    add_reference :photographs, :user, foreign_key: true
  end
end
