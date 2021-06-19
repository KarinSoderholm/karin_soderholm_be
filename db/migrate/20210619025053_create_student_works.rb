class CreateStudentWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :student_works do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
