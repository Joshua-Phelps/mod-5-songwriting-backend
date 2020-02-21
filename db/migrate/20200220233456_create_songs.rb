class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :lyrics
      t.integer :collection_id

      t.timestamps
    end
  end
end
