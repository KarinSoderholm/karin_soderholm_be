class CreateCommissionBloomingMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :commission_blooming_maps do |t|
      t.string :customer_name
      t.string :customer_email
      t.string :customer_phone
      t.string :message
      t.string :map_city
      t.string :map_state
      t.string :map_country
      t.string :map_flower
      t.string :map_color

      t.timestamps
    end
  end
end
