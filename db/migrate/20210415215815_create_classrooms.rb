class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :description
      t.string :image
      t.date :date
      t.time :time
      t.string :location
      t.string :requirements
      t.string :tools_needed
      t.float :cost
      t.boolean :active

      t.timestamps
    end
  end
end
