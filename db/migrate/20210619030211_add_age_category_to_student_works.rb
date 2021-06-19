class AddAgeCategoryToStudentWorks < ActiveRecord::Migration[5.2]
  def change
    execute <<-SQL
      CREATE TYPE age_category AS ENUM ('young_adult', 'adult');
    SQL
    add_column :student_works, :age_category, :string, default: :young_adult
  end
end
