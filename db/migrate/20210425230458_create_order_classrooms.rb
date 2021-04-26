class CreateOrderClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :order_classrooms do |t|
      t.references :classroom, foreign_key: true
      t.references :order, foreign_key: true
      t.float :price
      t.integer :quantity
      t.boolean :fulfilled, default: false

      t.timestamps
    end
  end
end
