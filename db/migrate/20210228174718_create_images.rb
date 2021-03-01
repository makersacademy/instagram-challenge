class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.text :caption
      t.timestamps
    end
  end
end

# rails g migration AddUserRefToPosts user:references
# and then rake db:migrate
