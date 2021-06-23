class CreateArtistStory < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_stories do |t|
      t.string :story
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
