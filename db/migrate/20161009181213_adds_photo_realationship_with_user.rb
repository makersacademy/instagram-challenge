class AddsPhotoRealationshipWithUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :photos, :user, foriegn_key: true
  end
end
