class AddIndexToContacts < ActiveRecord::Migration[5.2]
  def change
    add_index :contacts, :message_status
  end
end
