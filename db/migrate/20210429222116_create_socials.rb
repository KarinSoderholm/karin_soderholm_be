class CreateSocials < ActiveRecord::Migration[5.2]
  def change
    create_table :socials do |t|
      t.string :linked_in, null: true
      t.string :facebook, null: true
      t.string :instagram, null: true
      t.string :pinterest, null: true
      t.string :twitter, null: true
      t.string :email, null: true
      t.references :user, foreign_key: true
    end
  end
end
