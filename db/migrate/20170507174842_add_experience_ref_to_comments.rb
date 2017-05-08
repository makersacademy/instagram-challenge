class AddExperienceRefToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :experience, foreign_key: true
  end
end
