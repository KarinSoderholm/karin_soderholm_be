class RenameEmailEmailToEmailAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column :emails, :email, :email_address
  end
end
