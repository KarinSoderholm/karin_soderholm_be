class CreateArtshows < ActiveRecord::Migration[5.2]
  def change
    create_table :artshows do |t|
      t.string :name
      t.string :location
      t.date :start_date
      t.date :end_date
      t.float :entry_fee

      t.timestamps
    end
  end
end
