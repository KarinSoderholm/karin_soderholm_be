class RemoveImageRequirementsToolsNeededFromClassroom < ActiveRecord::Migration[5.2]
  def change
    remove_column :classrooms, :image, :string
    remove_column :classrooms, :tools_needed, :string
    remove_column :classrooms, :requirements, :string
  end
end
