class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
