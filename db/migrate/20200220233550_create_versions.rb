class CreateVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :versions do |t|
      t.string :title, :default => '', null: false 
      t.integer :song_id
      t.timestamps
    end
  end
end
