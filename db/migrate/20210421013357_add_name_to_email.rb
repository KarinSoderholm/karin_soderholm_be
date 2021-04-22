class AddNameToEmail < ActiveRecord::Migration[5.2]
  def change
    add_column :emails, :name, :string
  end
end
