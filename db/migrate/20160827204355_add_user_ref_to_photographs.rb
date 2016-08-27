class AddUserRefToPhotographs < ActiveRecord::Migration
  def change
    add_reference :photographs, :user, index: true, foreign_key: true
  end
end
