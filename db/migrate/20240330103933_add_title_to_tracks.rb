class AddTitleToTracks < ActiveRecord::Migration[7.1]
  def change
    add_column :tracks, :title, :string, null: false
  end
end
