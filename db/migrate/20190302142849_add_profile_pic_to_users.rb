# frozen_string_literal: true

class AddProfilePicToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_pic, :string, default: 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973461_1280.png'
  end
end
