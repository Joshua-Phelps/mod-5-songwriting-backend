class AddRecordingToVersions < ActiveRecord::Migration[6.0]
  def change
    add_column :versions, :recording, :string
  end
end
