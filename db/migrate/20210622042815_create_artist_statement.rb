class CreateArtistStatement < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_statements do |t|
      t.string :statement
      t.references :user, foreign_key: true
    end
  end
end
