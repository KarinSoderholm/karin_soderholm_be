class ChangeMessageStatusToContacts < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      CREATE TYPE message_status AS ENUM ('unread', 'read', 'responded', 'follow_up');
    SQL
    change_column :contacts, :message_status, :string, default: :unread
  end

  def down
    execute <<-SQL
      DROP TYPE message_status;
    SQL
  end
end
