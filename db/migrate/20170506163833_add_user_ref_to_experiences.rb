class AddUserRefToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_reference :experiences, :user, foreign_key: true
  end
end
