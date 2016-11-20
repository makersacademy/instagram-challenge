class AddUserRefToEndorsements < ActiveRecord::Migration[5.0]
  def change
    add_reference :endorsements, :user, foreign_key: true
  end
end
