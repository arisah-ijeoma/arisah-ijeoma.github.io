class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :artiste
      t.has_attached_file :audio

      t.timestamps null: false
    end
  end
end
