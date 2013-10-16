class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :source
      t.text :description
      t.references :post

      t.timestamps
    end
    add_index :songs, :post_id
  end
end
