class AddMessageStatusToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :message_status, :integer
  end
end
