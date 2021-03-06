class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :email
      t.string :passwork_digest
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
